import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';
import 'package:trust_money/utils/styles.dart';

import '../../utils/app_bar.dart';
import '../../utils/app_bar.dart';
import '../../utils/colorsConstant.dart';
import '../../utils/strings.dart';

class TermsConditons extends StatelessWidget {
  const TermsConditons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppToolbar.appBar("TERMS OF USE",IconButton(
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
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Text("Trust Securities Services is the Non-Institutional Clientele vertical of one of India's leading full-service financial houses, TRUST Group.\n ",style: GoogleFonts.sourceSansPro(
              textStyle: TextStyle(
                height: 1.5,
                  fontSize: 16,
                  color: Color(0xff22263D)
              ),

            ),) ,
                Text("IMPORTANT",style: GoogleFonts.quicksand(
                  textStyle: TextStyle(
                    fontWeight:FontWeight.bold,
                      height: 1.5,
                      fontSize: 16,
                      color: Color(0xff22263D)
                  ),
                ),) ,
                SizedBox(height: 5,),
                Text("By accessing this website and any of its pages or sections, you are agreeing to the terms set out herein. Since there may be specific additional disclaimers contained at other pages or sections of this website, you agree to abide by all of such disclaimers in addition to the terms contained herein. If you do not agree to these terms, do not access this website. By accessing this website or any section of pages thereof, you agree that the exclusions and limitations of liability set out in this website terms of use and disclaimer are reasonable. If you do not think they are reasonable, you must not access this website. \nThe information provided on this website is not intended or directed to or for distribution to, or use by any U.S. Person.",style: GoogleFonts.sourceSansPro(
                  textStyle: TextStyle(
                      height: 1.3,
                      fontSize: 16,
                      color: Color(0xff9199A1)
                  ),

                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
