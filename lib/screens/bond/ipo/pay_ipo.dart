import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/screens/animated_screens/verified_animation.dart';
import 'package:trust_money/screens/bond/ipo/order_confirmation/bid.dart';
import '../../../utils/app_bar.dart';
import '../../../utils/colorsConstant.dart';

class PayIPO extends StatefulWidget {
  const PayIPO({Key? key}) : super(key: key);

  @override
  State<PayIPO> createState() => _PayIPOState();
}

class _PayIPOState extends State<PayIPO> {
  int index = 0;
  bool isBankShowing = false;
  bool isUpiShowing = false;
  String upis = "@okicici";
  var upiList = [
    '@okicici',
    '@upi',
    '@ybl',
    '@paytm',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppToolbar.appBar(
          "PAYMENT",
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            selectDematAccount(context),
          ],
        ),
      ),
    );
  }

  Widget selectDematAccount(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 5,
            ),
            Text("Select Demat Account",
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.79,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xffDBF6FA),
                          Color(0xffFFD5D9),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Image.asset(
                                    "assets/images/arrow.png",
                                    height: 45,
                                    width: 55,
                                    color: AppColors.textColor,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    height: 20,
                                    width: 80,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(8),
                                            topLeft: Radius.circular(8)),
                                        color: Color(0xffffc440)),
                                    child: Center(
                                        child: Text(
                                      "PRIMARY",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: const TextStyle(
                                          color: AppColors.textColor,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                        ),
                                      ),
                                    )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.30,
                                    child: Text(" TRUST MONEY",
                                        style: GoogleFonts.sourceSansPro(
                                          textStyle: const TextStyle(
                                              color: AppColors.textColor,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              letterSpacing: 0.75),
                                        )),
                                  ),
                                  Container(
                                    height: 16,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(5)),
                                      color: AppColors.textColor,
                                    ),
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Center(
                                          child: Text(
                                        "NSDL",
                                        style: TextStyle(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                child: Text(
                                  "JAIRAJ BHAWAN SHANKAR",
                                  // overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.sourceSansPro(
                                    textStyle: const TextStyle(
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                // width:
                                // MediaQuery.of(context).size.width *
                                //     0.40,
                                child: Text(
                                  "1234-1234-4567890",
                                  style: GoogleFonts.sourceSansPro(
                                    textStyle: const TextStyle(
                                      letterSpacing: 2,
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ]),
                  ),
                  Container(
                    height: double.infinity,
                    width: MediaQuery.of(context).size.width * 0.14,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xffDBF6FA),
                          Color(0xffFFD5D9),
                        ],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                    ),
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text("Select Payment Mode",
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      index = 1;
                      isBankShowing = true;
                      isUpiShowing = false;
                    });
                  },
                  child: Container(
                    height: 34,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x29000000),
                            blurRadius: 6.0,
                          ),
                        ],
                        border: Border.all(
                            width: 1,
                            color: index == 1
                                ? Color(0xff22263D)
                                : Color(0xff22263D)),
                        color: index == 1 ? Color(0xff22263D) : Colors.white),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        "ASBA",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: TextStyle(
                              color:
                                  index == 1 ? Colors.white : Color(0xff22263D),
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                      ),
                    )),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      index = 2;
                      isBankShowing = false;
                      isUpiShowing = true;
                    });
                  },
                  child: Container(
                    height: 34,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x29000000),
                            blurRadius: 6.0,
                          ),
                        ],
                        border: Border.all(
                            width: 1,
                            color: index == 2
                                ? Color(0xff22263D)
                                : Color(0xff22263D)),
                        color: index == 2 ? Color(0xff22263D) : Colors.white),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        "UPI",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: TextStyle(
                              color:
                                  index == 2 ? Colors.white : Color(0xff22263D),
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                      ),
                    )),
                  ),
                ),
              ],
            ),
            /*   Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      upiIndex = 1;
                      isBankShowing = true;
                      isUpiShowing = false;
                    });
                  },
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: 1, color: AppColors.primaryColor),
                        color:
                            upiIndex == 1 ? Colors.white : Color(0xff22263D)),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "ASBA",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: TextStyle(
                              color: upiIndex == 1
                                  ? Color(0xff22263D)
                                  : Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                      ),
                    )),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      upiIndex = 2;
                      isBankShowing = false;
                      isUpiShowing = true;
                    });
                  },
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: 1, color: AppColors.primaryColor),
                        color:
                            upiIndex == 2 ? Colors.white : Color(0xff22263D)),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "UPI",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: TextStyle(
                              color: upiIndex == 2
                                  ? Color(0xff22263D)
                                  : Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                      ),
                    )),
                  ),
                ),
              ],
            ),*/
            const SizedBox(
              height: 20,
            ),
            Visibility(
              visible: isBankShowing,
              child: SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.79,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xffFFFFFF),
                            Color(0xffF8C1C6),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: Image.asset(
                                      "assets/images/elefant.png",
                                      height: 45,
                                      width: 55,
                                      color: AppColors.textColor,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      height: 20,
                                      width: 80,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(8),
                                              topLeft: Radius.circular(8)),
                                          color: Color(0xffffc440)),
                                      child: Center(
                                          child: Text(
                                        "PRIMARY",
                                        style: GoogleFonts.sourceSansPro(
                                          textStyle: const TextStyle(
                                            color: AppColors.textColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                          ),
                                        ),
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.30,
                                      child: Text("HDFC BANK",
                                          style: GoogleFonts.sourceSansPro(
                                            textStyle: TextStyle(
                                                color: AppColors.textColor,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 15,
                                                letterSpacing: 0.75),
                                          )),
                                    ),
                                    Container(
                                      height: 16,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            bottomRight: Radius.circular(5)),
                                        color: AppColors.textColor,
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Center(
                                            child: Text(
                                          "Saving A/C",
                                          style: TextStyle(
                                            fontSize: 8,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.40,
                                  child: Text(
                                    "XXXXXXX551",
                                    maxLines: 1,
                                    style: GoogleFonts.sourceSansPro(
                                      textStyle: const TextStyle(
                                        color: AppColors.textColor,
                                        letterSpacing: 3,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ]),
                    ),
                    InkWell(
                      onTap: () {
                        showSortingBottomSheet(context);
                      },
                      child: Container(
                        height: double.infinity,
                        width: MediaQuery.of(context).size.width * 0.14,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xffFFFFFF),
                              Color(0xffF8C1C6),
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                        ),
                        child: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black,
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
            Visibility(
              visible: isUpiShowing,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pay by UPI",
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Enter Your UPI ID",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                border: Border.all(
                                    color: AppColors.textColor, width: 0.8)),
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: TextField(
                                decoration: InputDecoration(
                                    hintStyle: GoogleFonts.sourceSansPro(
                                      textStyle: const TextStyle(
                                        color: AppColors.greyColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                    hintText: "UPI ID",
                                    border: InputBorder.none),
                              ),
                            )),
                        Container(
                          padding: EdgeInsets.only(left: 8),
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.33,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(
                                  color: AppColors.textColor, width: 0.8)),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              hint: const Text("@okicici",
                                  style: TextStyle(
                                      color: Color(0xffC8C7CE),
                                      letterSpacing: 2)),
                              items: upiList.map((item) {
                                return DropdownMenuItem(
                                    value: item, child: Text(item));
                              }).toList(),
                              onChanged: (String? value) {
                                // This is called when the user selects an item.
                                print("==========upi $value");
                                print("==========upi $upis");
                                setState(() {
                                  upis = value!;
                                });
                              },
                              value: upis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 250,
            ),
            InkWell(
              onTap: () {
                if (index != 0) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VerifiedAnim(
                            title: 'Processing...',
                            subTitle:
                                'Please wait while we process your payment. Do not click the Back or Close button of your app.',
                            image: 'assets/images/loding.mp4',
                            onClick: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyBID()))),
                      ));
                }
              },
              child: Center(
                child: Container(
                  width: 210,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: index != 0 ? AppColors.btnColor : Color(0xffCCCCCC),
                  ),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Text("Confirm Order and Pay",
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
              height: 30,
            )
          ]),
    );
  }

  static showSortingBottomSheet(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 20),
                    color: AppColors.primaryColor,
                    child: ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: SizedBox(
                              height: 90,
                              width: MediaQuery.of(context).size.width,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.79,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xffFFFFFF),
                                      Color(0xffF8C1C6),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 20.0),
                                              child: Image.asset(
                                                "assets/images/elefant.png",
                                                height: 45,
                                                width: 55,
                                                color: AppColors.textColor,
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Container(
                                                height: 20,
                                                width: 80,
                                                decoration: const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(8),
                                                            topLeft:
                                                                Radius.circular(
                                                                    8)),
                                                    color: Color(0xffB3B3B5)),
                                                child: Center(
                                                    child: Text(
                                                  "PRIMARY",
                                                  style:
                                                      GoogleFonts.sourceSansPro(
                                                    textStyle: const TextStyle(
                                                      color:
                                                          AppColors.textColor,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                )),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.30,
                                                child: Text("BANK OF INDIA",
                                                    style: GoogleFonts
                                                        .sourceSansPro(
                                                      textStyle:
                                                          const TextStyle(
                                                              color: AppColors
                                                                  .textColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 15,
                                                              letterSpacing:
                                                                  0.75),
                                                    )),
                                              ),
                                              Container(
                                                height: 16,
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft: Radius
                                                              .circular(5),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  5)),
                                                  color: AppColors.textColor,
                                                ),
                                                child: const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                                  child: Center(
                                                      child: Text(
                                                    "Saving A/C",
                                                    style: TextStyle(
                                                      fontSize: 8,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white,
                                                    ),
                                                  )),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.40,
                                            child: Text(
                                              "XXXXXXX564",
                                              maxLines: 1,
                                              style: GoogleFonts.sourceSansPro(
                                                textStyle: const TextStyle(
                                                  letterSpacing: 3,
                                                  color: AppColors.textColor,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ]),
                              ),
                            ),
                          ),
                        );
                      },
                    )),
              ],
            ),
          );
        });
      },
    );
  }
}
