import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/utils/app_bar.dart';

import '../../../../utils/colorsConstant.dart';
import '../../../../utils/images.dart';
import '../../../../utils/styles.dart';
import '../../read_bonds.dart';

class MyBID extends StatelessWidget {
  MyBID({Key? key}) : super(key: key);

  List data = [
    "Your bid will be forwarded to the Stock Exchange. RBI and Stock Exchange shall approve your bid.",
    "On approval, the funds are transferred to Stock Exchange.",
    "Allotted Bonds shall be credited by RBI In your Demat account within 5 days from the Allotment Date.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppToolbar.appBar(
            "ORDER CONFIRMATION",
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
            children: [
              bidWidget(),
              const SizedBox(
                height: 15,
              ),
              bidNoteWidget(),
              const SizedBox(
                height: 35,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ReadBonds()));
                },
                child: Center(
                  child: Container(
                    width: 210,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.btnColor,
                    ),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Text("Explore other bonds",
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
                height: 20,
              ),
            ],
          ),
        ));
  }

  bidWidget() {
    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        Center(
          child: SvgPicture.asset(
            ConstantImage.bid,
            height: 80,
            width: 81,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          "BID RECEIVED SUCCESSFULLY!",
          style: GoogleFonts.quicksand(
            textStyle: const TextStyle(
              color: AppColors.btnColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                ConstantImage.bid,
                height: 60,
                width: 60,
              ),
              const SizedBox(
                width: 15,
              ),
              Text("CREDITACCESS GRAMEEN \nLIMITED",
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                        fontSize: 15),
                  )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(width: 35),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Order no.",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                          color: Color(0xffB0B1B9),
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                        ),
                      )),
                  const SizedBox(
                    height: 1,
                  ),
                  Text(
                    "000834287",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Order Date",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                          color: Color(0xffB0B1B9),
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                        ),
                      )),
                  const SizedBox(
                    height: 1,
                  ),
                  Text(
                    "March 6, 2022",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 22,
                width: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    border:
                        Border.all(width: 1, color: const Color(0xffFBC22C))),
                child: Center(
                  child: Text(
                    "Processed",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                        color: Color(0xffFBC22C),
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        ListTile(
          title: Column(
            children: [
              Container(
                  color:Color(0xffF7F7FA),
                  child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Amount Invested",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                color: Color(0xffB0B1B9),
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                              ),
                            )),
                        const SizedBox(
                          height: 1,
                        ),
                        Text(
                          "₹ 6,26,201",
                          style: ConstStyle.quickStandBtn,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Gold Quantity",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                color: Color(0xffB0B1B9),
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                              ),
                            )),
                        const SizedBox(
                          height: 1,
                        ),
                        Text(
                          "20 Grams",
                          style: ConstStyle.quickStandBtn,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Payment Status",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                color: Color(0xffB0B1B9),
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                              ),
                            )),
                        const SizedBox(
                          height: 1,
                        ),
                        Text(
                          "Successful",
                          style: ConstStyle.quickStandBtn,
                        ),
                      ],
                    ),

                ],
              ),
                  )),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 5,right: 5),
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0xffFCEDEE)
                      ),
                      child: Row(
                        children: [
                          Text("Download Invoice"),
                          SizedBox(width: 5,),
                          Icon(Icons.download),
                        ],
                      )),
                  Container(
                    padding: EdgeInsets.only(left: 5,right: 5),
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0xffE7F8FA)
                      ),
                      child: Row(
                        children: [
                          Text("Download Form"),
                          SizedBox(width: 5,),
                          Icon(Icons.download),
                        ],
                      )),

                ],
              )
            ],
          ),
          subtitle: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 7,
                  ),
                  Container(
                    width: 5,
                    height: 130,
                    color: AppColors.greenColor,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Text("Money Receive Bid Requested Placed",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                              color: Color(0xff22263D),
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          )),
                      const SizedBox(
                        height: 50,
                      ),
                      Text("Bid Processing",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                              color: Color(0xff02AD41),
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          )),
                      Text("Bid forwarded to RBI and Stock Exchange approval.",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                              color: Color(0xff22263D),
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          )),
                      const SizedBox(
                        height: 50,
                      ),
                      Text("Bonds Credited to your Account",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                              color: Color(0xff8E909C),
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          )),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                top: 30,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.greenColor,
                  ),
                  width: 20,
                  height: 20,
                  child: const Center(
                      child: Icon(
                    Icons.done,
                    color: Colors.white,
                    size: 15,
                  )),
                ),
              ),
              Positioned(
                top: 100,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.greenColor,
                  ),
                  width: 20,
                  height: 20,
                  child: Center(
                      child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    height: 12,
                    width: 12,
                  )
                      //Icon(Icons.done,color: Colors.white,size: 15,)
                      ),
                ),
              ),
              Positioned(
                bottom: 30,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.greyColor,
                  ),
                  width: 20,
                  height: 20,
                  //child: Center(child: Icon(Icons.done,color: Colors.white,size: 15,)),
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }

  bidNoteWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Please note",
            style: GoogleFonts.quicksand(
              textStyle: const TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListView.builder(
              itemCount: data.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  minLeadingWidth: 10,
                  contentPadding: const EdgeInsets.only(left: 0.0, right: 0.0),
                  dense: true,
                  visualDensity:
                      const VisualDensity(vertical: -2, horizontal: -4),
                  leading: const Icon(
                    Icons.circle,
                    size: 8,
                    color: AppColors.textColor,
                  ),
                  title: Text(
                    "${data[index]}",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: TextStyle(
                        color: AppColors.textColor.withOpacity(0.60),
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
