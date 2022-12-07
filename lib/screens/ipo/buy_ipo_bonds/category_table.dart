import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colorsConstant.dart';

class CategoryTable extends StatelessWidget {
  const CategoryTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
          color: const Color(0xff707070),
          width: 1,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10))),
      children: [
        TableRow(
            decoration: const BoxDecoration(
              color: AppColors.btnColor,
            ),
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Category",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 10),
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "I - Institutional",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 10),
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "II - Non-Institutiona1",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 10),
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "III - HNI",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 10),
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "IV - Retail",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 10),
                    ),
                  ),
                ),
              ),
            ]),
        TableRow(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffDBF6FA),
                  Color(0xffFFD5D9),
                ],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
              ),
            ),
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Category Allocation",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "25%",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "35%",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "15%",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "25%",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ),
                ),
              ),
            ]),
      ],
    );
  }
}
