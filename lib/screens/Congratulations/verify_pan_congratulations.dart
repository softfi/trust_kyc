import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/screens/kyc/profile/digilocker/kra_record.dart';
import 'package:trust_money/utils/sharedPreference.dart';
import 'package:trust_money/utils/colorsConstant.dart';

import '../../utils/images.dart';

class PANVerified extends StatelessWidget {
  const PANVerified({Key? key,required this.onClick}) : super(key: key);
  final void Function()? onClick;

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
          Text("Hi [JAiRaj]",
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: AppColors.textColor)),
          const SizedBox(height: 25,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: InkWell(
              onTap: () {
               onClick!();
              },
              child: Container(
                alignment: Alignment.center,
                height: 58,
                color: AppColors.textColor,
                child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 2.0, left: 2, right: 2, top: 5),
                  child: Text(
                    "I confirm to open the account in the same name of [Jairaj]",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20,),
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


