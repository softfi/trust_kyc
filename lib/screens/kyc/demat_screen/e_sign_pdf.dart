import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/repositories/demat_repository.dart';
import 'package:trust_money/utils/colorsConstant.dart';

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

  Widget eSignWidget(){
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color(0xffFFCFCFD).withOpacity(0.35),
            border: Border.all(width: 1.2, color: const Color(0xffbcbcbc))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  // dematDetails = false;
                  // addNewDematAccounts = true;
                  // existingDematAccountDetails = false;
                  // isNewDemat = false;
                  // isMandatory = false;
                  // isSignInDemat = false;
                  // isAddNominee = false;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 25,
                    width: 70,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5)),
                        color: AppColors.textColor),
                    child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.highlight_remove,
                              color: Colors.white,
                              size: 14,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Close",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ],
                        )),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
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
                ),
              ],
            ),
            const Divider(
              thickness: 1,
              indent: 5,
              endIndent: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _space,
                  Text(
                    "E-Sign Your Application",
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          color: Color(0xff22263D),
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                  ),
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
                  RichText(
                    text: const TextSpan(children: [
                      TextSpan(
                          text: "if your mobile number and ",
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Color(0xff22263D))),
                      TextSpan(
                          text: "AADHAAR ",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Color(0xffFF405A))),
                      TextSpan(
                          text: "are ",
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Color(0xff22263D))),
                      TextSpan(
                          text: "Linked,",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Color(0xffFF405A))),
                      TextSpan(
                          text: "you will receive an ",
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Color(0xff22263D))),
                      TextSpan(
                          text: "OTP ",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Color(0xffFF405A))),
                      TextSpan(
                          text: "on your mobile number",
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Color(0xff22263D))),
                    ]),
                  ),
                  _space,
                  InkWell(
                    onTap: () async {
                      var res = await DematDetailRepository().eSign();
                      print("=======123 $res");
                      if (res != null) {}
                    },
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(color: AppColors.btnColor),
                      child: Center(
                          child: Text(
                            "e-sign with Aadhaar OTP",
                            style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500)),
                          )),
                    ),
                  ),
                  _space,
                  Text(
                    "Mobile and Aadhaar not linked.?",
                    style: GoogleFonts.quicksand(
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
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 6,
                  ),
                  /* Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Continue()));
                      },
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2, color: AppColors.textColor)),
                        child: Center(
                            child: Text(
                          "Submit",
                          style: ConstStyle.quickStandBtn,
                        )),
                      ),
                    ),
                  ),*/
                ],
              ),
            ),
            _space,
          ],
        ),
      ),
    );
  }

  Widget get _space => const SizedBox(height: 20);

  Widget get _space1 => const SizedBox(height: 3);
}
