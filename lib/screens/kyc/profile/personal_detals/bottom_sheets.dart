import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/utils/colorsConstant.dart';
import 'package:trust_money/utils/images.dart';

import '../../../../getx_controller/profile/personal_details_controller.dart';

class PersonalBottomSheet {
  static closeApplicationBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        var height = MediaQuery.of(context).size.height;
        return StatefulBuilder(builder: (BuildContext context, setState) {
          return Padding(
            padding: EdgeInsets.only(
                top: 0,
                right: 0,
                left: 0,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Wrap(
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    color: AppColors.primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: height * 0.04,
                          ),
                          Image.asset(
                            ConstantImage.profileError,
                            width: 75,
                            height: 75,
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Center(
                            child: Text(
                              "We apologise for the inconvenience.As per our policy, we are unable to proceed further, kindly call our customer service for further details.",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.04,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    exit(0);
                                  },
                                  child: Container(
                                    height: 45,
                                    width: 160,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1.5, color: Colors.white)),
                                    child: Center(
                                        child: Text(
                                      "Close Application",
                                      style: GoogleFonts.quicksand(
                                          textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500)),
                                    )),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    height: 45,
                                    width: 160,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1.5, color: Colors.white)),
                                    child: Center(
                                        child: Text(
                                      "Close Option",
                                      style: GoogleFonts.quicksand(
                                          textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500)),
                                    )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          );
        });
      },
    );
  }

  static saveAndCompleteBottomSheet() {
    PersonalDetailsController _personalDetailsController =
    Get.put(PersonalDetailsController());
    Get.bottomSheet(
        Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    ConstantImage.error,
                    width: 75,
                    height: 75,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Are you sure?",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    "Do you want to Exit the KYC Progress?",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: 45,
                          width: 150,
                          decoration: BoxDecoration(
                              color: AppColors.textColor,
                              border:
                                  Border.all(width: 1, color: Colors.white)),
                          child: Center(
                            child: Text(
                              "Cancel",
                              style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      InkWell(
                        onTap: () async {
                         // _personalDetailsController.updateStatusBar();
                        },
                        child: Container(
                          height: 45,
                          width: 150,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.white),
                              color: Colors.white),
                          child: Center(
                            child: Text(
                              "Yes",
                              style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textColor),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
        enableDrag: false,
        backgroundColor: AppColors.textColor,
        isDismissible: false,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30))));
  }

}
