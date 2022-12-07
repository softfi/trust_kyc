import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';
import '../../utils/colorsConstant.dart';
import '../../utils/styles.dart';

class PayIPO extends StatefulWidget {
  const PayIPO({Key? key}) : super(key: key);

  @override
  State<PayIPO> createState() => _PayIPOState();
}

class _PayIPOState extends State<PayIPO> {
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Column(
          children: [
            Container(
              height: 70,
              color: const Color(0xff00C6D8),
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
                          "PAYMENT",
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
            child: SingleChildScrollView(
                child: Column(
              children: [
                selectDematAccount(context),
              ],
            )),
          ),
        ],
      ),
    );
  }

  Widget selectDematAccount(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
        SizedBox(
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
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(8),
                                    topLeft: Radius.circular(8)),
                                color: Color(0xffffc440)),
                            child: Center(
                                child: Text(
                              "PRIMARY",
                              style: GoogleFonts.sourceSansPro(
                                textStyle: TextStyle(
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
                            width: MediaQuery.of(context).size.width * 0.30,
                            child: Text(" TRUST MONEY",
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
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(5)),
                              color: AppColors.textColor,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Center(
                                  child: Text(
                                "ljiyu8y",
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
                        // width:
                        // MediaQuery.of(context).size.width *
                        //     0.40,
                        child: Text(
                          "JAIRAJ BHAWAN SHANKAR",
                          // overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.sourceSansPro(
                            textStyle: TextStyle(
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
                          " 1234-1234-4567890",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: TextStyle(
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
                decoration: BoxDecoration(
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
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text("Registered Bank Accounts",
            style: GoogleFonts.quicksand(
              textStyle: const TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            )),
        SizedBox(
          height: 10,
        ),
        SizedBox(
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
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(8),
                                    topLeft: Radius.circular(8)),
                                color: Color(0xffffc440)),
                            child: Center(
                                child: Text(
                              "PRIMARY",
                              style: GoogleFonts.sourceSansPro(
                                textStyle: TextStyle(
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.30,
                            child: Text(" TRUST MONEY",
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
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(5)),
                              color: AppColors.textColor,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Center(
                                  child: Text(
                                "ljiyu8y",
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
                        width: MediaQuery.of(context).size.width * 0.40,
                        child: Text(
                          "1234-1234-4567890",
                          maxLines: 1,
                          style: GoogleFonts.sourceSansPro(
                            textStyle: TextStyle(
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
                decoration: BoxDecoration(
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
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 50,
        ),
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
                      border:
                          Border.all(color: AppColors.textColor, width: 0.8)),
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
                    border: Border.all(color: AppColors.textColor, width: 0.8)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    hint: const Text("@okicici",
                        style: TextStyle(
                            color: Color(0xffC8C7CE), letterSpacing: 2)),
                    items: upiList.map((item) {
                      return DropdownMenuItem(value: item, child: Text(item));
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
        const SizedBox(
          height: 120,
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
        const SizedBox(
          height: 30,
        )
      ]),
    );
  }
}
