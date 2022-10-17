import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/utils/sharedPreference.dart';
import 'package:trust_money/utils/colorsConstant.dart';

import '../../utils/images.dart';

class ProfileComplete extends StatefulWidget {
  const ProfileComplete({Key? key}) : super(key: key);

  @override
  State<ProfileComplete> createState() => _ProfileCompleteState();
}

class _ProfileCompleteState extends State<ProfileComplete> {
  String panNumber = "";

  getPreferences() async {

    print("============pName $panNumber");
    setState(() {});
  }


  @override
  void initState() {
    getPreferences();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pop(context);
    });
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
          Text(
            "Congratulations! $panNumber \nIdentity Verification \ncompleted Successfully",
            textAlign: TextAlign.center,
            style: GoogleFonts.quicksand(
              textStyle: const TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
