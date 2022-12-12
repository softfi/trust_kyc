import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/screens/bond/tringle.dart';

import '../../../utils/colorsConstant.dart';
import '../../home/custom_listtile.dart';
import '../../news_and_insights/explore.dart';

class EditorList extends StatelessWidget {
  EditorList({
    Key? key,
    required this.image,
    required this.title,
    required this.date,
    required this.readText,
  }) : super(key: key);

  Widget image;
  String title, date, readText;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: false,
      leading: image,
      title: Text(
        title,
        style: GoogleFonts.quicksand(
            textStyle: const TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 16)),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 6.0),
        child: Row(
          children: [
            Text(
              date,
              style: GoogleFonts.sourceSansPro(
                  textStyle: const TextStyle(
                      color: AppColors.btnColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 12)),
            ),
            const SizedBox(
              width: 10,
            ),
            ClipPath(
              clipper: Triangle(),
              child: Container(
                color: Color(0xffE1E0E7),
                height: 16,
                width: 75,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      readText,
                      style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 9)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
