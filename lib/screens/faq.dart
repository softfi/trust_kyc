import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_bar.dart';
import '../utils/images.dart';

class FAQs extends StatelessWidget {
  FAQs({Key? key}) : super(key: key);

  List data = [
    "Why should one invest in fixed income securities?",
    "What is a bond?",
    "What is a maturity date?",
    "What is a coupon rate?",
    "What is the difference between yield to maturity (YTM) and current yield (CY)?",
    "What is the taxation aspect of bonds?",
    "What is the difference between coupon rate and yield?",
    "What is a call/put option?",
    "What do perpetual bonds mean?",
    "What type of fixed income instruments are available for investment?",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppToolbar.appBar(
          "FAQS",
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          IconButton(
            icon: Container(
                padding: const EdgeInsets.all(1),
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                child: const Icon(Icons.person,
                    size: 20, color: Color(0xff00C6D8))),
            onPressed: () {},
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: const Image(
                image: AssetImage(
                  ConstantImage.faq,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                "FAQs",
                style: GoogleFonts.quicksand(
                  textStyle: TextStyle(
                      color: Color(0xff22263D),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                style: GoogleFonts.sourceSansPro(
                  textStyle: TextStyle(
                      color: Color(0xff22263D),
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            list(),
            SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 170,
              color: Color(0xffFF0023),
              child: Text(
                  "*Get Full Content On Https://Trustsecurities.In/Faq.Php",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.quicksand(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  Widget list() {
    return ListView.builder(
        itemCount: data.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12),
            child: Container(
              padding: EdgeInsets.all(8),
              height: 70,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.25),
                  spreadRadius: 3,
                  blurRadius: 11,
                  offset: const Offset(0, 1),
                ),
              ], color: Colors.white),
              child: ListTile(
                minLeadingWidth: 30,
                contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                dense: true,
                visualDensity:
                    const VisualDensity(vertical: -2, horizontal: -4),
                leading: const Icon(
                  Icons.add,
                  size: 20,
                  color: Color(0xffFF405A),
                ),
                title: Text(
                  "${data[index]}",
                  style: GoogleFonts.sourceSansPro(
                    textStyle: const TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
