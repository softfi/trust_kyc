import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/utils/colorsConstant.dart';
import 'package:trust_money/utils/images.dart';

import 'bank_details.dart';

class BankBottomSheet {
   void confirmationBottomSheet({
     final void Function()? onClick
  }) async {
    Get.bottomSheet(
        Wrap(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  ConstantImage.error,
                  width: 75,
                  height: 75,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("Are you sure?",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.white)),
                const SizedBox(
                  height: 5,
                ),
                const Text("to delete your bank account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.white)),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: 45,
                          width: 160,
                          color: AppColors.btnColor,
                          // decoration: BoxDecoration(
                          //     border:
                          //         Border.all(width: 1.5, color: Colors.white)),
                          child: Center(
                              child: Text(
                            "NO",
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
                          Get.back();
                          onClick!();
                        },
                        child: Container(
                          height: 45,
                          width: 160,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1.5, color: Colors.white)),
                          child: Center(
                              child: Text(
                            "YES",
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
                const SizedBox(
                  height: 25,
                ),
              ],
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

  void bankAccountNotMatchedBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isDismissible: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(35),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (context) {
          Future.delayed(Duration(seconds: 5), () {
            Navigator.pop(context);
          });
          return BottomSheet(
            builder: (BuildContext context) {
              return StatefulBuilder(builder: (BuildContext context, State) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.27,
                  decoration: const BoxDecoration(
                    color: AppColors.textColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 35,
                      ),
                      Image.asset(
                        ConstantImage.error,
                        width: 75,
                        height: 75,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          "Your Bank Account does not match. \nPlease try again.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                );
              });
            },
            onClosing: () {},
          );
        });
  }

  void uploadCancelledChequeBottomSheet(
      BuildContext context, bool inCheckCancelled) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(35),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (context) {
          return BottomSheet(
            builder: (BuildContext context) {
              return StatefulBuilder(builder: (BuildContext context, State) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.90,
                    decoration: const BoxDecoration(
                      color: AppColors.textColor,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(35.0),
                        topRight: const Radius.circular(35.0),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            "Upload cancelled cheque",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Container(
                              height: 270,
                              width: MediaQuery.of(context).size.width / 1.12,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      width: 0.5, color: Color(0xff707070))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 45,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                      ),
                                      color: Color(0xffE1E0E7),
                                      border: Border.all(
                                          width: 0.5, color: Color(0xff707070)),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Upload Preview",
                                        style: GoogleFonts.sourceSansPro(
                                          textStyle: const TextStyle(
                                              color: Color(0xff22263D),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Center(
                                    child: SvgPicture.asset(
                                      ConstantImage.upload,
                                      height: 50,
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      "Upload Cancelled Cheque ",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: const TextStyle(
                                            color: Color(0xff22263D),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: RichText(
                                      text: const TextSpan(children: [
                                        TextSpan(
                                            text: "upload your Signature ",
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff22263D))),
                                        TextSpan(
                                            text: "JPG, JPEG ",
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xffFF405A))),
                                        TextSpan(
                                            text: "or ",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontStyle: FontStyle.italic,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff22263D))),
                                        TextSpan(
                                            text: "PNG ",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontStyle: FontStyle.italic,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xffFF405A))),
                                        TextSpan(
                                            text: "in less than ",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontStyle: FontStyle.italic,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff22263D))),
                                        TextSpan(
                                            text: "10 MB ",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontStyle: FontStyle.italic,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xffFF405A))),
                                      ]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 8.0, left: 30, right: 30),
                            child: Text(
                              "Note : if you do not have your Cheque book with you for the cancelled cheque , you can upload a copy of your Bank Statement or Bank Passbook ",
                              style: GoogleFonts.sourceSansPro(
                                textStyle: const TextStyle(
                                    fontStyle: FontStyle.normal,
                                    color: Color(0xffFFC440),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 25.0, right: 25),
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                                inCheckCancelled = true;
                              },
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.5, color: Colors.white)),
                                child: Center(
                                    child: Text(
                                  "Submit",
                                  style: GoogleFonts.quicksand(
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500)),
                                )),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
            },
            onClosing: () {},
          );
        });
  }
}
