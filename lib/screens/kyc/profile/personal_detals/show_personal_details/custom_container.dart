import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DesableTitleText extends StatelessWidget {
  DesableTitleText({Key? key, required this.title}) : super(key: key);

  String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.sourceSansPro(
        textStyle: const TextStyle(
            color: Color(0xff22263D),
            letterSpacing: 2,
            fontWeight: FontWeight.w500,
            fontSize: 16),
      ),
    );
  }
}

class MyContainer {
  static verifiedContainer() {
    return Container(
      height: 30,
      width: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7), color: Colors.green),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.check_circle_outline,
            size: 16,
            color: Colors.white,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            "Verified",
            style: GoogleFonts.sourceSansPro(
              textStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  static updateContainer() {
    return Container(
      height: 30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Color(0xff00C6D8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/edit.png",
              scale: 6,
              color: Colors.white,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "Update",
              style: GoogleFonts.sourceSansPro(
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
