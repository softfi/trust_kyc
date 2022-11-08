import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/utils/colorsConstant.dart';

import '../../utils/images.dart';

class EmailComplete extends StatefulWidget {
  const EmailComplete({Key? key}) : super(key: key);

  @override
  State<EmailComplete> createState() => _EmailCompleteState();
}

class _EmailCompleteState extends State<EmailComplete> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pop(context);
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
              ConstantImage.email,
              height: 150,
              width: 150,
            ),
          ),
          Text(
            "Congratulations! your Email ID \nVerified Successfully",
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
