import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/screens/auths/sharedPreference.dart';
import 'package:trust_money/utils/colorsConstant.dart';

import '../../utils/images.dart';

class InvalidPanName extends StatefulWidget {
  InvalidPanName({Key? key, required this.msg}) : super(key: key);
  String msg = "";

  @override
  State<InvalidPanName> createState() => _InvalidPanNameState();
}

class _InvalidPanNameState extends State<InvalidPanName> {
  String firstName = "";
  String lastName = "";

  getPreferences() async {
    firstName = await HelperFunctions.getFirstName();
    lastName = await HelperFunctions.getLastName();
    print("============panName $firstName");
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
              ConstantImage.card,
              height: 150,
              width: 150,
            ),
          ),
          Text("Hi [$firstName $lastName]",
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: AppColors.textColor)),
          const SizedBox(
            height: 15,
          ),
          const Text("Your PAN is",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColors.textColor)),
          Text("${widget.msg}",
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  letterSpacing: 2,
                  color: AppColors.btnColor)),
          const SizedBox(
            height: 15,
          ),
          const Text("Please provide on valid \nPAN Number",
              textAlign: TextAlign.center,
              style: TextStyle(
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
                Navigator.pop(context);
              },
              child: Container(
                height: 45,
                color: AppColors.btnColor,
                child: Center(
                    child: Text(
                  "Re-enter PAN number",
                  style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          color: Colors.white,
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
