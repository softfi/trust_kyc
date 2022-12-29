import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/repositories/demat_repository.dart';
import 'package:trust_money/utils/colorsConstant.dart';

import '../../../api/apiClient.dart';
import '../../../utils/sharedPreference.dart';
import 'e_sign.dart';

class ESignPDF extends StatefulWidget {
  const ESignPDF({Key? key}) : super(key: key);

  @override
  State<ESignPDF> createState() => _ESignPDFState();
}

class _ESignPDFState extends State<ESignPDF> {
  bool isSignInDemat = true;

  @override
  Widget build(BuildContext context) {
    return Visibility(visible: isSignInDemat, child: eSignWidget());
  }

  Widget eSignWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 1.35,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color(0xffFFCFCFD).withOpacity(0.35),
            border: Border.all(width: 1.2, color: const Color(0xffbcbcbc))),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Open Demat Account",
                        style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              color: Color(0xff22263D),
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          "STEP 4 of 4",
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: Color(0xffFF405A),
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(
                thickness: 1,
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _space,
                    Text(
                      "Hey, Jairaj Let's E-Sign Your Application",
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: Color(0xff22263D),
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                    ),
                    _space1,
                    _space1,
                    Text(
                      "As per mandate every applicant needs to E-sign the application as per SEBI guidelines",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                            color: Color(0xff22263D),
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                    ),
                    _space,
                    _space1,
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "if your mobile number and ",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                  color: Color(0xff22263D),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            )),
                        TextSpan(
                            text: "AADHAAR ",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                  color: Color(0xffFF405A),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            )),
                        TextSpan(
                            text: "are ",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                  color: Color(0xff22263D),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            )),
                        TextSpan(
                            text: "Linked,",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                  color: Color(0xffFF405A),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            )),
                        TextSpan(
                            text: "you will receive an ",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                  color: Color(0xff22263D),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            )),
                        TextSpan(
                            text: "OTP ",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                  color: Color(0xff22263D),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            )),
                        TextSpan(
                            text: "on your mobile number",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                  color: Color(0xffFF405A),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            )),
                      ]),
                    ),
                    _space,
                    _space1,
                    InkWell(
                      onTap: () async {
                        var response = await APiProvider().eSignPdf();
                        if (response != null) {
                          await HelperFunctions.saveuserkyccompleted(true);
                          Get.to(()=> ESign(response: response));
                        }
                        // var res = await DematDetailRepository().eSign();
                        // print("=======123 $res");
                        // if (res != null) {}
                      },
                      child:  Container(
                        height: 45,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x29000000),
                              blurRadius: 4.0,
                            ),
                          ],
                          border: Border.all(width: 1.4, color: AppColors.textColor),
                          color: Colors.white,
                        ),
                        child: Center(
                            child: Text(
                              "e-sign with Aadhaar OTP",
                              style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                            )),
                      ),
                    ),
                    _space,
                    _space1,
                    Text(
                      "Mobile and Aadhaar not linked.?",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                            color: Color(0xff22263D),
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                    _space,
                    Text(
                      "Not sure whether you have your mobile number linked to your Aadhaar ? Click on the link below to check ",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                            color: Color(0xff22263D),
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                    ),
                    _space,
                    _space1,
                    Text(
                      "https://myaadhaar.uidai.gov.in/verify-email-mobile",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                            color: Color(0xffFF405A),
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w500,
                            fontSize: 17),
                      ),
                    ),

                  ],
                ),
              ),
              _space,
            ],
          ),
        ),
      ),
    );
  }

  Widget get _space => const SizedBox(height: 20);

  Widget get _space1 => const SizedBox(height: 3);
}
