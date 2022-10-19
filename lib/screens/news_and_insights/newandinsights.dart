import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';
import 'package:trust_money/screens/bond/bond_advantages.dart';
import 'package:trust_money/screens/news_and_insights/explore.dart';
import 'package:trust_money/utils/images.dart';

import '../../utils/colorsConstant.dart';
import '../../utils/styles.dart';

class NewsAndInsights extends StatefulWidget {
  const NewsAndInsights({Key? key}) : super(key: key);

  @override
  State<NewsAndInsights> createState() => _NewsAndInsightsState();
}

class _NewsAndInsightsState extends State<NewsAndInsights> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE8E8E8),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Column(
          children: [
            Container(
              height: 80,
              color: Color(0xff00C6D8),
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
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
                          "NEWS AND INSIGHTS",
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
              color: Color(0xffE8E8E8),
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
                          color: Color(0xffE8E8E8),
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
                          color: Color(0xffE8E8E8),
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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  children: [
                    viewAllWidget(),
                    const SizedBox(height: 20,),
                    Container(
                      height: 35,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.btnColor
                      ),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Load More",style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                              color: Color(0xffFfffff),
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          )),
                          const Icon(Icons.refresh,size: 25,color: Colors.white,)
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    subscribe(),
                    const SizedBox(height: 20,),
                    needHelp(),
                  ],
                ),
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
                    color: Color(0xffE8E8E8),
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
                    color: Color(0xffE8E8E8),
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

  Widget viewAllWidget(){
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 15,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: InkWell(onTap:(){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                    const NewsAndInsightExplore()));
          },
            child: ListTile(
              tileColor: Colors.white.withOpacity(0.35),
              visualDensity: const VisualDensity(vertical: 4),
              trailing: Image.asset(
                ConstantImage.dummy_bond,
                fit: BoxFit.fill,
                height: 200,
                width: 100,
              ),
              dense: true,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "New ideas for a Equity Trading",
                    style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Icon(
                    Icons.arrow_forward_rounded,
                    color: AppColors.textColor,
                    size: 30,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget subscribe() {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xffB2EEF8).withOpacity(0.10),
                const Color(0xffFFFFFF),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
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
                        fontSize: 25),
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
                      color: AppColors.btnColor,
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
        ),
        Positioned(
          top: 8,
          right: 8,
          child: Image.asset(
            ConstantImage.leaf,
            color: Colors.black26,
            height: 300,
          ),
        )
      ],
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
        ],
      ),
    );
  }
}
