import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';
import 'package:trust_money/utils/colorsConstant.dart';

import '../../utils/app_bar.dart';
import '../../utils/strings.dart';

class Disclaimer extends StatelessWidget {
  const Disclaimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppToolbar.appBar(
          "DISCLAIMER",
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          IconButton(
            icon: Container(
                padding: const EdgeInsets.all(1),
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                child: const Icon(Icons.person,
                    size: 20, color: Color(0xff00C6D8))),
            onPressed: () {},
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Important Legal Information And Disclaimer",
                style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                Strings.disc1,
                style: GoogleFonts.sourceSansPro(
                    textStyle: const TextStyle(
                        height: 1.2,
                        color: Color(0xff9199A1),
                        fontWeight: FontWeight.w500,
                        fontSize: 16)),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                Strings.disc2,
                style: GoogleFonts.sourceSansPro(
                    textStyle: const TextStyle(
                        height: 1.2,
                        color: Color(0xff9199A1),
                        fontWeight: FontWeight.w500,
                        fontSize: 16)),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                Strings.disc3,
                style: GoogleFonts.sourceSansPro(
                    textStyle: const TextStyle(
                        height: 1.2,
                        color: Color(0xff9199A1),
                        fontWeight: FontWeight.w500,
                        fontSize: 16)),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                Strings.disc4,
                style: GoogleFonts.sourceSansPro(
                    textStyle: const TextStyle(
                        height: 1.2,
                        color: Color(0xff9199A1),
                        fontWeight: FontWeight.w500,
                        fontSize: 16)),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Governing Law",
                style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                Strings.governText,
                style: GoogleFonts.sourceSansPro(
                    textStyle: const TextStyle(
                        height: 1.2,
                        color: Color(0xff9199A1),
                        fontWeight: FontWeight.w500,
                        fontSize: 16)),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Disclaimer For Research Reports",
                style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                Strings.governText,
                style: GoogleFonts.sourceSansPro(
                    textStyle: const TextStyle(
                        height: 1.2,
                        color: Color(0xff9199A1),
                        fontWeight: FontWeight.w500,
                        fontSize: 16)),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
