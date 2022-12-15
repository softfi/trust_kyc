import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/utils/colorsConstant.dart';
import 'package:trust_money/utils/images.dart';

import '../../utils/app_bar.dart';

class AboutUs extends StatelessWidget {
  final pageviewController = PageController(initialPage: 0);
 List dotIndicatorList=List.empty(growable: true);
 RxInt isActive=0.obs;
  @override
  Widget build(BuildContext context) {
    dotIndicatorList=[1,2,3];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppToolbar.appBar(
          "ABOUT US",
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
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                  "Trust Securities Services is the Non-Institutional Clientele vertical of one of India's leading full-service financial houses, TRUST Group.",
                  style: GoogleFonts.sourceSansPro(
                      textStyle: TextStyle(
                          height: 1.5,
                          color: Color(0xff22263D),
                          fontSize: 16))),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                  "Under the parentage and market leadership of TRUST Group, Trust Securities services was incorporated in 2015 to serve as a 'one stop shop for financial products' across ticket sizes and client genre.\n\nWe wear the genesis of Trust Group as our emblem of pride, translating over 15 years of experience and a multitude of accolades to our name; we assure perennial partnerships and high value addition, with you, for you.\n\nAs a proactive debt specialist pioneering the Indian DCM market, Trust Securities services is present across the value chain with direct access to a plethora of debt, quasi-debt and quasi-equity products.",
                  style: GoogleFonts.sourceSansPro(
                      textStyle:
                          TextStyle(color: Color(0xff9199A1), fontSize: 16))),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Image(
                  image: AssetImage(
                    ConstantImage.aboutUs1,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                "Our Company",
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                      color: Color(0xff22263D),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                "We are a TRUSTed partner and innovator having proficiency across a repertoire of Fixed Income services encapsulating debt fund raising needs. From arranging to end execution of primary issuances to facilitation and through secondary market deliveries, we service all denominations suited to whole investment quantum - from retail to corporate.",
                style: GoogleFonts.sourceSansPro(
                  textStyle: const TextStyle(
                    color: Color(0xff22263D),
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Image(
                  image: AssetImage(ConstantImage.aboutUs2),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "We Are Trust",
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: Color(0xff22263D),
                            fontWeight: FontWeight.bold,
                            fontSize: 19),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Text(
                      "Comprehensively equipped with rich experience, a seasoned managerial team, insightful investment advisory and holistic pan India reach, Trust Securities services aims to be your go-to investment house for all your fixed income needs.",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                          color: Color(0xff22263D),
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Text("WHAT WE OFFER",
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  )),
            ),
            const SizedBox(
              height: 7,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Container(
                child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipisicing elit,",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          color: Color(0xffB0B1B9),
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    )),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 12.0, top: 15, bottom: 12),
                    child: Container(
                      width: 180,
                      height: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.11),
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Image(
                                image: AssetImage(ConstantImage.aboutUs3)),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Curated Bonds",
                              style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    color: Color(0xff22263D),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                                "Our Team of Financial experts brings you a whole host of different categories of Bonds under a single roof.",
                                style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                      color: Color(0xff8F919D),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, top: 15),
                    child: Container(
                      width: 180,
                      height: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.11),
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Image(
                                image: AssetImage(ConstantImage.aboutUs4)),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Bond Transaction",
                              style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    color: Color(0xff22263D),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                                "For hassle-free experience we facilitate our clients to buy or sell bonds in primary & Secondary market.",
                                style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                      color: Color(0xff8F919D),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, top: 15),
                    child: Container(
                      width: 180,
                      height: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.11),
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Image(
                              image: AssetImage(ConstantImage.aboutUs5),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Detailed Information",
                              style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    color: Color(0xff22263D),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                                "Smart investment is about Knowledge and well informed decisions, we provide all the bond related info including Information Memorandum, Cash flows, Rating Rationales etc.",
                                style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                      color: Color(0xff8F919D),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(child: Image.asset(ConstantImage.aboutUs6)),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Our Vision",
                        style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              color: Color(0xff22263D),
                              fontWeight: FontWeight.w600,
                              fontSize: 22),
                        ),
                      )),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.\n\nLorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Text("OUR Team",
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.w600,
                        fontSize: 22),
                  )),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Center(
                child: Text(
                  "We're a talented professional expert team ready to help you.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        color: Color(0xffB0B1B9),
                        fontWeight: FontWeight.normal,
                        fontSize: 15),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: SizedBox(
                height: 600,
                child: PageView(
                  onPageChanged: (a){
                    isActive.value=a;
                  },
                  controller: pageviewController,
                  reverse: true,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 450,
                          child: Image.asset(ConstantImage.aboutUs_pageView1),
                        ),

                        Text(
                          "PRANAV INAMDAR",
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: Color(0xff000000),
                                fontWeight: FontWeight.w600,
                                fontSize: 22),
                          ),
                        ),
                        Text(
                          "Pranav Inamdar, Director of Trust Group & Trust Securities services, is one of the founder member of Trust Securities services and drives a national network of niche relationships at Trust Group. An MBA from the University of Mumbai, he brings with him 17 years of rich experience in Capital Markets working across client profiles, nationally. With laurels of path breaking deals to his name, Mr. Inamdar's determination and dynamics resonates with ours.",
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: Color(0xff22263D),
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 450,
                          child: Image.asset(ConstantImage.aboutUs_pageView2),
                        ),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        Text(
                          "Hunter Kilos",
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: Color(0xff000000),
                                fontWeight: FontWeight.w600,
                                fontSize: 22),
                          ),
                        ),
                        Text(
                          "Pranav Inamdar, Director of Trust Group & Trust Securities services, is one of the founder member of Trust Securities services and drives a national network of niche relationships at Trust Group. An MBA from the University of Mumbai, he brings with him 17 years of rich experience in Capital Markets working across client profiles, nationally. With laurels of path breaking deals to his name, Mr. Inamdar's determination and dynamics resonates with ours.",
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: Color(0xff22263D),
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 450,
                          child: Image.asset(ConstantImage.aboutUs_pageView3),
                        ),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        Text(
                          "Hunter Kilos",
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: Color(0xff000000),
                                fontWeight: FontWeight.w600,
                                fontSize: 22),
                          ),
                        ),
                        Text(
                          "Pranav Inamdar, Director of Trust Group & Trust Securities services, is one of the founder member of Trust Securities services and drives a national network of niche relationships at Trust Group. An MBA from the University of Mumbai, he brings with him 17 years of rich experience in Capital Markets working across client profiles, nationally. With laurels of path breaking deals to his name, Mr. Inamdar's determination and dynamics resonates with ours.",
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: Color(0xff22263D),
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Container(
              alignment: Alignment.center,
              height: 40,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount:dotIndicatorList.length,itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(()=>Container(
                    height: 15,width: 15,
                    decoration:  BoxDecoration(
                      shape: BoxShape.circle,
                      color: isActive.value==index?Colors.red:Colors.red.shade200
                    )),
                  ),
                );
              },),
            ),
SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  Text("We Have 7 Years Experienced See Our Company History",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: Color(0xff22263D),
                            fontWeight: FontWeight.w600,
                            fontSize: 22),
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                      "Lorem ipsum dolor sit amet, consectetur adipisicing elit,",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: Color(0xffB0B1B9),
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              child: Container(
                child: ListFunction(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            subscribe(),
            const SizedBox(
              height: 35,
            ),
            needHelp(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  var headingList = ["2016 TO 2018", "2018 TO 2020", "2020 TO 2022"];
  var dataList = [
    "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incidid labore dolore magna aliqua. enim ad minim veniam quis nostrud exercitation ullamco laboris nisi aliquip commodo consequat fugiat nulla.",
    "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incidid labore dolore magna aliqua. enim ad minim veniam quis nostrud exercitation ullamco laboris nisi aliquip commodo consequat fugiat nulla.",
    "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incidid labore dolore magna aliqua. enim ad minim veniam quis nostrud exercitation ullamco laboris nisi aliquip commodo consequat fugiat nulla."
  ];

  ListFunction() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: dataList.length,
      shrinkWrap: true,
      itemBuilder: (context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(colors: [
                    Color(0xff58C3D5).withOpacity(0.02),
                    Color(0xffEC515F).withOpacity(0.25)
                  ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12),
                child: ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        headingList[index],
                        style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              color: Color(0xff22263D),
                              fontWeight: FontWeight.w600,
                              fontSize: 22),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      )
                    ],
                  ),
                  subtitle: Text(
                    dataList[index],
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          height: 1.4,
                          color: Color(0xff22263D),
                          fontWeight: FontWeight.w500,
                          fontSize: 13),
                    ),
                  ),
                  dense: true,
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
