
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/utils/sharedPreference.dart';

import '../../utils/colorsConstant.dart';
import '../../utils/images.dart';
import '../../utils/styles.dart';
import 'congratulations.dart';

class Continue extends StatefulWidget {
  const Continue({Key? key}) : super(key: key);
  @override
  State<Continue> createState() => _ContinueState();
}

class _ContinueState extends State<Continue> {
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                ConstantImage.thumb,
                height: 108,
                width: 114,
              ),
            ),
            _space,
            Center(
              child: Text(
                "Your form has been \n received successfully.",
                style: ConstStyle.quickStandMedium,
                textAlign: TextAlign.center,
              ),
            ),
            _space,
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Congratulation()));
              },
              child: Container(
                height: 45,
                decoration: BoxDecoration(color: AppColors.btnColor),
                child: Center(
                    child: Text(
                      "Alright, Continue",
                      style: GoogleFonts.quicksand(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _space => const SizedBox(height: 30);
}