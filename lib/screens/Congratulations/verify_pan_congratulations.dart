import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/getx_controller/personal_details_controller.dart';
import 'package:trust_money/screens/kyc/profile/digilocker/kra_record.dart';
import 'package:trust_money/utils/sharedPreference.dart';
import 'package:trust_money/utils/colorsConstant.dart';

import '../../getx_controller/auth/pan/pan_controller.dart';
import '../../utils/images.dart';

class PANVerified extends StatelessWidget {
  PANVerified({Key? key, required this.onClick}) : super(key: key);
  final void Function()? onClick;
  PanCardUserDeatils _panCardUserDeatils = Get.put(PanCardUserDeatils());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              ConstantImage.profile,
              height: 150,
              width: 150,
            ),
          ),
          Text(
              "Hi ${_panCardUserDeatils.panDataModal!.panFname} ${_panCardUserDeatils.panDataModal!.panMname} ${_panCardUserDeatils.panDataModal!.panLname}",
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: AppColors.textColor)),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: InkWell(
              onTap: () {
                onClick!();
              },
              child: Container(
                alignment: Alignment.center,
                color: AppColors.textColor,
                child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 6.0, left: 4, right: 4, top: 6),
                  child: Text(
                    "I confirm to open the account in the same name of \n ${_panCardUserDeatils.panDataModal!.panFname} ${_panCardUserDeatils.panDataModal!.panMname} ${_panCardUserDeatils.panDataModal!.panLname} ",
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.5, color: AppColors.textColor)),
                child: Center(
                    child: Text(
                  "Wrong name? -Re-enter PAN number",
                  style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          color: AppColors.textColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w500)),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
