import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/colorsConstant.dart';

class MyFilterChip extends StatelessWidget {
  MyFilterChip({Key? key, required this.selectedIndex, required this.title})
      : super(key: key);
  RxInt selectedIndex = 0.obs;
  RxList<String> title = List<String>.empty(growable: true).obs;

  @override
  Widget build(BuildContext context) {
    return _buildChips();
  }

  Widget _buildChips() {
    List<Widget> chips = [];
    for (int i = 1; i < title.length; i++) {
      InkWell chip = InkWell(
        onTap: () {
          selectedIndex.value = i;
        },
        child: Obx(() => Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: AppColors.textColor),
              color: selectedIndex.value == i
                  ? const Color(0xff22263D)
                  : Colors.white),
          child: Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16),
            child: Text(
              title[i],
              style: GoogleFonts.sourceSansPro(
                textStyle: TextStyle(
                    color: selectedIndex.value == i
                        ? Colors.white
                        : const Color(0xff22263D),
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
              ),
            ),
          ),
        )),
      );
      chips.add(chip);
    }

    return Wrap(
      spacing: 18.0,
      runSpacing: 12.0,
      textDirection: TextDirection.ltr,
      direction: Axis.horizontal,
      children: chips,
    );
  }
}