

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';
import 'package:trust_money/utils/styles.dart';

import '../../utils/colorsConstant.dart';
import '../../utils/images.dart';
import '../../utils/strings.dart';

class NewsAndInsightExplore extends StatefulWidget {
  const NewsAndInsightExplore({Key? key}) : super(key: key);

  @override
  State<NewsAndInsightExplore> createState() => _NewsAndInsightExploreState();
}
int articleIndex=1;
class _NewsAndInsightExploreState extends State<NewsAndInsightExplore> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Column(
          children: [
            Container(
              height: 80,
              color: Color(0xff00C6D8),
              child: Padding(
                padding: const EdgeInsets.only(top: 25.0),
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
                          "EXPLORE",
                          style: ConstStyle.quickStandSmall11,
                        ),

                        IconButton(
                          icon:
                          const Icon(Icons.person_pin, color: Colors.white),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        // Container(
                        //   width: 50,
                        // )
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
          Padding(
            padding: const EdgeInsets.only(bottom: 35.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  advantageWidget(),
                  const SizedBox(
                    height: 30,
                  ),
                  subscribe(),
                  const SizedBox(
                    height: 30,
                  ),
                  needHelp()
                ],
              ),
            ),
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
                    color: Colors.white,
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
                    color: Colors.white,
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
                  width: 130,
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
          Text("What are Advantages of Investing in Bond IPO",style: GoogleFonts.quicksand(
            textStyle: const TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.w600,
                fontSize: 20),
          ),),
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
                    fontSize: 14),
              )),
          const SizedBox(
            height: 10,
          ),
          Text("Benefits Of Ipo Investing",
              style: GoogleFonts.sourceSansPro(
                textStyle: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 17),
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
                    fontSize: 14),
              )),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width * 0.43,
                color: Color(0xffC8C7CE),
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
                          Icon(
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
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("How Ncd Ipo Is",
                              style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                      color: Color(0xff22263D),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600))),
                          Text("Better Than Stock IPO",
                              style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                      color: Color(0xff22263D),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600))),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width * 0.43,
                color: Color(0xffC8C7CE),
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
                          Icon(
                            Icons.arrow_forward_rounded,
                            size: 20,
                            color: AppColors.primaryColor,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("Which Is Better: Bond \nOr Loan",
                          style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  color: Color(0xff22263D),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600))),
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
                  height: 45,
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
                  height: 45,
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
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 55,
              width: 150,
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
                    "View All",
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
              decoration:  BoxDecoration(
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
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ListTile(
                  leading: Container(
                    height: 65,
                    width: 110,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xff58C3D5).withOpacity(0.10),
                          const Color(0xffEC515F).withOpacity(0.10),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        "DEBIT / \nEQUITY",
                        style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                      ),
                    ),
                  ),
                  title: Text(
                    "Debt Or Equity? Or A Combination Of Both!",
                    style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                  ),
                  subtitle: Row(
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
                      Container(
                        height: 16,
                        width: 65,
                        decoration: const BoxDecoration(
                          color: Color(0xffE1E0E7),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15)),
                        ),
                        child: Center(
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
                    ],
                  ),
                ),
              )),
        );
      },
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
          const SizedBox(
            height: 8,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class Triangle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final x = size.width;
    final y = size.height;

    path.moveTo(0, y / 2);
    path.lineTo(20, y);
    path.lineTo(x, y);
    path.lineTo(x, 0);
    path.lineTo(20, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}