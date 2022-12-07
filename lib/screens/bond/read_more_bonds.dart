import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';
import 'package:trust_money/screens/Congratulations/alert_dialog.dart';
import 'package:trust_money/screens/bond/pay_ipo.dart';
import 'dart:math' as math;
import '../../utils/colorsConstant.dart';
import '../../utils/images.dart';
import '../../utils/styles.dart';

class ReadMoreBonds extends StatefulWidget {
  const ReadMoreBonds({Key? key}) : super(key: key);

  @override
  State<ReadMoreBonds> createState() => _ReadMoreBondsState();
}

class _ReadMoreBondsState extends State<ReadMoreBonds> {
  bool _customTileExpanded = false;

  List data = [
    "This bond can be considered for medium term Investment purpose with annual returns. Coupon is 13.75% i.e you will receive Rs. 137,500.0 annual interest for every 10 lac Investment. It has call option on 24-Jan-2025.",
    "The bond issuer is of type Private Sector Bank. The Issuer raised total Rs. 500.0 Cr for this bond.",
    "Use of Proceeds: Augmentation of tier-i capital to strengthen its capital adequacy and to enhance long-term resources.",
    "It is rated A- by IND with STABLE outlook.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Column(
          children: [
            Container(
              height: 70,
              color: Color(0xff00C6D8),
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon:
                              const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        Text(
                          "CREDITACCESS GRAMEEN",
                          style: ConstStyle.quickStandSmall11,
                        ),
                        Container(
                          width: 50,
                        )
                      ],
                    ),
                    Positioned(
                      left: 0,
                      bottom: -1,
                      child: RotatedBox(
                        quarterTurns: 2,
                        child: Material(
                          elevation: 0,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: const BoxDecoration(
                              color: Color(0xff00C6D8),
                            ),
                            foregroundDecoration: const RotatedCornerDecoration(
                              color: Colors.redAccent,
                              geometry: BadgeGeometry(
                                  width: 20, height: 20, cornerRadius: 0),
                            ),
                            child: Container(),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: -1,
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Material(
                          elevation: 0,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: const BoxDecoration(
                              color: Color(0xff00C6D8),
                            ),
                            foregroundDecoration: const RotatedCornerDecoration(
                              color: Colors.redAccent,
                              geometry: BadgeGeometry(
                                  width: 20, height: 20, cornerRadius: 0),
                            ),
                            child: Container(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RotatedBox(
                    quarterTurns: 1,
                    child: Material(
                      elevation: 0,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: Colors.redAccent,
                        ),
                        foregroundDecoration: const RotatedCornerDecoration(
                          color: Colors.white,
                          geometry: BadgeGeometry(
                              width: 30, height: 28, cornerRadius: 0),
                        ),
                        child: Container(),
                      ),
                    ),
                  ),
                  RotatedBox(
                    quarterTurns: 2,
                    child: Material(
                      elevation: 0,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: Colors.redAccent,
                        ),
                        foregroundDecoration: const RotatedCornerDecoration(
                          color: Colors.white,
                          geometry: BadgeGeometry(
                              width: 28, height: 30, cornerRadius: 0),
                        ),
                        child: Container(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x29000000),
                              blurRadius: 5.0,
                            ),
                          ],
                          color: Colors.white),
                      child: readBondWidget()),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: keyHighlightWidget() //investment(),
                    ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: issuerWidget(),
                ),
                const SizedBox(
                  height: 30,
                ),
                subscribe(),
                const SizedBox(
                  height: 30,
                ),
                needHelp(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget readBondWidget() {
    return Stack(
      children: [
        Positioned(
          top: 30,
          right: -4,
          child: Image.asset(
            ConstantImage.leaf,
            color: Color(0xff00C6D8),
            height: 400,
          ),
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  "M",
                  style: GoogleFonts.sourceSansPro(
                    textStyle: const TextStyle(
                      color: Color(0xff22263D),
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text("MAHINDRA & MAHINDRA FINANCIAL",
                  style: GoogleFonts.sourceSansPro(
                    textStyle: const TextStyle(
                      color: Color(0xff22263D),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Container(
                //   height: 35,
                //   decoration: const BoxDecoration(
                //       borderRadius:
                //           BorderRadius.only(bottomRight: Radius.circular(12)),
                //       color: AppColors.greenColor),
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
                //     child: Center(
                //       child: Text(
                //         "Returns Based On Gold Prices",
                //         style: GoogleFonts.sourceSansPro(
                //           textStyle: const TextStyle(
                //             color: Color(0xff22263D),
                //             fontWeight: FontWeight.bold,
                //             fontSize: 10,
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   width: 10,
                // ),
                const SizedBox(
                  width: 40,
                ),
                Container(
                  height: 35,
                  decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(12)),
                      color: AppColors.greyColor),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: const TextSpan(children: [
                            TextSpan(
                                text: "ISIN: ",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffFF405A))),
                            TextSpan(
                                text: "INE146O08118",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textColor)),
                          ]),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.file_copy,
                          color: Color(0xffFF405A),
                          size: 12,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Transform.rotate(
                    angle: -math.pi,
                    child: ClipPath(
                      clipper: Triangle(),
                      child: Container(
                        color: AppColors.textColor,
                        height: 25,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 13.0, left: 21),
                          child: Center(
                            child: Transform.rotate(
                              angle: -math.pi,
                              child: Text(
                                "Eligible Investors*",
                                style: GoogleFonts.sourceSansPro(
                                  textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Container(
                  //   height: 25,
                  //   decoration: const BoxDecoration(
                  //       borderRadius: BorderRadius.only(
                  //           bottomRight: Radius.circular(10),
                  //           topRight: Radius.circular(10)),
                  //       color: AppColors.textColor),
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  //     child: Center(
                  //       child: Text(
                  //         "Eligible Investors*",
                  //         style: GoogleFonts.sourceSansPro(
                  //           textStyle: const TextStyle(
                  //             color: Colors.white,
                  //             fontWeight: FontWeight.bold,
                  //             fontSize: 10,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 25,
                    color: AppColors.greyColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Center(
                        child: Text(
                          "HUF",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 25,
                    color: AppColors.greyColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Center(
                        child: Text(
                          "Corporate",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 25,
                    color: AppColors.greyColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Center(
                        child: Text(
                          "Trust",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 25,
                    color: AppColors.greyColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Center(
                        child: Text(
                          "Minor",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              "Key Points To Consider",
              style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textColor),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              "Face Value (In INR) and Issue Size (In INR Crores)",
              style: GoogleFonts.sourceSansPro(
                textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff1D2B84)),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          keyPoint(),
          const SizedBox(
            height: 20,
          ),
          cardWidget(),
        ]),
      ],
    );
  }

  Widget keyPoint() {
    return Column(
      children: [
        Container(
          color: const Color(0xffD67278).withOpacity(0.10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Issue Opens on",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: TextStyle(
                              color: AppColors.primaryColor.withOpacity(0.80),
                              fontWeight: FontWeight.w600,
                              fontSize: 12),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "14, Nov 2022",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Issue Closes on",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: TextStyle(
                            color: AppColors.primaryColor.withOpacity(0.80),
                            fontWeight: FontWeight.w600,
                            fontSize: 12),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "02, Dec 2022",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Container(
          color: const Color(0xff9BA9AD).withOpacity(0.10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Face Value",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: TextStyle(
                              color: AppColors.primaryColor.withOpacity(0.80),
                              fontWeight: FontWeight.w600,
                              fontSize: 12),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "₹1,000/- per NCD",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Minimum Application",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: TextStyle(
                              color: AppColors.primaryColor.withOpacity(0.80),
                              fontWeight: FontWeight.w600,
                              fontSize: 12),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "₹10,000/- (10 NCD) and in multiples of ₹1,000/- (1 NCD) thereafter",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          color: const Color(0xff9BA9AD).withOpacity(0.10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Listing",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: TextStyle(
                                  color:
                                      AppColors.primaryColor.withOpacity(0.80),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "BSE and NSE",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Issue Size",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: TextStyle(
                                  color:
                                      AppColors.primaryColor.withOpacity(0.80),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "₹250 Crore with an option to retain oversubscription up to ₹250 Crore aggregating upto to ₹ 500 Crore",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                tableWidget(),
              ],
            ),
          ),
        ),
        /* Container(
          color: const Color(0xff9BA9AD).withOpacity(0.10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Interest Payment Frequency",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 13),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Annual",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Maturity Date",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 13),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "13/Sep/2024",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Container(
          color: const Color(0xffD67278).withOpacity(0.10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tax Free",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 13),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "NO",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "TDS on Interest",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 13),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "NO",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Container(
          color: const Color(0xff9BA9AD).withOpacity(0.10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.50,
                  child: InkWell(
                    onTap: () {
                      callBottomSheet();
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Call Option",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 13),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Text(
                              "YES",
                              style: GoogleFonts.sourceSansPro(
                                textStyle: const TextStyle(
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "4 Oct 2022",
                              style: GoogleFonts.sourceSansPro(
                                textStyle: const TextStyle(
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11),
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            const Icon(
                              CupertinoIcons.exclamationmark_circle_fill,
                              color: AppColors.btnColor,
                              size: 14,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    putBottomSheet();
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Put Option",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 13),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            "YES",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "4 Oct 2022",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11),
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          const Icon(
                            CupertinoIcons.exclamationmark_circle_fill,
                            color: AppColors.btnColor,
                            size: 14,
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          color: const Color(0xffD67278).withOpacity(0.10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Govt. Guarantee",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 13),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "3",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Govt. Guarantee",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 13),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "NO",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),*/
      ],
    );
  }

  Widget tableWidget() {
    return Container(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 2),
        child: Table(
          border: TableBorder.all(
              color: const Color(0xff707070),
              width: 1,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          children: [
            TableRow(
                decoration: const BoxDecoration(
                  color: AppColors.btnColor,
                ),
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Category",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 10),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "I - Institutional",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 10),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "II - Non-Institutiona1",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 10),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "III - HNI",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 10),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "IV - Retail",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 10),
                        ),
                      ),
                    ),
                  ),
                ]),
            TableRow(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xffDBF6FA),
                      Color(0xffFFD5D9),
                    ],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                  ),
                ),
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Category Allocation",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "25%",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "35%",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "15%",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "25%",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                ]),
          ],
        ));
  }

  Widget cardWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Text("IPO’s Rating",
              style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                  color: Color(0xff22263D),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              )),
        ),
        const SizedBox(
          height: 6,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Image.asset(
                  "assets/images/meter.png",
                  fit: BoxFit.fill,
                  height: 90,
                  width: 164,
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 35,
                  width: 164,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Color(0xff707070)),
                      color: Color(0xffFDFDEB)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("CRISIL",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                            ),
                          )),
                      Text("AA",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                            ),
                          )),
                      Icon(
                        Icons.sim_card_download_rounded,
                        size: 18,
                        color: AppColors.btnColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Image.asset(
                  "assets/images/meter.png",
                  fit: BoxFit.fill,
                  height: 90,
                  width: 164,
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 35,
                  width: 164,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Color(0xff707070)),
                      color: Color(0xffFDFDEB)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("CARE",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                            ),
                          )),
                      Text("AA",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                            ),
                          )),
                      Icon(
                        Icons.sim_card_download_rounded,
                        size: 18,
                        color: AppColors.btnColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Center(
          child: Container(
            height: 40,
            width: 210,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColors.btnColor,
            ),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text("Buy this BOND now!",
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                      color: Color(0xffFfffff),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  )),
            )),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Widget investment() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          gradient: const LinearGradient(
            colors: [
              Color(0xffFFB4BB),
              Color(0xff84F5FF),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 25),
                  child: Text(
                    "Your Investment Calculator",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Bond Value \nDetails",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Face Value (A)",
                              style: GoogleFonts.sourceSansPro(
                                textStyle: const TextStyle(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              "₹ 10,00,000",
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Market Value (B)",
                              style: GoogleFonts.sourceSansPro(
                                textStyle: const TextStyle(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              "₹ 9,93,915",
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Yield (YTM) ",
                              style: GoogleFonts.sourceSansPro(
                                textStyle: const TextStyle(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              "7.5500%",
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
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 30),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Number of bonds",
                                  style: GoogleFonts.sourceSansPro(
                                    textStyle: const TextStyle(
                                      color: Color(0xff22263D),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  )),
                              Text("No. of Bonds you want to \nPurchase (C)",
                                  style: GoogleFonts.sourceSansPro(
                                    textStyle: const TextStyle(
                                      color: Color(0xff22263D),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                    ),
                                  )),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 45,
                                width: 37,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x29000000),
                                      blurRadius: 3.0,
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    "-",
                                    style: GoogleFonts.quicksand(
                                        textStyle: const TextStyle(
                                            color: Color(0xff22263D),
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 45,
                                width: 46,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x29000000),
                                      blurRadius: 3.0,
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    "1",
                                    style: GoogleFonts.quicksand(
                                        textStyle: const TextStyle(
                                            color: Color(0xff22263D),
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 45,
                                width: 37,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x29000000),
                                      blurRadius: 3.0,
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    "+",
                                    style: GoogleFonts.quicksand(
                                        textStyle: const TextStyle(
                                            color: Color(0xff22263D),
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Principal Amount (E) ",
                                  style: GoogleFonts.sourceSansPro(
                                    textStyle: const TextStyle(
                                      color: Color(0xff22263D),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  )),
                              Text("Market value (B) x no. of bonds (C)",
                                  style: GoogleFonts.sourceSansPro(
                                    textStyle: const TextStyle(
                                      color: Color(0xff22263D),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                    ),
                                  )),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 45,
                            width: 130,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x29000000),
                                  blurRadius: 3.0,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                "₹ 19,87,830",
                                style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        color: Color(0xff22263D),
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Accrued Interest ",
                                  style: GoogleFonts.sourceSansPro(
                                    textStyle: const TextStyle(
                                      color: Color(0xff22263D),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  )),
                              Text(
                                  "(Interest earned on the bond this \nyear) (D)",
                                  style: GoogleFonts.sourceSansPro(
                                    textStyle: const TextStyle(
                                      color: Color(0xff22263D),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                    ),
                                  )),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 45,
                            width: 130,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x29000000),
                                  blurRadius: 3.0,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                "₹ 1,32,372",
                                style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        color: Color(0xff22263D),
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Total Investment",
                                  style: GoogleFonts.sourceSansPro(
                                    textStyle: const TextStyle(
                                      color: Color(0xff22263D),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  )),
                              Text(
                                  "Principal Amount (E) + Accrued \nInterest (D)",
                                  style: GoogleFonts.sourceSansPro(
                                    textStyle: const TextStyle(
                                      color: Color(0xff22263D),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                    ),
                                  )),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 45,
                            width: 130,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x29000000),
                                  blurRadius: 3.0,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                "₹ 21,20,202",
                                style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        color: Color(0xff22263D),
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Container(
                        height: 40,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xffFFFFFF),
                              Color(0xffE1E0E6),
                            ],
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x29000000),
                              blurRadius: 3.0,
                            ),
                          ],
                        ),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text("Place Order",
                              style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              )),
                        )),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: AppColors.textColor,
                  child: ExpansionTile(
                    leading: const SizedBox(),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WHAT WILL I EARN",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 15),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                          size: 25,
                        )
                      ],
                    ),
                    trailing: const SizedBox(),
                    children: <Widget>[
                      ListTile(
                          title: Column(
                        children: [
                          ListView.builder(
                            itemCount: 5,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4.0),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(5),
                                          bottomRight: Radius.circular(5)),
                                      color: Colors.white,
                                    ),
                                    child: ExpansionTile(
                                      backgroundColor: Colors.white,
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Interest",
                                                  style:
                                                      GoogleFonts.sourceSansPro(
                                                    textStyle: const TextStyle(
                                                      color: Color(0xff22263D),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13,
                                                    ),
                                                  )),
                                              Text("₹ 88,862.4",
                                                  style:
                                                      GoogleFonts.sourceSansPro(
                                                    textStyle: const TextStyle(
                                                      color: Color(0xff22263D),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13,
                                                    ),
                                                  )),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Dividend",
                                                  style:
                                                      GoogleFonts.sourceSansPro(
                                                    textStyle: const TextStyle(
                                                      color: Color(0xff22263D),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13,
                                                    ),
                                                  )),
                                              Text("₹ 27,542.2",
                                                  style:
                                                      GoogleFonts.sourceSansPro(
                                                    textStyle: const TextStyle(
                                                      color: Color(0xff22263D),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13,
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        ],
                                      ),
                                      leading: Text("12 / 05/ 2022",
                                          style: GoogleFonts.sourceSansPro(
                                            textStyle: const TextStyle(
                                              color: Color(0xff22263D),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13,
                                            ),
                                          )),
                                      trailing: _customTileExpanded
                                          ? const Icon(
                                              Icons.keyboard_arrow_up,
                                              color: AppColors.primaryColor,
                                              size: 25,
                                            )
                                          : const Icon(
                                              Icons.keyboard_arrow_down,
                                              color: AppColors.primaryColor,
                                              size: 25,
                                            ),
                                      children: <Widget>[
                                        ListView.builder(
                                            itemCount: 5,
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              return ListTile(
                                                leading: Text("12 / 05 / 2023",
                                                    style: GoogleFonts
                                                        .sourceSansPro(
                                                      textStyle:
                                                          const TextStyle(
                                                        color:
                                                            Color(0xff22263D),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 13,
                                                      ),
                                                    )),
                                                title: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Text("₹ 854.50",
                                                        style: GoogleFonts
                                                            .sourceSansPro(
                                                          textStyle:
                                                              const TextStyle(
                                                            color: Color(
                                                                0xff22263D),
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 13,
                                                          ),
                                                        )),
                                                    Text("₹ 276.86",
                                                        style: GoogleFonts
                                                            .sourceSansPro(
                                                          textStyle:
                                                              const TextStyle(
                                                            color: Color(
                                                                0xff22263D),
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 13,
                                                          ),
                                                        )),
                                                    Text("   ")
                                                  ],
                                                ),
                                              );
                                            }),
                                      ],
                                      onExpansionChanged: (bool expanded) {
                                        setState(() =>
                                            _customTileExpanded = expanded);
                                      },
                                    ),
                                  ));
                            },
                          ),
                        ],
                      )),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 60,
              right: 8,
              child: Image.asset(
                ConstantImage.leaf,
                color: Colors.white,
                height: 300,
              ),
            )
          ],
        ));
  }

  Widget keyHighlightWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Key Highlights",
          style: GoogleFonts.quicksand(
            textStyle: const TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ListView.builder(
            itemCount: data.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                minLeadingWidth: 30,
                contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                dense: true,
                visualDensity:
                    const VisualDensity(vertical: -2, horizontal: -4),
                leading: const Icon(
                  Icons.done,
                  size: 20,
                  color: Color(0xffFF405A),
                ),
                title: Text(
                  "${data[index]}",
                  style: GoogleFonts.sourceSansPro(
                    textStyle: const TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ),
              );
            }),
        const SizedBox(
          height: 22,
        ),
        Text(
          "About This IPO",
          style: GoogleFonts.quicksand(
            textStyle: const TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(
          height: 18,
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
      ],
    );
  }

  Widget issuerWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Transform.rotate(
          angle: -math.pi,
          child: ClipPath(
            clipper: Triangle(),
            child: Container(
              padding: const EdgeInsets.only(left: 13),
              color: AppColors.btnColor,
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
          height: 25,
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
        const SizedBox(
          height: 20,
        ),
        seriesWidget(),
        const SizedBox(
          height: 20,
        ),
        treeWidget(),
      ],
    );
  }

  List test = ["Series", "I", "II", "III", "IV", "V", "VI", "VII"];
  List<DataRow> _rowList = [
    DataRow(cells: <DataCell>[
      DataCell(Text('AAAAAA')),
      DataCell(Text('1')),
      DataCell(Text('Yes')),
      DataCell(Text('Yes')),
      DataCell(Text('Yes')),
      DataCell(Text('Yes')),
      DataCell(Text('Yes')),
      DataCell(Text('Yes')),
    ]),
  ];

  void addItems() {
    for (int i = 1; i < 5; i++) {
      _addRow();
    }
  }

  void _addRow() {
    // Built in Flutter Method.
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below.
      _rowList.add(DataRow(cells: <DataCell>[
        DataCell(Text('AAAAAA')),
        DataCell(Text('1')),
        DataCell(Text('Yes')),
        DataCell(Text('Yes')),
        DataCell(Text('Yes')),
        DataCell(Text('Yes')),
        DataCell(Text('Yes')),
        DataCell(Text('Yes')),
      ]));
    });
  }

  List Col1 = [
    "Serires",
    "Frequency of Interest Payment",
    "Minimum Application",
    "In Multiples of thereafter (₹)",
    "Face Value/ Issue Price of NCDs (`/ NCD)",
    "Tenor",
    "Coupon (% per annum)",
    "Effective Yield (% per annum)",
    "Mode of Interest Payment",
    "Redemption Amount (₹ / NCD) on Maturity",
    "Put and Call Option"
  ];
  List Col2 = [
    "I",
    "Monthly",
    "₹ 10,000",
    "₹ 10000(1NCD)",
    "₹ 1000",
    "24 Months",
    "9,45%",
    "9.83%",
    "N.A",
    "1,000,000",
    "N.A"
  ];

  Widget seriesWidget() {
    addItems();
    return Column(
      children: [
        Text(
          "Specific Terms For Each Series Of Ncds",
          style: GoogleFonts.quicksand(
            textStyle: const TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
              height: 550,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      width: 140,
                      decoration: BoxDecoration(
                        color: Color(0xffFF405A),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomLeft: Radius.circular(12)),
                      ),
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: Col1.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 50,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${Col1[index]}",
                                  style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })),
                  Container(
                      width: 100,
                      // decoration: BoxDecoration(
                      //     color: Colors.,
                      //     borderRadius:
                      //     BorderRadius.only(topLeft: Radius.circular(12))),
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: Col2.length,
                          itemBuilder: (context, index) {
                            return Container(
                              alignment: Alignment.center,
                              height: 50,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${Col2[index]}",
                                  style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })),
                  Container(
                      width: 100,
                      // decoration: BoxDecoration(
                      //     color: Colors.,
                      //     borderRadius:
                      //     BorderRadius.only(topLeft: Radius.circular(12))),
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: Col2.length,
                          itemBuilder: (context, index) {
                            return Container(
                              alignment: Alignment.center,
                              height: 50,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${Col2[index]}",
                                  style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })),
                  Container(
                      width: 100,
                      // decoration: BoxDecoration(
                      //     color: Colors.,
                      //     borderRadius:
                      //     BorderRadius.only(topLeft: Radius.circular(12))),
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: Col2.length,
                          itemBuilder: (context, index) {
                            return Container(
                              alignment: Alignment.center,
                              height: 50,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${Col2[index]}",
                                  style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })),
                  Container(
                      width: 100,
                      // decoration: BoxDecoration(
                      //     color: Colors.,
                      //     borderRadius:
                      //     BorderRadius.only(topLeft: Radius.circular(12))),
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: Col2.length,
                          itemBuilder: (context, index) {
                            return Container(
                              alignment: Alignment.center,
                              height: 50,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${Col2[index]}",
                                  style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })),
                  Container(
                      width: 100,
                      // decoration: BoxDecoration(
                      //     color: Colors.,
                      //     borderRadius:
                      //     BorderRadius.only(topLeft: Radius.circular(12))),
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: Col2.length,
                          itemBuilder: (context, index) {
                            return Container(
                              alignment: Alignment.center,
                              height: 50,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${Col2[index]}",
                                  style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })),
                  Container(
                      width: 100,
                      // decoration: BoxDecoration(
                      //     color: Colors.,
                      //     borderRadius:
                      //     BorderRadius.only(topLeft: Radius.circular(12))),
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: Col2.length,
                          itemBuilder: (context, index) {
                            return Container(
                              alignment: Alignment.center,
                              height: 50,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${Col2[index]}",
                                  style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })),
                  Container(
                      width: 100,
                      // decoration: BoxDecoration(
                      //     color: Colors.,
                      //     borderRadius:
                      //     BorderRadius.only(topLeft: Radius.circular(12))),
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: Col2.length,
                          itemBuilder: (context, index) {
                            return Container(
                              alignment: Alignment.center,
                              height: 50,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${Col2[index]}",
                                  style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })),
                ],
              )),
        )
      ],
    );
  }

  Widget treeWidget() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 5,
                height: 390,
                color: AppColors.textColor,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Invest in \n3 Simple Steps",
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        color: Color(0xff00C6D8),
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Register & Complete KYC",
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                  ),
                  Text(
                    "Upload your documents online",
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Choose Bonds",
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                  ),
                  Text(
                    "Select bonds that match \nyour investment goal",
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Make Investment",
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                  ),
                  Text(
                    "Pay online and receive bond \nunits in your Demat account",
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
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
          left: 4.9,
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
          left: 14.7,
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
          top: 120,
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
          top: 198,
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
          bottom: 110,
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
        Positioned(
            bottom: -13,
            right: -30,
            child: Image.asset(
              "assets/images/m_tree.png",
              height: 280,
              width: 190,
            )),
      ],
    );
  }

  Widget subscribe() {
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
                        fontWeight: FontWeight.w600,
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
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PayIPO()));
                  },
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 55,
                      width: 160,
                      decoration: const BoxDecoration(
                        color: Color(0xffEC515F),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            bottomLeft: Radius.circular(50)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Subscribe",
                            style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16)),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget needHelp() {
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

  void callBottomSheet() {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(35),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (BuildContext context, State) {
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Align(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.clear,
                              color: Colors.white,
                              size: 25,
                            )),
                      ),
                      Text(
                        "DATES FOR CALL OPTION",
                        style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "02 Oct 2022",
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SetAlert()));
                            },
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                color: AppColors.btnColor,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14.0),
                                child: Center(
                                    child: Text("Set Alert",
                                        style: GoogleFonts.sourceSansPro(
                                          textStyle: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        ))),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "02 Oct 2022",
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                              color: AppColors.btnColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14.0),
                              child: Center(
                                  child: Text("Set Alert",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ))),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "02 Oct 2022",
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                              color: AppColors.btnColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14.0),
                              child: Center(
                                  child: Text("Set Alert",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ))),
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
          );
        });
      },
    );
  }

  void putBottomSheet() {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(35),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (BuildContext context, State) {
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Align(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.clear,
                              color: Colors.white,
                              size: 25,
                            )),
                      ),
                      Text(
                        "DATES FOR PUT OPTION",
                        style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "02 Oct 2022",
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SetAlert()));
                            },
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                color: AppColors.btnColor,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14.0),
                                child: Center(
                                    child: Text("Set Alert",
                                        style: GoogleFonts.sourceSansPro(
                                          textStyle: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        ))),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "02 Oct 2022",
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                              color: AppColors.btnColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14.0),
                              child: Center(
                                  child: Text("Set Alert",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ))),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "02 Oct 2022",
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                              color: AppColors.btnColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14.0),
                              child: Center(
                                  child: Text("Set Alert",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ))),
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
          );
        });
      },
    );
  }
}

class Triangle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final x = size.width;
    final y = size.height;

    path.moveTo(0, y / 2);
    path.lineTo(15, y);
    path.lineTo(x, y);
    path.lineTo(x, 0);
    path.lineTo(15, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
