import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/screens/bond/tringle.dart';
import 'dart:math' as math;
import '../../utils/colorsConstant.dart';
import '../../utils/images.dart';
import '../home/custom_listtile.dart';
import '../news_and_insights/explore.dart';

class CommonWidget {
  static invest() {
    return Stack(
      children: [
        Positioned(
            bottom: -13,
            right: -40,
            child: Image.asset(
              "assets/images/m_tree.png",
              height: 264,
              width: 202,
            )),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 5,
                height: 440,
                color: AppColors.textColor,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    "INVEST IN \n3 SIMPLE STEPS",
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        color: Color(0xff00C6D8),
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "REGISTER & COMPLETE KYC",
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Text(
                    "Upload your documents online",
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "CHOOSE BOND",
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Text(
                    "Select bonds that match \nyour investment goal",
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "MAKE INVESTMENT",
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Text(
                    "Pay online and receive bond \nunits in your Demat account",
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SvgPicture.asset("assets/images/line.svg")),
        Positioned(
          left: 20.9,
          top: 15,
          child: Transform.rotate(
            angle: math.pi / 4,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(3),
                    bottomLeft: Radius.circular(3)),
                color: AppColors.textColor,
              ),
              width: 5,
              height: 18,
            ),
          ),
        ),
        Positioned(
          left: 30.7,
          top: 15,
          child: Transform.rotate(
            angle: -math.pi / 4,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(3),
                    bottomLeft: Radius.circular(3)),
                color: Color(0xff00C6D8),
              ),
              width: 5,
              height: 18,
            ),
          ),
        ),
        Positioned(
          top: 171,
          left: 15,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xff00C6D8),
            ),
            width: 25,
            height: 25,
            child: Center(
                child: Text(
              "1",
              style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            )),
          ),
        ),
        Positioned(
          top: 250,
          left: 15,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xff00C6D8),
            ),
            width: 25,
            height: 25,
            child: Center(
                child: Text(
              "2",
              style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            )),
          ),
        ),
        Positioned(
          bottom: 105,
          left: 15,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xff00C6D8),
            ),
            width: 25,
            height: 25,
            child: Center(
                child: Text(
              "3",
              style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            )),
          ),
        ),
      ],
    );
  }

  static subscribe() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xffB2EEF8).withOpacity(0.5),
            const Color(0xffFFFFFF),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: -8,
            child: Image.asset(
              ConstantImage.leaf,
              color: Color(0xffFF405A),
              height: 350,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 38.0, horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Subscribe To",
                  style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 20)),
                ),
                Text(
                  "Bond Updates",
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        color: Color(0xffFF405A),
                        fontWeight: FontWeight.w700,
                        fontSize: 28),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Subscribe to get regular updates on the latest on Bonds from Trust Money",
                  style: GoogleFonts.sourceSansPro(
                    textStyle: const TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: InputBorder.none,
                      hintText: "Enter your email here ",
                      contentPadding: EdgeInsets.only(left: 13, top: 10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ViewAllWidget(title: 'Subscribe', width: 160),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static needHelp() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Need Help?",
            style: GoogleFonts.quicksand(
              textStyle: const TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 25),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            color: AppColors.textColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Speak to us",
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      )),
                  const Icon(Icons.arrow_forward_rounded,
                      size: 22, color: Colors.white)
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 50,
            color: AppColors.textColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Assisted Buying / Spelling of Bond",
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      )),
                  const Icon(Icons.arrow_forward_rounded,
                      size: 22, color: Colors.white)
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 50,
            color: AppColors.textColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("FAQ's",
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      )),
                  const Icon(Icons.arrow_forward_rounded,
                      size: 22, color: Colors.white)
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 50,
            color: AppColors.textColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Learn from, Bond, Trust Bond",
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      )),
                  const Icon(Icons.arrow_forward_rounded,
                      size: 22, color: Colors.white)
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  static issuer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Transform.rotate(
          angle: -math.pi,
          child: ClipPath(
            clipper: Triangle(),
            child: Container(
              padding: const EdgeInsets.only(left: 13),
              color: Color(0xffFF405A),
              height: 30,
              width: 75,
              child: Center(
                child: Transform.rotate(
                  angle: -math.pi,
                  child: Text(
                    "Issuer",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        /* Container(
          height: 30,
          width: 100,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: AppColors.btnColor),
          child: Center(
            child:
          ),
        ),*/
        const SizedBox(
          height: 15,
        ),
        Text(
          "Creditaccess Grameen Limited",
          style: GoogleFonts.quicksand(
              textStyle: const TextStyle(
                  color: Color(0xff22263D),
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
        ),
        Divider(),
        const SizedBox(
          height: 12,
        ),
        RichText(
          text: const TextSpan(children: [
            TextSpan(
                text: "Issuer's Type: ",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff22263D))),
            TextSpan(
                text: "NBFC",
                style: TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff22263D))),
          ]),
        ),
        const SizedBox(
          height: 20,
        ),
        RichText(
            text: TextSpan(children: [
          TextSpan(
            text: "Credit Access Grameen Limited ",
            style: GoogleFonts.sourceSansPro(
              textStyle: const TextStyle(
                color: Color(0xff000000),
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          TextSpan(
              text:
                  "is a multi-billion dollar, transnational conglomerate. The Group’s activities span three core areas: Investment Banking, International Trading and Global Investments. It also supports charitable and philanthropic activities across the world through the Mahindra & Mahindra Foundation.",
              style: GoogleFonts.sourceSansPro(
                textStyle: const TextStyle(
                  height: 1.1,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              )),
        ])),
        const SizedBox(
          height: 35,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              colors: [
                Color(0xffEAF8FA),
                Color(0xffF9EEEE),
              ],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 6,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10)),
                    color: AppColors.btnColor),
              ),
              SizedBox(
                height: 7,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Annual Revenue",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 11),
                          ),
                        ),
                        Text(
                          "4,731 Cr (FY 21)",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 13),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Head Office",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 11),
                          ),
                        ),
                        Text(
                          "Mumbai",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Year of Inception",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 11),
                          ),
                        ),
                        Text(
                          "2007",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 13),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Type of Issuer",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 11),
                          ),
                        ),
                        Text(
                          "Corporate",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Industry",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 11),
                          ),
                        ),
                        Text(
                          "NBFC Retail",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 13),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Current MD/CEO",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 11),
                          ),
                        ),
                        Text(
                          "Rajashree Nambiar",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: "Issuers Profile ",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                            decoration: TextDecoration.underline,
                            color: AppColors.btnColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      WidgetSpan(
                        child: SvgPicture.asset(
                          ConstantImage.clip,
                          height: 12,
                          width: 12,
                          color: AppColors.btnColor,
                        ),
                      ),
                    ])),
                    SizedBox(
                      width: 16,
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: "Issuers Finance Details ",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                            decoration: TextDecoration.underline,
                            color: AppColors.btnColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      WidgetSpan(
                        child: SvgPicture.asset(
                          ConstantImage.clip,
                          height: 12,
                          width: 12,
                          color: AppColors.btnColor,
                        ),
                      ),
                    ])),
                  ],
                ),
              ),
              SizedBox(
                height: 9,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffEC515F),
                Color(0xffB73D48),
              ],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: SvgPicture.asset(
                ConstantImage.issue_doc,
                height: 60,
                width: 50,
              ),
              title: Text(
                "Download Issue Documents",
                style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ),
              subtitle: Text(
                "The document contains high-quality data which is fetched from SEBI and Exchange websites to help you make an informed decision.",
                style: GoogleFonts.sourceSansPro(
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 12),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
