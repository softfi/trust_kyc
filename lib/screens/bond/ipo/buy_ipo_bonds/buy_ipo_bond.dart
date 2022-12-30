import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trust_money/screens/bond/tringle.dart';
import 'package:trust_money/utils/app_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import '../../../../getx_controller/bond/read_more_bond_controller.dart';
import '../../../../utils/colorsConstant.dart';
import '../../../../utils/images.dart';
import '../../../home/home_page.dart';
import '../../../news_and_insights/explore.dart';
import '../pay_ipo.dart';
import 'category_table.dart';
import 'constWidget.dart';
import 'ipo_investor.dart';
import 'key_points.dart';
import 'ncds_series.dart';
import 'nonipo_buy_bonds.dart';

class BuyIPOBond extends StatelessWidget {
  BuyIPOBond({Key? key, required this.isNonIPO}) : super(key: key);
  bool isNonIPO;
  RxBool isChecked1 = false.obs;
  ReadMoreBond _readMoreBond = Get.put(ReadMoreBond());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppToolbar.appBar(
          "BUY BOND",
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {},
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(top: 5, left: 12, right: 12),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      boxShadow:  [
                        BoxShadow(
                          color: Color(0x29000000),
                          blurRadius: 5.0,
                        ),
                      ],
                      color: Colors.white),
                  child: readBondWidget(context)),
            ),
            Visibility(
              child: isNonIPO
                  ? Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 12),
                      child: BuyNonIpoBonds.nonIPOInvestCalculator(
                          true,
                          context,
                          _readMoreBond.allBondListOfIpoByBondId.value!,false),
                    )
                  : Column(
                      children: [
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: NCDsSeries(isShow: false),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 14, vertical: 12),
                          color: Color(0xff00C6D8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Grand Total (₹) ",
                                    style: GoogleFonts.quicksand(
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                  Text(
                                    "( A+B+C+D+E+F)",
                                    style: GoogleFonts.quicksand(
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "2,00,000",
                                style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() =>Checkbox(
                    checkColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    // color of tick Mark
                    activeColor: AppColors.primaryColor,
                    value: isChecked1.value,
                    onChanged: (bool? value) {
                      isChecked1.value = value!;
                    },
                  )),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "I have read and agreed to the ",
                              style: GoogleFonts.sourceSansPro(
                                textStyle: const TextStyle(
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                              )),
                          TextSpan(
                              text: "disclaimer ",
                              style: GoogleFonts.sourceSansPro(
                                textStyle: const TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: AppColors.btnColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                              )),
                          TextSpan(
                              text: "and ",
                              style: GoogleFonts.sourceSansPro(
                                textStyle: const TextStyle(
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                              )),
                          TextSpan(
                              text: "terms & conditions",
                              style: GoogleFonts.sourceSansPro(
                                textStyle: const TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: AppColors.btnColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                              )),
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => PayIPO()));
              },
              child: Center(
                child: Container(
                  width: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xffFF405A),
                  ),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text("Continue to Buy",
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
            ),
            const SizedBox(
              height: 20,
            ),
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
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: (_readMoreBond.allBondListOfIpoByBondId.value!.bondLogo ==
                          null)
                      ? Image.asset(ConstantImage.orderImg)
                      : Image.network(
                          _readMoreBond.allBondListOfIpoByBondId.value!.bondLogo,
                          errorBuilder: (context, error, stackTrace) =>
                              Image.asset(ConstantImage.orderImg),
                        ),
                ),
                const SizedBox(
                  width: 13,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Text(
                      _readMoreBond.allBondListOfIpoByBondId.value!.bondIssuerName??"",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                          color: Color(0xff22263D),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      )),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                isNonIPO
                    ? Container(
                        height: 35,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(12)),
                            color: AppColors.greenColor),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Center(
                            child: Text(
                              "Returns Based On Gold Prices",
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
                      )
                    : Container(),
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
                          text: TextSpan(children: [
                            TextSpan(
                                text: "ISIN: ",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffFF405A))),
                            TextSpan(
                                text:
                                    "${_readMoreBond.allBondListOfIpoByBondId.value!.bondIsinNumber}",
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
          // Visibility(
          //     child: isNonIPO
          //         ? ConstWidget.keyPointsConsider(
          //             context,
          //           )
          //         : KeyPoints()),
        ]),
      ],
    );
  }
}
