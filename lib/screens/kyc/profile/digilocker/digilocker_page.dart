import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:trust_money/screens/home/webview.dart';

import '../../../../getx_controller/kra/kra_controller.dart';
import '../../../../model/digiLocker_response_data.dart';
import '../../../../repositories/profile_repository.dart';
import '../../../../utils/colorsConstant.dart';
import '../../../../utils/helper_widget/custom_snsckbar.dart';
import '../../../../utils/images.dart';
import '../../../../utils/strings.dart';
import '../../../../utils/styles.dart';

class Digilocker extends StatelessWidget {
  Digilocker({Key? key}) : super(key: key);
  KRAController _kRAController = Get.put(KRAController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              ConstantImage.TrustIcon,
              height: 60,
              width: 60,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 450,
            margin: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                color: Color(0x29000000),
                blurRadius: 6.0,
              ),
            ], color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Digilocker KYC",
                  style: ConstStyle.sourceSans1,
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "Please share your aadhaar card from digilocker",
                  style: ConstStyle.sourceSansPro,
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Fetch document From Digilocker",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xff0c2aec),
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(() => Checkbox(
                          checkColor: Colors.white,
                          activeColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: _kRAController.isChecked.value,
                          onChanged: (bool? value) {
                            _kRAController.isChecked.value = value!;
                          },
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.75,
                          height: 100,
                          child: Text(Strings.digiText,
                              style: ConstStyle.sourceSansPro)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_kRAController.isChecked.value == true) {
                      Get.to(() => MyWebView());
                    } else {
                      ShowCustomSnackBar()
                          .ErrorSnackBar("Please check the agreement first");
                    }
                  },
                  child: const Text(
                    'Authenticate Aadhaar',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
