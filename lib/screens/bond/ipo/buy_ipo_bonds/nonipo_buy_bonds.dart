import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/utils/sharedPreference.dart';
import '../../../../bottom_sheets/bottom_sheet.dart';
import '../../../../getx_controller/bond/inestment_calculator_controller.dart';
import '../../../../model/bond/bond_details_modal.dart';
import '../../../../utils/colorsConstant.dart';
import '../../../../utils/images.dart';
import '../pay_ipo.dart';
import 'buy_ipo_bond.dart';
RxBool isKycDone=false.obs;
class BuyNonIpoBonds extends GetxController{




  static nonIPOInvestCalculator1() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            gradient: LinearGradient(
              colors: [
                Color(0xffFFB4BB).withOpacity(0.30),
                Color(0xff84F5FF).withOpacity(0.30),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
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
          )),
    );
  }

  static nonIPOInvestCalculator(bool userIsLoggedIn, BuildContext context, BondDetails _bondDetails,bool isFirstPage){
    InvestmentCalculatorController _investmentCalculator =
        Get.put(InvestmentCalculatorController());
    _investmentCalculator.getInvestmentCalculatorData(
        _bondDetails.message.bondDetails.bondIsinNumber,
        _investmentCalculator.bondNoValue.value,false);

    fn();
    return Obx(() => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              gradient: const LinearGradient(
                colors: [
                  Color(0xffFFB4BB),
                  Color(0xff84F5FF),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 60,
                  right: 8,
                  child: Image.asset(
                    ConstantImage.leaf,
                    color: Colors.white,
                    height: 300,
                  ),
                ),
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
                                  "₹ ${_investmentCalculator.investmentCalculatorModal.value!.faceValue}",
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
                                  "₹ ${_investmentCalculator.investmentCalculatorModal.value!.marketValue}",
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
                                  "${_investmentCalculator.investmentCalculatorModal.value!.yieldValue}%",
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
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.50,
                                child: Column(
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
                                    Text(
                                        "No. of Bonds you want to \nPurchase (C)",
                                        style: GoogleFonts.sourceSansPro(
                                          textStyle: const TextStyle(
                                            color: Color(0xff22263D),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    behavior: HitTestBehavior.deferToChild,
                                    onTap: () =>
                                        _investmentCalculator.updateBondNumber(
                                            "Sub",
                                            _bondDetails.message.bondDetails
                                                .bondIsinNumber),
                                    child: AbsorbPointer(
                                      child: Container(
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
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                        ),
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
                                        child: Obx(
                                      () => (Text(
                                        _investmentCalculator.bondNoValue.value
                                            .toString(),
                                        style: GoogleFonts.quicksand(
                                            textStyle: const TextStyle(
                                                color: Color(0xff22263D),
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold)),
                                      )),
                                    )),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  GestureDetector(
                                    onTap: () =>
                                        _investmentCalculator.updateBondNumber(
                                            "Add",
                                            _bondDetails.message.bondDetails
                                                .bondIsinNumber),
                                    child: Container(
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
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.50,
                                child: Column(
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
                                    "₹ ${_investmentCalculator.investmentCalculatorModal.value!.principalAmount}",
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
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.50,
                                child: Column(
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
                                    "₹ ${_investmentCalculator.investmentCalculatorModal.value!.accruedInterest}",
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
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.50,
                                child: Column(
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
                                    "₹ ${_investmentCalculator.investmentCalculatorModal.value!.totalInvestment}",
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
                          InkWell(
                            onTap: ()=>isKycDone.value==true?((isFirstPage)?Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BuyIPOBond(
                                      isNonIPO: _bondDetails.message.bondDetails.bondType == 3 || _bondDetails.message.bondDetails.bondType==2,
                                    ))):
                            Navigator.push(context, MaterialPageRoute(builder: (context) => PayIPO()))):
                            ShowBottomSheet().CommomBottomSheet(context, "Complete your kyc first","",Container()),
                            child: Container(
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20.0),
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
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }

  static whatIWillEarn(bool userIsLoggedIn, BuildContext context, BondDetails _bondDetails){
    RxBool isArrowChange = false.obs;
    RxBool isArrow = false.obs;
   return Obx(() => Container(
      decoration: BoxDecoration(
          color: AppColors.textColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10))),
      child: ExpansionTile(
        onExpansionChanged: (val) {
          isArrow.value = val;
        },
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
                    fontSize: 18),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            isArrow.value
                ? const Icon(
              Icons.keyboard_arrow_up,
              color: Colors.white,
              size: 25,
            )
                : const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
              size: 25,
            )
          ],
        ),
        trailing: const SizedBox(),
        children: <Widget>[
          Column(
            children: [
              const DottedLine(
                direction: Axis.horizontal,
                // lineLength: double.infinity,
                lineThickness: 1,
                dashLength: 5.0,
                dashColor: Colors.white,
                dashGapLength: 3.0,
                dashGapColor: Colors.transparent,
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 8),
                  title: Column(
                    children: [
                      Container(
                          height: 60,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.only(
                                  topRight:
                                  Radius.circular(
                                      8),
                                  bottomRight:
                                  Radius.circular(
                                      8))),
                          child: Row(
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 12,
                              ),
                              Text(
                                "12/05/2022",
                                style: GoogleFonts.sourceSansPro(
                                    textStyle:
                                    const TextStyle(
                                        fontSize: 16,
                                        fontWeight:
                                        FontWeight
                                            .w500,
                                        color: Color(
                                            0xff22263D))),
                              ),
                              const SizedBox(
                                width: 45,
                              ),
                              Column(
                                mainAxisAlignment:
                                MainAxisAlignment
                                    .center,
                                crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,
                                children: [
                                  Text(
                                    "Your investment as of today",
                                    style: GoogleFonts.sourceSansPro(
                                        textStyle: const TextStyle(
                                            fontSize: 13,
                                            fontWeight:
                                            FontWeight
                                                .w500,
                                            color: Color(
                                                0xff22263D))),
                                  ),
                                  Text(
                                    "₹ 21,20,202",
                                    style: GoogleFonts.sourceSansPro(
                                        textStyle: const TextStyle(
                                            fontSize: 16,
                                            fontWeight:
                                            FontWeight
                                                .w500,
                                            color: Color(
                                                0xff22263D))),
                                  )
                                ],
                              )
                            ],
                          )),
                      SizedBox(
                        height: 2,
                      ),
                      ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        physics:
                        const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Obx(() => Padding(
                              padding: const EdgeInsets
                                  .symmetric(vertical: 2.0),
                              child: Container(
                                decoration:
                                const BoxDecoration(
                                  borderRadius:
                                  BorderRadius.only(
                                    topRight:
                                    Radius.circular(8),
                                    // bottomLeft: Radius.circular(8),bottomRight: Radius.circular(8)
                                  ),
                                  color: Colors.white,
                                ),
                                child: ExpansionTile(
                                  title: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceEvenly,
                                    children: [
                                      Container(
                                        color: Color(
                                            0xffF2FCFD),
                                        child: Padding(
                                          padding:
                                          const EdgeInsets
                                              .all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment
                                                .start,
                                            children: [
                                              Text(
                                                  "Interest",
                                                  style: GoogleFonts
                                                      .sourceSansPro(
                                                    textStyle:
                                                    const TextStyle(
                                                      color:
                                                      Color(0xff22263D),
                                                      fontWeight:
                                                      FontWeight.w600,
                                                      fontSize:
                                                      10,
                                                    ),
                                                  )),
                                              Text(
                                                  "₹ 88,862.4",
                                                  style: GoogleFonts
                                                      .sourceSansPro(
                                                    textStyle:
                                                    const TextStyle(
                                                      color:
                                                      Color(0xff22263D),
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      fontSize:
                                                      16,
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                      // VerticalDivider(color: Colors.black,thickness: 2,),

                                      Row(
                                        children: [
                                          Container(
                                            width: 2,
                                            color: Color(
                                                0xff00000029),
                                            height: 50,
                                          ),
                                          Container(
                                            color: Color(
                                                0xffFEF4F4),
                                            child: Padding(
                                              padding:
                                              const EdgeInsets
                                                  .all(
                                                  8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Text(
                                                      "Dividend",
                                                      style:
                                                      GoogleFonts.sourceSansPro(
                                                        textStyle:
                                                        const TextStyle(
                                                          color: Color(0xff22263D),
                                                          fontWeight: FontWeight.w600,
                                                          fontSize: 10,
                                                        ),
                                                      )),
                                                  Text(
                                                      "₹ 27,542.2",
                                                      style:
                                                      GoogleFonts.sourceSansPro(
                                                        textStyle:
                                                        const TextStyle(
                                                          color: Color(0xff22263D),
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 16,
                                                        ),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 2,
                                            color: Color(
                                                0xff00000029),
                                            height: 50,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  leading: Text(
                                      "12/06/2023",
                                      style: GoogleFonts
                                          .sourceSansPro(
                                        textStyle:
                                        const TextStyle(
                                          color: Color(
                                              0xff22263D),
                                          fontWeight:
                                          FontWeight
                                              .w500,
                                          fontSize: 16,
                                        ),
                                      )),
                                  trailing:
                                  isArrowChange.value
                                      ? const Icon(
                                    Icons
                                        .keyboard_arrow_up,
                                    color: AppColors
                                        .primaryColor,
                                    size: 25,
                                  )
                                      : const Icon(
                                    Icons
                                        .keyboard_arrow_down,
                                    color: AppColors
                                        .primaryColor,
                                    size: 25,
                                  ),
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius
                                                  .circular(
                                                  8),
                                              bottomRight: Radius
                                                  .circular(
                                                  8),
                                              bottomLeft: Radius
                                                  .circular(
                                                  8))),
                                      child:
                                      ListView.builder(
                                          itemCount: 5,
                                          shrinkWrap:
                                          true,
                                          physics:
                                          const NeverScrollableScrollPhysics(),
                                          itemBuilder:
                                              (context,
                                              index) {
                                            return Container(
                                              color: (index % 2 ==
                                                  0)
                                                  ? Colors
                                                  .white
                                                  : Color(
                                                  0xffF3F5F6),
                                              child:
                                              ListTile(
                                                dense:
                                                true,
                                                contentPadding: EdgeInsets.symmetric(
                                                    horizontal:
                                                    15,
                                                    vertical:
                                                    0),
                                                visualDensity: VisualDensity(
                                                    horizontal:
                                                    -4,
                                                    vertical:
                                                    -4),
                                                leading: Text(
                                                    "12/05/2023",
                                                    style:
                                                    GoogleFonts.sourceSansPro(
                                                      textStyle: const TextStyle(
                                                        color: Color(0xff22263D),
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 16,
                                                      ),
                                                    )),
                                                title:
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Text("₹ 854.50",
                                                        style: GoogleFonts.sourceSansPro(
                                                          textStyle: const TextStyle(
                                                            color: Color(0xff22263D),
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 16,
                                                          ),
                                                        )),
                                                    Text("₹ 276.86",
                                                        style: GoogleFonts.sourceSansPro(
                                                          textStyle: const TextStyle(
                                                            color: Color(0xff22263D),
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 16,
                                                          ),
                                                        )),
                                                    Text("   ")
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                  ],
                                  onExpansionChanged:
                                      (bool expanded) {
                                    isArrowChange.value =
                                        expanded;
                                  },
                                ),
                              )));
                        },
                      ),
                    ],
                  )),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          DottedLine(
            direction: Axis.horizontal,
            // lineLength: double.infinity,
            lineThickness: 1,
            dashLength: 5.0,
            dashColor: Colors.white,
            dashGapLength: 3.0,
            dashGapColor: Colors.transparent,
          ),
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff00C6D8),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8))),
                  padding: EdgeInsets.only(left: 15),
                  height: 103,
                  child: Column(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Interest Earned",
                        style: GoogleFonts.sourceSansPro(
                            textStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight:
                                FontWeight.normal)),
                      ),
                      Text(
                        "₹ 4,44,312",
                        style: GoogleFonts.sourceSansPro(
                            textStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Text(
                        "( Yield at 7.97% p.a )",
                        style: GoogleFonts.sourceSansPro(
                            textStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight:
                                FontWeight.normal)),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: DottedLine(
                  direction: Axis.vertical,
                  lineLength: 103,
                  lineThickness: 1,
                  dashLength: 5.0,
                  dashColor: Colors.white,
                  dashGapLength: 3.0,
                  dashGapColor: Colors.transparent,
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 15),
                  height: 103,
                  color: Color(0xffFF405A),
                  child: Column(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Returns",
                        style: GoogleFonts.sourceSansPro(
                            textStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight:
                                FontWeight.normal)),
                      ),
                      Text(
                        "₹ 25,64,514",
                        style: GoogleFonts.sourceSansPro(
                            textStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }

  static void fn() async{
  isKycDone.value =await HelperFunctions.getUserKycCompleted()??false;
  debugPrint(isKycDone.value.toString());
  debugPrint("isKycDone.value.toString()");
  }

  @override
  void onInit() {
    fn();
    // TODO: implement onInit
    super.onInit();
  }
}
