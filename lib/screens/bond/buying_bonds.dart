import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';
import 'package:trust_money/utils/colorsConstant.dart';
import 'package:trust_money/utils/images.dart';
import 'dart:math' as math;

import '../../bottom_navigation/bottom_navigation.dart';

bool itrValue = true;
List<String> items = ["Gram", "Kilo", "Mili"];
String? selectedItem = "Gram";
bool is_switch_on = true;
bool _customTileExpanded = false;
int itrValueInt = 0;
var container_garidiant = LinearGradient(
    colors: [Color(0xff58C3D5), Color(0xffEC515F)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight);

class BuyingBonds extends StatefulWidget {
  const BuyingBonds({Key? key}) : super(key: key);

  @override
  State<BuyingBonds> createState() => _BuyingBondsState();
}

class _BuyingBondsState extends State<BuyingBonds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigation(),
      appBar: AppBar(
        title: Text(
          "SOVEREIGN GOLD BONDS",
          style: GoogleFonts.quicksand(
            textStyle: const TextStyle(
                color: Color(0xffFFFFFF),
                fontWeight: FontWeight.w500,
                fontSize: 20),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none),
            color: Colors.white,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.yellow.shade50),

              ///give image here for the background images
              // height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Invest in",
                              style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    color: Color(0xff22263D),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 30),
                              ),
                            ),
                            Text(
                              "Sovereign Gold Bond",
                              style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    color: Color(0xffFF405A),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 30),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Apply online through your Demat account and save ₹50 per gram",
                              style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    color: Color(0xff22263D),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),
                              ),
                            ),
                          ])),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 25,
                    width: MediaQuery.of(context).size.width / 2.2,
                    decoration: BoxDecoration(gradient: container_garidiant),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            "Listed on BSE/NSE",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  letterSpacing: 0),
                            ),
                          ),
                        )),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.check_circle,
                            color: Colors.greenAccent,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 25,
                    width: MediaQuery.of(context).size.width / 2.1,
                    decoration: BoxDecoration(gradient: container_garidiant),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                "+2.5% Interst Extra",
                                style: GoogleFonts.sourceSansPro(
                                  textStyle: const TextStyle(
                                      color: Color(0xffFFFFFF),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      letterSpacing: 0),
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.check_circle,
                            color: Colors.greenAccent,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 25,
                    width: MediaQuery.of(context).size.width / 1.7,
                    decoration: BoxDecoration(gradient: container_garidiant),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            "+ Capital Gains Tax Benefit",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  letterSpacing: 0),
                            ),
                          ),
                        )),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.check_circle,
                            color: Colors.greenAccent,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 25,
                    width: MediaQuery.of(context).size.width / 1.4,
                    decoration: BoxDecoration(gradient: container_garidiant),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            "36.741.27 Crore already Invested",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  letterSpacing: 0),
                            ),
                          ),
                        )),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.check_circle,
                            color: Colors.greenAccent,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 25,
                    width: MediaQuery.of(context).size.width / 1.35,
                    decoration: BoxDecoration(gradient: container_garidiant),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            "Issued by the Government of India",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  letterSpacing: 0),
                            ),
                          ),
                        )),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.check_circle,
                            color: Colors.greenAccent,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width / 2,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                              colors: [Colors.red.shade900, Colors.red],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight)),
                      child: Text(
                        "Buy this BOND now!",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: Color(0xffFFFFFF),
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              letterSpacing: 0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 20),
              child: Column(
                children: [
                  Text(
                    "Investing in Sovereign Gold Bond (Sgbs",
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          color: Color(0xff22263D),
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Issued br Reserve Bank Of India on behalf of Government of India , SOvereign Gold Bonds(SGBs) are the perfectg alternative to investment in physical gold. with these bonds , you can enjoy capital appreciation and also earn interst every year. These bonds , issued by the Government Of India , also eliminate several riosk associated with physical gold",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                          color: Color(0xff22263D),
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          letterSpacing: 0),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sovereign Gold Bond Benefits",
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          color: Color(0xff22263D),
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    color: Color(0xff9BA9AD),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.image,
                          size: 50,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Hassle-Free",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white)),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Ownership of gold without any physical possession (No risks and no cost of storage)",
                                softWrap: true,
                                style: GoogleFonts.sourceSansPro(
                                  textStyle: const TextStyle(
                                      color: Color(0xffFFFFFF),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      letterSpacing: 0),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    color: Color(0xffAD9FA0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.image,
                          size: 50,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Tax Treatmant",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white)),
                              Text(
                                "The capital gains tax arising on redemption of SGB to an individual has been exempted. The indexation benefits will be provided to long term capital gains arising to any person on transfer of bond.",
                                softWrap: true,
                                style: GoogleFonts.sourceSansPro(
                                  textStyle: const TextStyle(
                                      color: Color(0xffFFFFFF),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      letterSpacing: 0),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    color: Color(0xffCA8386),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.image,
                          size: 50,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Tradability",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white)),
                              Text(
                                "Bonds will be tradable on stock exchanges within a fortnight of the issuance on a date as notified by the RBI.",
                                softWrap: true,
                                style: GoogleFonts.sourceSansPro(
                                  textStyle: const TextStyle(
                                      color: Color(0xffFFFFFF),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      letterSpacing: 0),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    color: Color(0xffD67278),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.image,
                          size: 50,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Transferability",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white)),
                              Text(
                                "Bonds shall be transferable by execution of an Instrument of transfer in accordance with the provisions of the Government Securities Act.",
                                softWrap: true,
                                style: GoogleFonts.sourceSansPro(
                                  textStyle: const TextStyle(
                                      color: Color(0xffFFFFFF),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      letterSpacing: 0),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  // sovereign_bond_scheme_seriesX(),
                  Card(child: readBondWidget()),

                  SizedBox(
                    height: 30,
                  ),

                  investment(),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  ///we need to add the widet here
                  download_document(),
                  SizedBox(
                    height: 30,
                  ),
                  upcoming_issue(),
                  SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 55,
                      width: 160,
                      decoration: const BoxDecoration(
                        color: AppColors.btnColor,
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
                  treeWiddget(),
                  SizedBox(
                    height: 30,
                  ),

                  subscribe(),
                  SizedBox(
                    height: 30,
                  ),
                  needHelp(),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  sovereign_bond_scheme_seriesX() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
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
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: investment(),
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
              height: 20,
            ),
            needHelp(),
          ],
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
      Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Container(
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
      ),
      SizedBox(
        height: 10,
      )
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.50,
                  child: Column(
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
                        "2.5%",
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
                Container(
                  width: MediaQuery.of(context).size.width * 0.50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Allotment Date",
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
                        "Mar 08, 2022",
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
                      "Issue Opening-Closing\n Dates",
                      overflow: TextOverflow.ellipsis,
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
                      "Feb 28-Mar 04, 2022",
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
                Container(
                  width: MediaQuery.of(context).size.width * 0.50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Next Interest Payment Date",
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
                        "Sep 07, 2022",
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
                      "Interest Payment \nFrequency",
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
                      "Semi-Annually Every \n6 Months",
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
                Container(
                  width: MediaQuery.of(context).size.width * 0.50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Maturity after",
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
                        "Mar 07, 2027 ",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ),
                      ),
                      Text(
                        "(1st Exit Date)",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600,
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
                      "Purchase Limit",
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
                      "4 Kg/4000 units ",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ),
                    ),
                    Text(
                      "During each financial\nyear",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600,
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
                Container(
                  width: MediaQuery.of(context).size.width * 0.50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Issuer",
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
                        "Government of India",
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
                      "RBI Notice",
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
                      "https://www.rbi.org.in",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                            color: Color(0xffFF405A),
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
                Container(
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
                      "Exit Option Available",
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
                      "Yes ",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ),
                    ),
                    Text(
                        "After the 5th year.\nInvestors can \nexercise it on \nthe next interest\npayment dates.")
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget investment() {
    return Container(
        decoration: BoxDecoration(
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
                    child: Text(
                      "The maximum limit of subscription shall be 4 kg for individuals, 4 kg for Hindu Undivided Family (HUF) and 20 kg for trusts and similar entities notified by the government from time to time",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                            color: Color(0xff22263D),
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            letterSpacing: 0),
                      ),
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
                          Text("Mode of bonds",
                              style: GoogleFonts.sourceSansPro(
                                textStyle: const TextStyle(
                                  color: Color(0xff22263D),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              )),

                          ///add button here
// RadioListTile(value: "Gold Oty", groupValue:button_value, onChanged:(value){})
                          Text("Radio Button to be shown here")
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
                              Text("Enter gold quantity (A) ",
                                  style: GoogleFonts.sourceSansPro(
                                    textStyle: const TextStyle(
                                      color: Color(0xff22263D),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  )),
                              Text("(Range: 1 gm - 4000 gm)",
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
                            height: 40,
                            // width: 120,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x29000000),
                                  blurRadius: 3.0,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "2",
                                style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        color: Color(0xff22263D),
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                          Container(
                            height: 40,
                            // width: 120,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x29000000),
                                  blurRadius: 3.0,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    "",
                                    style: GoogleFonts.quicksand(
                                        textStyle: const TextStyle(
                                            color: Color(0xff22263D),
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
                                  ),

                                  /////drop down butyton here

                                  Container(
                                    child: DropdownButton<String>(
                                      onChanged: (value) {
                                        setState(() => selectedItem = value);
                                      },
                                      value: selectedItem,
                                      items: items
                                          .map((item) => DropdownMenuItem(
                                                value: item,
                                                child: Text(item),
                                              ))
                                          .toList(),
                                    ),
                                  )
                                ],
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
                              Text("Issue Price (B) ",
                                  style: GoogleFonts.sourceSansPro(
                                    textStyle: const TextStyle(
                                      color: Color(0xff22263D),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  )),
                              Text(
                                  " (Price of 1 gram of gold - ₹ 50 \nDiscount For Online Transaction)",
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
                              Text("Gold Quantity (A) x Issue Price (B)",
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
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        child: Container(
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
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
                    ],
                  ),
                ),
                Container(
                  color: AppColors.textColor,
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

  Widget issuerWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 30,
          width: 100,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: AppColors.btnColor),
          child: Center(
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
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Text(
              "Mahindra & Mahindra Financial",
              style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                      color: Color(0xff22263D),
                      fontSize: 17,
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              width: 20,
            ),
            Icon(
              Icons.keyboard_arrow_down,
              size: 25,
              color: AppColors.textColor,
            )
          ],
        ),
        const SizedBox(
          height: 10,
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
          height: 10,
        ),
        RichText(
          text: const TextSpan(children: [
            TextSpan(
                text: "Mahindra & Mahindra Financial ",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff22263D))),
            TextSpan(
                text:
                    "is a multi-billion dollar, transnational conglomerate. The Group’s activities span three core areas: Investment Banking, International Trading and Global Investments. It also supports charitable and philanthropic activities across the world through the Mahindra & Mahindra Foundation.",
                style: TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff22263D))),
          ]),
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 140,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total Annual Revenue",
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
                    "4,731 Cr (FY 21)",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Year of Inception",
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
                    "2007",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Industry",
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
                    "NBFC Retail",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 140,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Head Office",
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
                    "Mumbai",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Type of Issuer",
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
                    "Corporate",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Current MD/CEO",
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
                    "Rajashree Nambiar",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ],
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
        treeWiddget(),
      ],
    );
  }

  Widget treeWiddget() {
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
                Align(
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
        ],
      ),
    );
  }

  download_document() {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xffB73D48), Color(0xffEC515F)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight)),
        child: ListTile(
          minLeadingWidth: 0,
          leading: SvgPicture.asset(
            ConstantImage.issue_doc,
            height: 60,
            width: 60,
          ),
          title: Text(
            "DOWNLOAD ISSUE DOCUMENTS",
            style: GoogleFonts.quicksand(
              textStyle: const TextStyle(
                  color: Color(0xffFFFFFF),
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
          ),
          subtitle: Text(
              "The document contains high-quality data which is fetched from SEBI and Exchange websites to help you make an informed decision.",
              style: GoogleFonts.sourceSansPro(
                textStyle: const TextStyle(
                  color: Color(0xffFFFFFF),
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              )),
        ));
  }

  upcoming_issue() {
    return Column(
      children: [
        ListTile(
          title: Text(
            "Upcoming issues",
            style: GoogleFonts.quicksand(
              textStyle: const TextStyle(
                  color: Color(0xff22263D),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          subtitle: Text(
            "As declared by RBI, Gold bonds are issued every month. You can also easily plan your gold investments.",
            style: GoogleFonts.sourceSansPro(
              textStyle: const TextStyle(
                  color: Color(0xff1C1C1C),
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  letterSpacing: 0),
            ),
          ),
        ),
        Table(
          columnWidths: {0: FixedColumnWidth(60)},
          border: TableBorder.all(color: Colors.grey.shade400),
          children: [
            TableRow(children: [
              Container(
                width: MediaQuery.of(context).size.width / 9,
                decoration: BoxDecoration(color: Color(0xff2F2648)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "S.no",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          letterSpacing: 0),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(color: Color(0xff2F2648)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Issue Name*",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          letterSpacing: 0),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(color: Color(0xff2F2648)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Subscription Dates",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          letterSpacing: 0),
                    ),
                  ),
                ),
              ),
            ]),
            TableRow(children: [
              Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("1",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                            color: Color(0xff22263D),
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            letterSpacing: 0),
                      )),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("2020-21 Series X|",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                            color: Color(0xff22263D),
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            letterSpacing: 0),
                      )),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Oct 12, 2020 - Oct 16, 2020",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                            color: Color(0xff22263D),
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            letterSpacing: 0),
                      )),
                ),
              ),
            ]),
            TableRow(children: [
              Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("2",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                            color: Color(0xff22263D),
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            letterSpacing: 0),
                      )),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("2020-21 Series X|",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                            color: Color(0xff22263D),
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            letterSpacing: 0),
                      )),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Oct 12, 2020 - Oct 16, 2020",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                            color: Color(0xff22263D),
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            letterSpacing: 0),
                      )),
                ),
              ),
            ]),
            TableRow(children: [
              Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("3",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                            color: Color(0xff22263D),
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            letterSpacing: 0),
                      )),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("2020-21 Series X|",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                            color: Color(0xff22263D),
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            letterSpacing: 0),
                      )),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Oct 12, 2020 - Oct 16, 2020",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                            color: Color(0xff22263D),
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            letterSpacing: 0),
                      )),
                ),
              ),
            ]),
            TableRow(children: [
              Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("4",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                            color: Color(0xff22263D),
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            letterSpacing: 0),
                      )),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("2020-21 Series X|",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                            color: Color(0xff22263D),
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            letterSpacing: 0),
                      )),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Oct 12, 2020 - Oct 16, 2020",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                            color: Color(0xff22263D),
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            letterSpacing: 0),
                      )),
                ),
              ),
            ])
          ],
        )
      ],
    );
  }
}
