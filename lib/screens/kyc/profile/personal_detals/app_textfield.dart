import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/utils/styles.dart';

import '../../../../utils/colorsConstant.dart';

class AppTextField extends StatelessWidget {
  AppTextField(
      {Key? key,
      required this.hint,
      required this.textInputType,
      required this.textCapitalization,
      required this.controller,
      this.lengthFormater,
      })
      : super(key: key);
  String hint;
  LengthLimitingTextInputFormatter? lengthFormater;
  TextCapitalization textCapitalization;
  TextInputType textInputType;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 1, color: AppColors.borderColor),
        color: Colors.white,
      ),
      child: TextFormField(
        controller: controller,
        autofocus: false,
        style: ConstStyle.sourceSans5,
        inputFormatters: [
          lengthFormater!,
        ],
        textCapitalization: textCapitalization,
        keyboardType: textInputType,
        maxLines: 1,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Color(0xffC8C7CE)),
          border: InputBorder.none,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.only(left: 14.0, bottom: 7.0, top: 6.0),
        ),
      ),
    );
  }
}

class AppText extends StatelessWidget {
  AppText({Key? key, required this.title}) : super(key: key);

  String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.sourceSansPro(
        textStyle: const TextStyle(
            color: Color(0xff22263D),
            fontWeight: FontWeight.w500,
            fontSize: 12),
      ),
    );
  }
}

class DesableAppText extends StatelessWidget {
  DesableAppText({Key? key, required this.title}) : super(key: key);

  String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.sourceSansPro(
        textStyle: TextStyle(
            color: Color(0xff22263D).withOpacity(0.50),
            fontWeight: FontWeight.w500,
            fontSize: 12),
      ),
    );
  }
}

class TextContainer extends StatelessWidget {
  TextContainer(
      {Key? key,
      required this.perfixIcon,
      required this.postfixIcon,
      required this.titleText,
      required this.color})
      : super(key: key);

  Widget perfixIcon, postfixIcon;
  String titleText;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1.1, color: AppColors.borderColor),
          color: color),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                perfixIcon,
                const SizedBox(
                  width: 6,
                ),
                Text(
                  titleText,
                  style: ConstStyle.sourceSansmob,
                ),
              ],
            ),
            postfixIcon,
          ],
        ),
      ),
    );
  }
}
