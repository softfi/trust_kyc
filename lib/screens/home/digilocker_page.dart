import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trust_money/screens/home/webview.dart';

import '../../model/digiLocker_response_data.dart';
import '../../repositories/profile_repository.dart';
import '../../utils/colorsConstant.dart';
import '../../utils/images.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';

class Digilocker extends StatefulWidget {
  const Digilocker({Key? key}) : super(key: key);

  @override
  _DigilockerState createState() => _DigilockerState();
}

class _DigilockerState extends State<Digilocker> {
  bool isChecked = false;
  DigiLockerModel? digiLockerModel;

  authenticateDigiLocker() async {
    var res1 = await ProfileRepository().digiLocker();
    print("============9007 $res1");
    setState(() {
      if (res1 != null && res1 != "") {
        digiLockerModel = res1;
        setState(() {});
      }
    });
  }

  @override
  void initState() {
    authenticateDigiLocker();
    super.initState();
  }

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
                    Checkbox(
                      checkColor: Colors.white,
                      activeColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
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
                    if (isChecked == true) {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyWebView(
                                    url: digiLockerModel !=null?digiLockerModel!.link: "",
                                  )));
                    } else {
                      Fluttertoast.showToast(
                          msg: "Please check the agreement first");
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

                /*  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
                      style: ConstStyle.sourceSans1,
                    ))*/
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          /*  RichText(
            text: const TextSpan(children: [
              TextSpan(
                  text: "Powered by ",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff22263D))),
              TextSpan(
                  text: "digio",
                  style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffa327ec))),
            ]),
          ),*/
        ],
      ),
    );
  }
}
