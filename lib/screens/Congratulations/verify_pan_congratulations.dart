import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/screens/auths/sharedPreference.dart';
import 'package:trust_money/utils/colorsConstant.dart';

import '../../utils/images.dart';

class PANVerified extends StatefulWidget {
  const PANVerified({Key? key}) : super(key: key);


  @override
  State<PANVerified> createState() => _PANVerifiedState();
}

class _PANVerifiedState extends State<PANVerified> {
  String panName = "";

  getPreferences() async {
    panName = await HelperFunctions.getPanName();
    print("============panName $panName");
    setState(() {});
  }

  @override
  void initState() {
    getPreferences();
    super.initState();
  }

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
          Text("Hi [$panName]",
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: AppColors.textColor)),
          const SizedBox(height: 25,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
              child: Container(
                alignment: Alignment.center,
                height: 58,
                color: AppColors.textColor,
                child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 2.0, left: 2, right: 2, top: 5),
                  child: Text(
                    "I confirm to open the account in the same name of [$panName]",
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
