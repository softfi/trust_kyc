import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colorsConstant.dart';

class CustomTile extends StatelessWidget {
  CustomTile({
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
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.35),
          spreadRadius: 2,
          blurRadius: 11,
          offset: Offset(0, 3),
        ),
      ], color: Colors.white, borderRadius: BorderRadius.circular(6)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 23,
                        width: 80,
                        color: AppColors.btnColor,
                        child: Center(
                          child: Text(readText,
                              style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12))),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        date,
                        style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 12)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Icon(
                    CupertinoIcons.arrow_right,
                    color: AppColors.primaryColor,
                  )
                ],
              )
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.27,
              child: Center(child: image),
            )
          ],
        ),
      ),

     /* ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 0),
        trailing: image,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Container(
                  height: 23,
                  width: 80,
                  color: AppColors.btnColor,
                  child: Center(
                    child: Text(readText,
                        style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 12))),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  date,
                  style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 12)),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
            ),
            const SizedBox(
              height: 10,
            ),
            const Icon(
              CupertinoIcons.arrow_right,
              color: AppColors.primaryColor,
            )
          ],
        ),
      )*/

    );
  }
}
