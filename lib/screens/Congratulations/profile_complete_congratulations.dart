import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/utils/colorsConstant.dart';

class CustomCongratulations extends StatelessWidget {
  CustomCongratulations({Key? key, required this.title, required this.image})
      : super(key: key);
  String? title, image;

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
              image!,
              height: 150,
              width: 150,
            ),
          ),
          Text(
            title!,
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
