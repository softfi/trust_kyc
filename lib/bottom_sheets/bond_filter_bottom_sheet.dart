import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colorsConstant.dart';

class AppBottomSheet {
  static showSortingBottomSheet(BuildContext context, int index,
      int safetyIndex, int yieldIndex, int tenureIndex) async {
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
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    color: AppColors.primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "SORT BY",
                                style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(Icons.clear,
                                    color: Colors.white, size: 25),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Investment",
                            style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Divider(
                            thickness: 1.5,
                            color: AppColors.greyColor,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  State(() {
                                    index = 1;
                                  });
                                },
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0x29000000),
                                          blurRadius: 6.0,
                                        ),
                                      ],
                                      border: Border.all(
                                          width: 1, color: Colors.white),
                                      color: index == 1
                                          ? Colors.white
                                          : const Color(0xff22263D)),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Text(
                                      "High Investment",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: TextStyle(
                                            color: index == 1
                                                ? const Color(0xff22263D)
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
                                  State(() {
                                    index = 2;
                                  });
                                },
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0x29000000),
                                          blurRadius: 6.0,
                                        ),
                                      ],
                                      border: Border.all(
                                          width: 1, color: Colors.white),
                                      color: index == 2
                                          ? Colors.white
                                          : const Color(0xff22263D)),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Text(
                                      "Low Investment",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: TextStyle(
                                            color: index == 2
                                                ? const Color(0xff22263D)
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
                            ],
                          ),
                          const SizedBox(
                            height: 26,
                          ),
                          Text(
                            "Safety (Credit Rating)",
                            style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Divider(
                            thickness: 1.5,
                            color: AppColors.greyColor,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  State(() {
                                    safetyIndex = 1;
                                  });
                                },
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0x29000000),
                                          blurRadius: 6.0,
                                        ),
                                      ],
                                      border: Border.all(
                                          width: 1, color: Colors.white),
                                      color: safetyIndex == 1
                                          ? Colors.white
                                          : const Color(0xff22263D)),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Text(
                                      "High Safety",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: TextStyle(
                                            color: safetyIndex == 1
                                                ? const Color(0xff22263D)
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
                                  State(() {
                                    safetyIndex = 2;
                                  });
                                },
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0x29000000),
                                          blurRadius: 6.0,
                                        ),
                                      ],
                                      border: Border.all(
                                          width: 1, color: Colors.white),
                                      color: safetyIndex == 2
                                          ? Colors.white
                                          : const Color(0xff22263D)),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Text(
                                      "Low Safety",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: TextStyle(
                                            color: safetyIndex == 2
                                                ? const Color(0xff22263D)
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
                            ],
                          ),
                          const SizedBox(
                            height: 26,
                          ),
                          Text(
                            "Yield",
                            style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Divider(
                            thickness: 1.5,
                            color: AppColors.greyColor,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  State(() {
                                    yieldIndex = 1;
                                  });
                                },
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0x29000000),
                                          blurRadius: 6.0,
                                        ),
                                      ],
                                      border: Border.all(
                                          width: 1, color: Colors.white),
                                      color: yieldIndex == 1
                                          ? Colors.white
                                          : const Color(0xff22263D)),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Text(
                                      "High Yield",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: TextStyle(
                                            color: yieldIndex == 1
                                                ? const Color(0xff22263D)
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
                                  State(() {
                                    yieldIndex = 2;
                                  });
                                },
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0x29000000),
                                          blurRadius: 6.0,
                                        ),
                                      ],
                                      border: Border.all(
                                          width: 1, color: Colors.white),
                                      color: yieldIndex == 2
                                          ? Colors.white
                                          : const Color(0xff22263D)),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Text(
                                      "Low Yield",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: TextStyle(
                                            color: yieldIndex == 2
                                                ? const Color(0xff22263D)
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
                            ],
                          ),
                          const SizedBox(
                            height: 26,
                          ),
                          Text(
                            "Tenure",
                            style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Divider(
                            thickness: 1.5,
                            color: AppColors.greyColor,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  State(() {
                                    tenureIndex = 1;
                                  });
                                },
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0x29000000),
                                          blurRadius: 6.0,
                                        ),
                                      ],
                                      border: Border.all(
                                          width: 1, color: Colors.white),
                                      color: tenureIndex == 1
                                          ? Colors.white
                                          : const Color(0xff22263D)),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Text(
                                      "High Tenure",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: TextStyle(
                                            color: tenureIndex == 1
                                                ? const Color(0xff22263D)
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
                                  State(() {
                                    tenureIndex = 2;
                                  });
                                },
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0x29000000),
                                          blurRadius: 6.0,
                                        ),
                                      ],
                                      border: Border.all(
                                          width: 1, color: Colors.white),
                                      color: tenureIndex == 2
                                          ? Colors.white
                                          : const Color(0xff22263D)),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Text(
                                      "Low Tenure",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: TextStyle(
                                            color: tenureIndex == 2
                                                ? const Color(0xff22263D)
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
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  State(() {
                                    index = 0;
                                    safetyIndex = 0;
                                    yieldIndex = 0;
                                    tenureIndex = 0;
                                  });
                                },
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0x29000000),
                                          blurRadius: 6.0,
                                        ),
                                      ],
                                      color: const Color(0xffC8C7CE)),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Text(
                                      "Clear All",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: const TextStyle(
                                            color: Color(0xff22263D),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13),
                                      ),
                                    ),
                                  )),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0x29000000),
                                          blurRadius: 6.0,
                                        ),
                                      ],
                                      color: const Color(0xffFF405A)),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Text(
                                      "Apply Filters",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13),
                                      ),
                                    ),
                                  )),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          );
        });
      },
    );
  }

  static showFilterBottomSheet(BuildContext context, int index, int safetyIndex,
      int paymentIndex, int yieldIndex, int tenureIndex) async {
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
        List<String> _options1 = [
          '',
          'Earn higher fixed income than FDs',
          'Get tax free returns',
          'Invest for short term',
          'Invest in NRI eligible bonds',
          'Pledge for F&O',
          'Get tax exemption (HUF)',
          'Save capital gains tax'
        ];
        List<String> _options2 = [
          '',
          'AAA (High Safety)',
          'AA (Balanced)',
          'A & Below (High Yield)'
        ];
        List<String> _options3 = ['', 'Upto 8%', '8 - 11%', '11% +'];
        List<String> _options4 = [
          '',
          'Annual',
          'Monthly',
          'Quarterly',
          'Payment on Maturity'
        ];
        List<String> _options5 = [
          '',
          'Less than 1 year',
          '1 to 5 Years',
          '5 to 10 Years',
          'More than 10 years'
        ];
        return StatefulBuilder(builder: (BuildContext context, State) {
          return Padding(
            padding: EdgeInsets.only(
                top: 0,
                right: 0,
                left: 0,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.80,
              child: SingleChildScrollView(
                child: Wrap(
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        color: AppColors.primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "FILTER",
                                    style: GoogleFonts.quicksand(
                                        textStyle: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Icon(Icons.clear,
                                        color: Colors.white, size: 25),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Investment Purpose",
                                style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Divider(
                                thickness: 1.5,
                                color: AppColors.greyColor,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              DataWidget(
                                selectedIndex: index,
                                title: _options1,
                              ),
                              const SizedBox(
                                height: 26,
                              ),
                              Text(
                                "Safety (Credit Rating)",
                                style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Divider(
                                thickness: 1.5,
                                color: AppColors.greyColor,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              DataWidget(
                                selectedIndex: index,
                                title: _options2,
                              ),
                              const SizedBox(
                                height: 26,
                              ),
                              Text(
                                "Yield",
                                style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Divider(
                                thickness: 1.5,
                                color: AppColors.greyColor,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              DataWidget(
                                selectedIndex: index,
                                title: _options3,
                              ),
                              const SizedBox(
                                height: 26,
                              ),
                              Text(
                                "Payment Frequency",
                                style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Divider(
                                thickness: 1.5,
                                color: AppColors.greyColor,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              DataWidget(
                                selectedIndex: index,
                                title: _options4,
                              ),
                              const SizedBox(
                                height: 26,
                              ),
                              Text(
                                "Tenure Remaining",
                                style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Divider(
                                thickness: 1.5,
                                color: AppColors.greyColor,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              DataWidget(
                                selectedIndex: index,
                                title: _options5,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              InkWell(
                                onTap: () {
                                  State(() {
                                    tenureIndex = 4;
                                  });
                                },
                                child: Container(
                                  height: 30,
                                  width: 140,
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0x29000000),
                                          blurRadius: 6.0,
                                        ),
                                      ],
                                      border: Border.all(
                                          width: 1, color: Colors.white),
                                      color: tenureIndex == 4
                                          ? Colors.white
                                          : const Color(0xff22263D)),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Text(
                                      "More than 10 years",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: TextStyle(
                                            color: tenureIndex == 4
                                                ? const Color(0xff22263D)
                                                : Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                    ),
                                  )),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      State(() {
                                        index = 0;
                                        safetyIndex = 0;
                                        yieldIndex = 0;
                                        paymentIndex = 0;
                                        tenureIndex = 0;
                                      });
                                    },
                                    child: Container(
                                      height: 30,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0x29000000),
                                              blurRadius: 6.0,
                                            ),
                                          ],
                                          color: const Color(0xffC8C7CE)),
                                      child: Center(
                                          child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12.0),
                                        child: Text(
                                          "Clear All",
                                          style: GoogleFonts.sourceSansPro(
                                            textStyle: const TextStyle(
                                                color: Color(0xff22263D),
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13),
                                          ),
                                        ),
                                      )),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      height: 30,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0x29000000),
                                              blurRadius: 6.0,
                                            ),
                                          ],
                                          color: const Color(0xffFF405A)),
                                      child: Center(
                                          child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12.0),
                                        child: Text(
                                          "Apply Filters",
                                          style: GoogleFonts.sourceSansPro(
                                            textStyle: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13),
                                          ),
                                        ),
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }
}

class DataWidget extends StatefulWidget {
  DataWidget({Key? key, required this.selectedIndex, required this.title})
      : super(key: key);
  int selectedIndex = 0;
  List<String> title = [];

  @override
  State<DataWidget> createState() => _DataWidgetState();
}

class _DataWidgetState extends State<DataWidget> with TickerProviderStateMixin {
  Widget _buildChips() {
    List<Widget> chips = [];
    for (int i = 1; i < widget.title.length; i++) {
      InkWell chip = InkWell(
        onTap: () {
          setState(() {
            widget.selectedIndex = i;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Color(0x29000000),
                  blurRadius: 6.0,
                ),
              ],
              border: Border.all(width: 1, color: Colors.white),
              color: widget.selectedIndex == i
                  ? Colors.white
                  : const Color(0xff22263D)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16),
            child: Text(
              widget.title[i],
              style: GoogleFonts.sourceSansPro(
                textStyle: TextStyle(
                    color: widget.selectedIndex == i
                        ? const Color(0xff22263D)
                        : Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              ),
            ),
          ),
        ),
      );
      // ChoiceChip choiceChip = ChoiceChip(
      //   selected: widget.selectedIndex == i,
      //   label: Text(_options[i], style: GoogleFonts.sourceSansPro(
      //     textStyle: TextStyle(
      //         color: const Color(0xff22263D),
      //         fontWeight: FontWeight.w500,
      //         fontSize: 15),
      //   )),
      //
      //   disabledColor: Colors.transparent,
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      //   backgroundColor: AppColors.textColor,
      //   selectedColor: Colors.white,
      //   onSelected: (bool selected) {
      //     setState(() {
      //       if (selected) {
      //         widget.selectedIndex = i;
      //       }
      //     });
      //   },
      // );
      //
      chips.add(chip);
    }

    return Wrap(
      spacing: 18.0,
      runSpacing: 12.0,
      textDirection: TextDirection.ltr,
      direction: Axis.horizontal,
      children: chips,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildChips();
  }
}
