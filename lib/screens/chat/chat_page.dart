import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';
import 'package:trust_money/utils/colorsConstant.dart';

import '../../bottom_navigation/bottom_navigation.dart';
import '../../utils/images.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';

class Help {
  String label;
  Color color;
  bool isSelected;

  Help(this.label, this.color, this.isSelected);
}

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  bool selected = false;
  final List<Help> _chipsList = [
    Help("Open an Account", AppColors.primaryColor, false),
    Help("KYC Verification", AppColors.primaryColor, false),
    Help("Register", AppColors.primaryColor, false),
    Help("Buy Bonds", AppColors.primaryColor, false),
    Help("Transactions", AppColors.primaryColor, false),
    Help("IPO and Public Offerings", AppColors.primaryColor, false),
    Help("Login Support", AppColors.primaryColor, false),
    Help("Bank", AppColors.primaryColor, false),
    Help("Investment", AppColors.primaryColor, false),
    Help("Selling", AppColors.primaryColor, false),
    Help("IPO Applications", AppColors.primaryColor, false),
    Help("IPV", AppColors.primaryColor, false),
    Help("Others", AppColors.primaryColor, false)
  ];

  final searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>CustomBottomNavigation(currentIndex: 0,)));
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80.0),
            child: Column(
              children: [
                Container(
                  height: 70,
                  color: const Color(0xff00C6D8),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: IconButton(
                                  icon: Image.asset(
                                    ConstantImage.home,
                                    color: Colors.white,
                                    height: 25,
                                    width: 25,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CustomBottomNavigation(
                                                  currentIndex: 0,
                                                )));
                                  }),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 40.0),
                              child: Text(
                                "Chat",
                                style: ConstStyle.quickStandSmall11,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 25.0),
                              child: Container(
                                width: 70,
                                height: 30,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.1, color: Colors.white),
                                    borderRadius: BorderRadius.circular(4)),
                                child: Center(
                                  child: Text(
                                    "End Chat",
                                    style: GoogleFonts.quicksand(
                                      textStyle: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
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
                                foregroundDecoration:
                                const RotatedCornerDecoration(
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
                                foregroundDecoration:
                                const RotatedCornerDecoration(
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
            children: [
              SingleChildScrollView(child: chatWidget()),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 60,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.11),
                        spreadRadius: 5,
                        blurRadius: 3,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: TextFormField(
                        controller: searchText,
                        decoration: InputDecoration(
                            fillColor: Colors.white54,
                            filled: true,
                            border: InputBorder.none,
                            contentPadding:
                            const EdgeInsets.symmetric(vertical: 20),
                            hintText: "Write your message…",
                            hintStyle: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  color: Color(0xff8E909C),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                            suffixIcon: InkWell(
                                onTap: () {
                                  searchText.clear();
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: AppColors.btnColor),
                                  child: const Center(
                                    child: Icon(
                                      Icons.arrow_forward_rounded,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ))),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }

  Widget chatWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Text("Hi, I'm your virtual assistant.",
              style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor),
              )),
          const SizedBox(
            height: 40,
          ),
          Text("Alright! here's how I can help you",
              style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor),
              )),
          const SizedBox(
            height: 5,
          ),
          Wrap(
            spacing: 10,
            runSpacing: -6,
            direction: Axis.horizontal,
            children: helpChips(),
          ),
          const SizedBox(
            height: 40,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Text("Open an Account",
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor),
                )),
          ),
          const SizedBox(
            height: 35,
          ),
          Text(Strings.assistant,
              style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor),
              )),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 40,
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: AppColors.primaryColor),
            child: Center(
              child: Text("Click here to Open an account",
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Text("Thanks",
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor),
                )),
          ),
          const SizedBox(
            height: 140,
          ),
        ],
      ),
    );
  }

  List<Widget> helpChips() {
    List<Widget> chips = [];
    for (int i = 0; i < _chipsList.length; i++) {
      Widget item = FilterChip(
        label: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3.0),
          child: Text(_chipsList[i].label),
        ),
        labelStyle: GoogleFonts.quicksand(
          textStyle: const TextStyle(
              fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        backgroundColor: _chipsList[i].color,
        selected: _chipsList[i].isSelected,
        onSelected: (bool value) {
          // setState(() {
          //   _chipsList[i].isSelected = value;
          // });
        },
        showCheckmark: false,
      );
      chips.add(item);
    }
    return chips;
  }
}
