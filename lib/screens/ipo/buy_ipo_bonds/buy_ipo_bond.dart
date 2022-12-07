import 'package:flutter/material.dart';
import 'package:trust_money/utils/app_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import '../../../utils/colorsConstant.dart';
import '../../../utils/images.dart';
import '../../bond/bond_advantages.dart';
import 'category_table.dart';
import 'ipo_investor.dart';
import 'key_points.dart';
import 'ncds_series.dart';

class BuyIPOBond extends StatelessWidget {
  const BuyIPOBond({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppToolbar.appBar(
          "BUY BOND",
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 12, right: 12),
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
                  child: readBondWidget(context)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                  color: const Color(0xffE3D9D9).withOpacity(0.65),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CategoryTable(),
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: IPOsInvestor(),
            ),
            const SizedBox(
              height: 20,
            ),
            NCDsSeries()
          ],
        ),
      ),
    );
  }

  Widget readBondWidget(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 30,
          right: -4,
          child: Image.asset(
            ConstantImage.leaf,
            color: const Color(0xff00C6D8),
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
                        const Icon(
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
          const KeyPoints(),
        ]),
      ],
    );
  }
}
