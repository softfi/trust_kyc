import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';

import '../../utils/colorsConstant.dart';
import '../../utils/images.dart';
import '../../utils/styles.dart';

class ReadMoreBonds extends StatefulWidget {
  const ReadMoreBonds({Key? key}) : super(key: key);

  @override
  State<ReadMoreBonds> createState() => _ReadMoreBondsState();
}

class _ReadMoreBondsState extends State<ReadMoreBonds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE8E8E8),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Column(
          children: [
            Container(
              height: 80,
              color: Color(0xff00C6D8),
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
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
                          "SOVEREIGN GOLD BONDS",
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
              color: Color(0xffE8E8E8),
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
                          color: Color(0xffE8E8E8),
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
                          color: Color(0xffE8E8E8),
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
          Padding(
            padding: const EdgeInsets.only(bottom: 35.0),
            child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    children: [
                      Container(
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
                      const SizedBox(
                        height: 20,
                      ),
                      investment(),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: RotatedBox(
              quarterTurns: 2,
              child: Material(
                elevation: 0,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    color: Color(0xffE8E8E8),
                  ),
                  foregroundDecoration: const RotatedCornerDecoration(
                    color: Colors.redAccent,
                    geometry:
                    BadgeGeometry(width: 22, height: 22, cornerRadius: 0),
                  ),
                  child: Container(),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: RotatedBox(
              quarterTurns: 1,
              child: Material(
                elevation: 0,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    color: Color(0xffE8E8E8),
                  ),
                  foregroundDecoration: const RotatedCornerDecoration(
                    color: Colors.redAccent,
                    geometry:
                    BadgeGeometry(width: 22, height: 22, cornerRadius: 0),
                  ),
                  child: Container(),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }


  Widget readBondWidget() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 35,
              decoration: const BoxDecoration(
                  borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(12)),
                  color: AppColors.greenColor),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Center(
                  child: Text(
                    "Returns Based On Gold Prices",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                        color: Color(0xff22263D),
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
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 25,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: AppColors.textColor),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Center(
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
    ]);
  }

  Widget keyPoint() {
    return Column(
      children: [
        Container(
          color: const Color(0xffD67278).withOpacity(0.10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Coupon",
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
                      "8.00%",
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
                      "Yield",
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
                      "10.60%",
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Coupon Rate (Returns)",
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
                      "8.00%",
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
                      "Yield",
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
                      "10.60%",
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Face Value",
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
                      "10,00,000.00",
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
                      "Issue Size (in Crores)",
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
                      "100.00",
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
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
                Column(
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
      ],
    );
  }

  Widget cardWidget() {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text("Bond’s Rating",
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
                  Image.asset(
                    "assets/images/meter.png",
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.50,
              child: Container(
                margin: EdgeInsets.all(10),
                child: Table(
                  border: TableBorder.all(
                      color: AppColors.textColor,
                      style: BorderStyle.solid,
                      width: 1),
                  children: [
                    TableRow(children: [
                      Column(children: [
                        Text('Rating Agency', style: TextStyle(fontSize: 10.0))
                      ]),
                      Column(children: [
                        Text('Rating', style: TextStyle(fontSize: 10.0))
                      ]),
                      Column(children: [
                        Text('Rationale', style: TextStyle(fontSize: 10.0))
                      ]),
                    ]),
                    TableRow(children: [
                      Column(children: [
                        Text('Rating Agency', style: TextStyle(fontSize: 10.0))
                      ]),
                      Column(children: [
                        Text('Rating', style: TextStyle(fontSize: 10.0))
                      ]),
                      Column(children: [
                        Text('Rationale', style: TextStyle(fontSize: 10.0))
                      ]),
                    ]),
                    TableRow(children: [
                      Column(children: [
                        Text('Rating Agency', style: TextStyle(fontSize: 10.0))
                      ]),
                      Column(children: [
                        Text('Rating', style: TextStyle(fontSize: 10.0))
                      ]),
                      Column(children: [
                        Text('Rationale', style: TextStyle(fontSize: 10.0))
                      ]),
                    ]),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 40,
          width: 210,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              colors: [
                const Color(0xffFF405A),
                const Color(0xff80202D),
              ],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
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
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Widget investment() {
    return Container(
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          gradient: LinearGradient(
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
                              const SizedBox(width: 5,),
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
                              const SizedBox(width: 5,),
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
                      const SizedBox(height: 15,),
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
                      const SizedBox(height: 15,),
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
                      const SizedBox(height: 15,),
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
                      const SizedBox(height: 35,),
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0),
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 25),
                    child: ExpansionTile(
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
                      children: const <Widget>[
                        ListTile(title: Text('This is tile number 1')),
                      ],
                    )

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
}
