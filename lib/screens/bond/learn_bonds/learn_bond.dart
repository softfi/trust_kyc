import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/screens/bond/bond_advantages.dart';
import 'package:trust_money/screens/bond/learn_bonds/view_all_editor.dart';
import 'package:trust_money/screens/bond/view_all.dart';
import 'package:trust_money/screens/news_and_insights/newandinsights.dart';
import 'package:trust_money/utils/app_bar.dart';
import 'package:trust_money/utils/colorsConstant.dart';
import 'package:trust_money/utils/images.dart';
import '../../home/custom_listtile.dart';
import '../common_widget.dart';
import 'cutome_lists.dart';

class LearnBond extends StatefulWidget {
  const LearnBond({Key? key}) : super(key: key);

  @override
  State<LearnBond> createState() => _LearnBondState();
}

class _LearnBondState extends State<LearnBond> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppToolbar.appBar(
          "LEARN, FROM BOND...",
          const SizedBox(
            width: 40,
          ),
          IconButton(
            icon: Container(
                padding: const EdgeInsets.all(1),
                decoration: const BoxDecoration(
                    color: Colors.transparent, shape: BoxShape.circle),
                child: const Icon(Icons.person,
                    size: 20, color: Colors.transparent)),
            onPressed: () {},
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            seekhoWidget(),
            const SizedBox(
              height: 20,
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

  Widget seekhoWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 8,
          ),
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.35),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    color: Colors.white),
                child: Image.asset(
                  ConstantImage.learnBond,
                ),
              ),
              Positioned(
                top: 13,
                left: 10,
                child: Text(
                  "Seekho toh sirf",
                  style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          color: Color(0xff22263D),
                          fontSize: 20,
                          fontWeight: FontWeight.w500)),
                ),
              ),
              Positioned(
                top: 39,
                left: 10,
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Bond, Trust Bond ",
                        style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: AppColors.btnColor,
                                fontSize: 25,
                                fontWeight: FontWeight.w600))),
                    TextSpan(
                        text: "se",
                        style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: Color(0xff22263D),
                                fontSize: 25,
                                fontWeight: FontWeight.w600))),
                  ]),
                ),
              ),
              Positioned(
                top: 72,
                left: 10,
                child: SizedBox(
                  width: 250,
                  child: Text(
                    "Come learn from the best in the business on the benefits and associated risks of investing in the fixed income market, investment options and a lot more.",
                    softWrap: true,
                    style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: Color(0xff22263D),
                            fontSize: 11,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
              Positioned(
                bottom: 15,
                left: 10,
                child: Container(
                  height: 35,
                  width: 140,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xffEC515F),
                        Color(0xffC4414D),
                      ],
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Read More",
                      style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            "Editors Top Picks",
            style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                    color: Color(0xff22263D),
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),
          ),
          const SizedBox(
            height: 20,
          ),
          seekhoList(),
          const SizedBox(
            height: 20,
          ),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ViewAllEditors(
                              title: 'Editors Top Picks',
                            )));
              },
              child: ViewAllWidget(title: 'View All', width: 150)),
          const SizedBox(
            height: 23,
          ),
          Text(
            "Invest In India",
            style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                    color: Color(0xff22263D),
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          investIndiaList(),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NewsAndInsights()));
            },
            child: ViewAllWidget(title: 'View All', width: 150),
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Bonds And Debt",
            style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                    color: Color(0xff22263D),
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),
          ),
          const SizedBox(
            height: 10,
          ),
          debtBondList(),
          const SizedBox(
            height: 20,
          ),
          ViewAllWidget(title: 'View All', width: 150),
          const SizedBox(
            height: 20,
          ),
          Text(
            "TAX Savings",
            style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                    color: Color(0xff22263D),
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),
          ),
          const SizedBox(
            height: 10,
          ),
          taxBondList(),
          const SizedBox(
            height: 20,
          ),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ViewAllEditors(
                              title: 'TAX Savings',
                            )));
              },
              child: ViewAllWidget(title: 'View All', width: 150)),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Personal Finance",
            style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                    color: Color(0xff22263D),
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),
          ),
          const SizedBox(
            height: 10,
          ),
          financeList(),
          const SizedBox(
            height: 20,
          ),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ViewAllEditors(
                              title: 'Personal Finance',
                            )));
              },
              child: ViewAllWidget(title: 'View All', width: 150)),
        ],
      ),
    );
  }

  Widget seekhoList() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.35),
                spreadRadius: 2,
                blurRadius: 11,
                offset: Offset(0, 3),
              ),
            ], color: Colors.white, borderRadius: BorderRadius.circular(6)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ListTile(
                leading: Image.asset(
                  ConstantImage.dummy_pic,
                ),
                title: Text(
                  "What are 54EC Bonds or Capital Gain Bonds",
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
                    ClipPath(
                      clipper: Triangle(),
                      child: Container(
                        color: Color(0xffE1E0E7),
                        height: 16,
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
              ),
            ),
          ),
        );
      },
    );
  }

  Widget investIndiaList() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NewsAndInsights()));
              },
              child: CustomTile(
                date: 'Jan 24, 2022',
                title: 'What are Advantages of Investing in Bond IPO',
                image: Image.asset(
                  ConstantImage.dummy_bond,
                ),
                readText: 'Trading',
              )),
        );
      },
    );
  }

  Widget debtBondList() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: CustomTile(
              date: 'Jan 24, 2022',
              title: 'Is Bonds Good Investment Compared With Mutual..',
              image: Image.asset(
                ConstantImage.dummy_bond,
              ),
              readText: 'Trading',
            ));
      },
    );
  }

  Widget taxBondList() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.35),
                spreadRadius: 2,
                blurRadius: 11,
                offset: Offset(0, 3),
              ),
            ], color: Colors.white, borderRadius: BorderRadius.circular(6)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ListTile(
                leading: Image.asset(
                  ConstantImage.dummy_pic,
                ),
                title: Text(
                  "Bank FD’s vs Nothing Safer",
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
                    ClipPath(
                      clipper: Triangle(),
                      child: Container(
                        color: Color(0xffE1E0E7),
                        height: 16,
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
              ),
            ),
          ),
        );
      },
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
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.35),
                spreadRadius: 2,
                blurRadius: 11,
                offset: Offset(0, 3),
              ),
            ], color: Colors.white, borderRadius: BorderRadius.circular(6)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ListTile(
                leading: Image.asset(
                  ConstantImage.dummy_pic,
                ),
                title: Text(
                  "DEBT OR EQUITY? OR A COMBINATION OF BOTH!",
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
                    ClipPath(
                      clipper: Triangle(),
                      child: Container(
                        color: Color(0xffE1E0E7),
                        height: 16,
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
              ),
            ),
          ),
        );
      },
    );
  }
}
