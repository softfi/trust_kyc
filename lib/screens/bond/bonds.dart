import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';
import 'package:trust_money/screens/bond/read_more_bonds.dart';
import 'package:trust_money/utils/app_bottom_sheet.dart';
import 'package:trust_money/utils/colorsConstant.dart';
import 'package:trust_money/utils/images.dart';
import 'package:trust_money/utils/styles.dart';

import '../../bottom_navigation/bottom_navigation.dart';

class Bonds extends StatefulWidget {
  const Bonds({Key? key}) : super(key: key);

  @override
  State<Bonds> createState() => _BondsState();
}

class _BondsState extends State<Bonds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE8E8E8),
      bottomNavigationBar: CustomBottomNavigation(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Column(
          children: [
            Container(
              height: 80,
              color: Color(0xff00C6D8),
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
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
                          "EXPLORE BONDS",
                          style: ConstStyle.quickStandSmall11,
                        ),
                        IconButton(
                          icon:
                          const Icon(Icons.notifications_none, color: Colors.white),
                          onPressed: () {},
                        ),
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
                    readBondWidget(),
                  ],
                ),
              ),
            ),
          ),
        /*  Positioned(
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
          ),*/
          Positioned(
            top: 2,
            right: 0,
            child: Image.asset(
              ConstantImage.leaf,
              color: Colors.black26,
              height: 300,
            ),
          )
        ],
      ),
    );
  }

  Widget readBondWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 60,
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
              color: Color(0x29000000),
              blurRadius: 3.0,
            ),
          ], color: Colors.white),
          child: TextFormField(
            decoration: InputDecoration(
                fillColor: Colors.white54,
                filled: true,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 20),
                hintText: "Bond name, issuer and bond type",
                hintStyle: GoogleFonts.sourceSansPro(
                  textStyle: const TextStyle(
                      color: Color(0xff1D2B84), fontWeight: FontWeight.w400, fontSize: 16),
                ),
                prefixIcon: const Icon(Icons.search,color: Color(0xff1D2B84),),
                suffixIcon: InkWell(
                  onTap: () {},
                  child: Container(
                    width: 100,
                    decoration: const BoxDecoration(
                      color: AppColors.textColor,
                      boxShadow: [],
                    ),
                    child: Center(
                        child: Text(
                      "Search",
                      style: GoogleFonts.sourceSansPro(
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    )),
                  ),
                )),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(boxShadow: const [
            BoxShadow(
              color: Color(0x29000000),
              blurRadius: 3.0,
            ),
          ], color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 13.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "Filter",
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: Color(0xff22263D), fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    SvgPicture.asset(
                      ConstantImage.filter,
                      width: 20,
                      height: 20,
                        color: Color(0xff22263D)

                    ),
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                        onTap: () async{
                     // AppBottomSheet.showSortingBottomSheet(context);

                        },
                        child: Text(
                          "Sort by ",
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: Color(0xff22263D), fontWeight: FontWeight.w600, fontSize: 15),
                          ),
                        )),
                    const SizedBox(
                      width: 6,
                    ),
                    SvgPicture.asset(
                      ConstantImage.sorting,
                      width: 20,
                      height: 20,
                      color: Color(0xff22263D),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 5,),
        bondList(),
      ],
    );
  }

  Widget bondList() {
    return ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                  color: Color(0x29000000),
                  blurRadius: 2.0,
                ),
              ], color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 30,
                      width: 40,
                      decoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(5)),
                          color: AppColors.textColor),
                      child: const Center(
                        child: Icon(
                          Icons.share,
                          color: Colors.white,
                          size: 14,
                        ),
                      ),
                    ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.55,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.28,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Coupon",
                                          style: GoogleFonts.sourceSansPro(
                                            textStyle: const TextStyle(
                                                color: Color(0xff1D2B84),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "8.00%",
                                          style: GoogleFonts.sourceSansPro(
                                            textStyle: const TextStyle(
                                                color: Color(0xffFF405A),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Yield",
                                        style: GoogleFonts.sourceSansPro(
                                          textStyle: const TextStyle(
                                              color: Color(0xff1D2B84),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        "10.60%",
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
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.28,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Invest Payment",
                                          style: GoogleFonts.sourceSansPro(
                                            textStyle: const TextStyle(
                                                color: Color(0xff1D2B84),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "Annual",
                                          style: GoogleFonts.sourceSansPro(
                                            textStyle: const TextStyle(
                                                color: Color(0xffFF405A),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Min. Invest",
                                        style: GoogleFonts.sourceSansPro(
                                          textStyle: const TextStyle(
                                              color: Color(0xff1D2B84),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        "Annual",
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
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: Image.asset(
                          "assets/images/meter.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 35,
                          child: Text(
                            "IPO",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                  color: Color(0xffFF405A),
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ReadMoreBonds()));
                          },
                          child: Container(
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x29000000),
                                  blurRadius: 5.0,
                                ),
                              ],
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xffEC515F),
                                  Color(0xffC4414D),
                                ],
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                              ),
                            ),
                            child: Center(
                                child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40.0),
                              child: Text("Read More",
                                  style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                      color:Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                                  )),
                            )),
                          ),
                        ),
                        Container(width: 35,)
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          );
        });
  }

  // Widget openShortingBottom(BuildContext context1) {
  //   return
  // }
}
