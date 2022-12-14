import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';
import 'package:trust_money/screens/bond/tringle.dart';
import 'package:trust_money/utils/styles.dart';
import 'package:dotted_line/dotted_line.dart';

import '../../utils/app_bar.dart';
import '../../utils/colorsConstant.dart';
import '../../utils/images.dart';
import '../../utils/strings.dart';
import '../bond/common_widget.dart';
import '../home/custom_listtile.dart';

class NewsAndInsightExplore extends StatefulWidget {
  const NewsAndInsightExplore({Key? key}) : super(key: key);

  @override
  State<NewsAndInsightExplore> createState() => _NewsAndInsightExploreState();
}

int articleIndex = 1;

class _NewsAndInsightExploreState extends State<NewsAndInsightExplore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppToolbar.appBar(
          "EXPLORE",
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          IconButton(
            icon: Container(
                padding: const EdgeInsets.all(1),
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                child: const Icon(
                  Icons.person,
                  size: 20,
                  color: Color(0xff00C6D8),
                )),
            onPressed: () {},
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            advantageWidget(),
            const SizedBox(
              height: 35,
            ),
            CommonWidget.subscribe(),
            const SizedBox(
              height: 20,
            ),
            CommonWidget.needHelp(),
          ],
        ),
      ),
    );
  }

  Widget advantageWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Tags: ",
                style: GoogleFonts.sourceSansPro(
                  textStyle: const TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 12),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              ClipPath(
                clipper: Triangle(),
                child: Container(
                  color: AppColors.btnColor,
                  height: 25,
                  width: 130,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Bonds and Deb",
                        style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 13)),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              ClipPath(
                clipper: Triangle(),
                child: Container(
                  color: AppColors.btnColor,
                  height: 25,
                  width: 140,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Investing In India",
                        style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 13)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.45),
                  spreadRadius: 5,
                  blurRadius: 11,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Image.asset(ConstantImage.explore_insight),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Container(
                height: 23,
                width: 80,
                color: AppColors.btnColor,
                child: Center(
                  child: Text("Trading",
                      style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 12))),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                "Jan 24, 2022",
                style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 12)),
              ),
              const SizedBox(
                width: 10,
              ),
              ClipPath(
                clipper: Triangle(),
                child: Container(
                  color: Color(0xffE1E0E7),
                  height: 23,
                  width: 75,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "5 min read",
                        style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 9)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "What are Advantages of Investing in Bond IPO",
            style: GoogleFonts.quicksand(
              textStyle: const TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(Strings.advantage,
              style: GoogleFonts.sourceSansPro(
                textStyle: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 17),
              )),
          const SizedBox(
            height: 10,
          ),
          Text(Strings.advantage1,
              style: GoogleFonts.sourceSansPro(
                textStyle: const TextStyle(
                    color: AppColors.textColor,
                    height: 1.4,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              )),
          const SizedBox(
            height: 10,
          ),
          Text(Strings.advantage2,
              style: GoogleFonts.sourceSansPro(
                textStyle: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                    fontSize: 14),
              )),
          const SizedBox(
            height: 10,
          ),
          Text(Strings.advantage3,
              style: GoogleFonts.sourceSansPro(
                textStyle: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                    fontSize: 14),
              )),
          const SizedBox(
            height: 10,
          ),
          Text(Strings.advantage4,
              style: GoogleFonts.sourceSansPro(
                textStyle: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                    fontSize: 14),
              )),
          const SizedBox(
            height: 10,
          ),
          Text(Strings.advantage5,
              style: GoogleFonts.sourceSansPro(
                textStyle: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                    fontSize: 14),
              )),
          const SizedBox(
            height: 10,
          ),
          Text("Benefits Of Ipo Investing",
              style: GoogleFonts.sourceSansPro(
                textStyle: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              )),
          const SizedBox(
            height: 13,
          ),
          Text("1) Get A Head Start On The Competition.",
              style: GoogleFonts.sourceSansPro(
                textStyle: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              )),
          const SizedBox(
            height: 10,
          ),
          Text(Strings.benifit11,
              style: GoogleFonts.sourceSansPro(
                textStyle: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                    fontSize: 14),
              )),
          const SizedBox(
            height: 15,
          ),
          Text(Strings.benifit12,
              style: GoogleFonts.sourceSansPro(
                textStyle: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                    fontSize: 14),
              )),
          const SizedBox(
            height: 13,
          ),
          Text("2) Meet Long-Term Goals",
              style: GoogleFonts.sourceSansPro(
                textStyle: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              )),
          const SizedBox(
            height: 10,
          ),
          Text(Strings.benifit21,
              style: GoogleFonts.sourceSansPro(
                textStyle: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                    fontSize: 14),
              )),
          const SizedBox(
            height: 15,
          ),
          Text(Strings.benifit22,
              style: GoogleFonts.sourceSansPro(
                textStyle: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                    fontSize: 14),
              )),
          const SizedBox(
            height: 13,
          ),
          Text("3) More Price Transparency",
              style: GoogleFonts.sourceSansPro(
                textStyle: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              )),
          const SizedBox(
            height: 10,
          ),
          Text(Strings.benifit31,
              style: GoogleFonts.sourceSansPro(
                textStyle: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                    fontSize: 14),
              )),
          const SizedBox(
            height: 15,
          ),
          Text(Strings.benifit32,
              style: GoogleFonts.sourceSansPro(
                textStyle: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                    fontSize: 14),
              )),
          const SizedBox(
            height: 13,
          ),
          Text("4) Buy Low And Make A Lot Of Money",
              style: GoogleFonts.sourceSansPro(
                textStyle: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              )),
          const SizedBox(
            height: 10,
          ),
          Text(Strings.benifit41,
              style: GoogleFonts.sourceSansPro(
                textStyle: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                    fontSize: 14),
              )),
          const SizedBox(
            height: 13,
          ),
          Text("To Summaries",
              style: GoogleFonts.sourceSansPro(
                textStyle: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              )),
          const SizedBox(
            height: 10,
          ),
          Text(Strings.summary1,
              style: GoogleFonts.sourceSansPro(
                textStyle: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                    fontSize: 14),
              )),
          const SizedBox(
            height: 10,
          ),
          Text(Strings.summary2,
              style: GoogleFonts.sourceSansPro(
                textStyle: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                    fontSize: 14),
              )),
          const SizedBox(
            height: 10,
          ),
          Text(Strings.summary3,
              style: GoogleFonts.sourceSansPro(
                textStyle: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                    fontSize: 14),
              )),
          const SizedBox(
            height: 10,
          ),
          Text(Strings.summary4,
              style: GoogleFonts.sourceSansPro(
                textStyle: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                    fontSize: 14),
              )),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.43,
                color: Color(0xffC8C7CE).withOpacity(0.80),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.arrow_back_outlined,
                            size: 20,
                            color: AppColors.primaryColor,
                          ),
                          Text(
                            "Previous",
                            style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    color: Color(0xff22263D),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500)),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      const DottedLine(
                        direction: Axis.horizontal,
                        lineLength: double.infinity,
                        lineThickness: 0.3,
                        dashLength: 3.0,
                        dashColor: Colors.black,
                        dashGapLength: 3.0,
                        dashGapColor: Colors.transparent,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("How Ncd Ipo Is",
                              style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                      color: Color(0xff22263D),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500))),
                          Text("Better Than Stock IPO",
                              style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                      color: Color(0xff22263D),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500))),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.43,
                color: Color(0xffC8C7CE).withOpacity(0.80),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "NEXT",
                            style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    color: Color(0xff22263D),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500)),
                          ),
                          const Icon(
                            Icons.arrow_forward_rounded,
                            size: 20,
                            color: AppColors.primaryColor,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      const DottedLine(
                        direction: Axis.horizontal,
                        lineLength: double.infinity,
                        lineThickness: 0.3,
                        dashLength: 3.0,
                        dashColor: Colors.black,
                        dashGapLength: 3.0,
                        dashGapColor: Colors.transparent,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text("Which Is Better: Bond \nOr Loan",
                          style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  color: Color(0xff22263D),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500))),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    articleIndex = 1;
                  });
                },
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 2.4,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x29000000),
                          blurRadius: 6.0,
                        ),
                      ],
                      color: articleIndex == 1
                          ? const Color(0xff22263D)
                          : Colors.white),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      "RELATED ARTICLES",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: TextStyle(
                            color: articleIndex == 1
                                ? Colors.white
                                : const Color(0xff22263D),
                            fontWeight: FontWeight.w500,
                            fontSize: 13),
                      ),
                    ),
                  )),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    articleIndex = 2;
                  });
                },
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 2.4,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x29000000),
                          blurRadius: 6.0,
                        ),
                      ],
                      color: articleIndex == 2
                          ? const Color(0xff22263D)
                          : Colors.white),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      "More from the Author",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: TextStyle(
                            color: articleIndex == 2
                                ? Colors.white
                                : const Color(0xff22263D),
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
            height: 20,
          ),
          financeList(),
          const SizedBox(
            height: 20,
          ),
          ViewAllWidget(title: 'View All', width: 150),
        ],
      ),
    );
  }

  Widget financeList() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.11),
                    spreadRadius: 5,
                    blurRadius: 11,
                    offset: const Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    ConstantImage.dummy_pic,
                    height: 75,
                    width: MediaQuery.of(context).size.width * 0.26,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.60,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Debt Or Equity? Or A Combination Of Both!",
                            style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                "Jan 24, 2022",
                                style: GoogleFonts.sourceSansPro(
                                    textStyle: const TextStyle(
                                        color: AppColors.btnColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12)),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              ClipPath(
                                clipper: Triangle(),
                                child: Container(
                                  color: Color(0xffE1E0E7),
                                  height: 17,
                                  width: 75,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        "5 min read",
                                        style: GoogleFonts.sourceSansPro(
                                            textStyle: const TextStyle(
                                                color: AppColors.primaryColor,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 9)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ]),
                  )
                ],
              )),
        );
      },
    );
  }
}
