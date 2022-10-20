import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/screens/about_us/about_us.dart';
import 'package:trust_money/screens/bond/bonds.dart';
import 'package:trust_money/screens/contactUs/contact_us.dart';
import 'package:trust_money/screens/disclimar/disclamer.dart';
import 'package:trust_money/screens/news_and_insights/newandinsights.dart';
import 'package:trust_money/screens/termsAndConditons/termsAndConditons.dart';
import 'package:trust_money/utils/colorsConstant.dart';

import '../screens/bond/buying_bonds.dart';
import '../screens/bond/collection_of_bonds.dart';
import '../screens/bond/learn_bond.dart';

var bg_color = Colors.white;
var divider_color = AppColors.textColor;
var text_style = GoogleFonts.quicksand(
<<<<<<< HEAD
  textStyle: const TextStyle(
      color: Color(0xff22263DD), fontWeight: FontWeight.w500, fontSize: 15),
);
var trailing_icon = Icon(
  Icons.keyboard_arrow_down_outlined,
  color: AppColors.primaryColor,
);
=======
    textStyle: const TextStyle(
        color: Color(0xff22263D), fontSize: 20, fontWeight: FontWeight.bold));

>>>>>>> master
var text_color = Colors.black;

class LeftDrawer extends StatefulWidget {
  const LeftDrawer({Key? key}) : super(key: key);

  @override
  State<LeftDrawer> createState() => _LeftDrawerState();
}

class _LeftDrawerState extends State<LeftDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width / 1.1,
      child: SafeArea(
        child: Container(
          color: bg_color,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.clear))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Theme(
<<<<<<< HEAD
                          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                          child: ExpansionTile(
                              iconColor: Colors.black,
                              collapsedIconColor: Colors.black,
                              textColor: text_color,
                              trailing: trailing_icon,
                              title: Text("BONDS",
                                  style: GoogleFonts.quicksand(
                                      textStyle: const TextStyle(
                                          color: Color(0xff22263D),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold))),
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top: 0,right:MediaQuery.of(context).size .width/12,left: 15),
                                  color: bg_color,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(

                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Explore Bonds"),
                                              Divider(
                                                color: divider_color,
                                              )
                                            ],
                                          )),
                                      Container(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Collection of Bonds"),
                                              Divider(
                                                color: divider_color,
                                              )
                                            ],
                                          )),
                                      Container(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("How it works"),
                                              Divider(
                                                color: divider_color,
                                              )
                                            ],
                                          )),
                                      Container(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Frequently Asked Questions"),
                                              Divider(
                                                color: divider_color,
                                              )
                                            ],
                                          )),
                                      Container(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  "Learn,from Bonds, Trust Bonds"),
                                              Divider(
                                                color: divider_color,
                                              )
                                            ],
                                          )),
                                      InkWell(onTap: (){
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) => const BuyingBonds()));
                                      },
                                        child: Container(
=======
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child: ListTileTheme(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                            dense: true,
                            horizontalTitleGap: .0,
                            minLeadingWidth: 0,
                            child: ExpansionTile(
                                iconColor: Colors.black,
                                collapsedIconColor: Colors.black,
                                textColor: text_color,
                                title: Text("BONDS",
                                    style: GoogleFonts.quicksand(
                                        textStyle: const TextStyle(
                                            color: Color(0xff22263D),
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold))),
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 0,
                                        right: MediaQuery.of(context).size.width /
                                            12,
                                        left: 15),
                                    color: bg_color,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Bonds()));
                                          },
                                          child: Container(
                                              padding: EdgeInsets.only(top: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("Explore Bonds"),
                                                  Divider(
                                                    color: divider_color,
                                                  )
                                                ],
                                              )),
                                        ),
                                        InkWell(  onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                  const CollectionOfBonds()));
                                        },
                                          child: Container(
                                              padding: EdgeInsets.only(top: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("Collection of Bonds"),
                                                  Divider(
                                                    color: divider_color,
                                                  )
                                                ],
                                              )),
                                        ),
                                        Container(
>>>>>>> master
                                            padding: EdgeInsets.only(top: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
<<<<<<< HEAD
                                                Text("Bond Ki Khaberin"),

                                              ],
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
=======
                                                Text("How it works"),
                                                Divider(
                                                  color: divider_color,
                                                )
                                              ],
                                            )),
                                        Container(
                                            padding: EdgeInsets.only(top: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    "Frequently Asked Questions"),
                                                Divider(
                                                  color: divider_color,
                                                )
                                              ],
                                            )),
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const LearnBond()));
                                          },
                                          child: Container(
                                              padding: EdgeInsets.only(top: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      "Learn,from Bonds, Trust Bonds"),
                                                  Divider(
                                                    color: divider_color,
                                                  )
                                                ],
                                              )),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const BuyingBonds()));
                                          },
                                          child: Container(
                                              padding: EdgeInsets.only(top: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("Bond Ki Khaberin"),
                                                ],
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                          ),
>>>>>>> master
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 19),
                          child: Divider(
                            color: divider_color,
                            thickness: 1.2,
<<<<<<< HEAD
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [

                       Container(
                         height: 58,

                         child: ExpansionTile(
                              iconColor: Colors.black,
                              collapsedIconColor: Colors.black,
                              textColor: text_color,

                              trailing: trailing_icon,
                              title: Text("Mutual Funds",
                                  style: GoogleFonts.quicksand(
                                      textStyle: const TextStyle(
                                          color: Color(0xff22263D),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold))),
                            ),
                       ),

                        Container(padding: const EdgeInsets.only(left: 15.0, right: 19),
=======
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child: ListTileTheme(
                            contentPadding: EdgeInsets.symmetric(horizontal: 15),
                            dense: true,
                            horizontalTitleGap: .0,
                            minLeadingWidth: 0,
                            child: ExpansionTile(
                              iconColor: Colors.black,
                              collapsedIconColor: Colors.black,
                              textColor: text_color,
                              title: Text("Mutual Funds",
                                  style: GoogleFonts.quicksand(
                                      textStyle: const TextStyle(
                                          color: Color(0xff22263D),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold))),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 19),
                          child: Divider(
                            color: divider_color,
                            thickness: 1.2,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child: ListTileTheme(
                            contentPadding: EdgeInsets.symmetric(horizontal: 15),
                            dense: true,
                            horizontalTitleGap: .0,
                            minLeadingWidth: 0,
                            child: ExpansionTile(
                              iconColor: Colors.black,
                              collapsedIconColor: Colors.black,
                              textColor: text_color,
                              title: Text("Equity Trading",
                                  style: GoogleFonts.quicksand(
                                      textStyle: const TextStyle(
                                          color: Color(0xff22263D),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold))),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 19),
                          child: Divider(
                            color: divider_color,
                            thickness: 1.2,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child:ListTileTheme(
                            contentPadding: EdgeInsets.symmetric(horizontal: 15),
                            dense: true,
                            horizontalTitleGap: .0,
                            minLeadingWidth: 0,
                            child: ExpansionTile(
                              iconColor: Colors.black,
                              collapsedIconColor: Colors.black,
                              textColor: text_color,
                              title: Text("F&Q Trading",
                                  style: GoogleFonts.quicksand(
                                      textStyle: const TextStyle(
                                          color: Color(0xff22263D),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold))),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 19),
                          child: Divider(
                            color: divider_color,
                            thickness: 1.2,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child: ListTileTheme(
                            contentPadding: EdgeInsets.symmetric(horizontal: 15),
                            dense: true,
                            horizontalTitleGap: .0,
                            minLeadingWidth: 0,
                            child: ExpansionTile(
                              iconColor: Colors.black,
                              collapsedIconColor: Colors.black,
                              textColor: text_color,
                              title: Text("Wealth Management",
                                  style: GoogleFonts.quicksand(
                                      textStyle: const TextStyle(
                                          color: Color(0xff22263D),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold))),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 19),
                          child: Divider(
                            color: divider_color,
                            thickness: 1.2,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child: ListTileTheme(
                            contentPadding: EdgeInsets.symmetric(horizontal: 15),
                            dense: true,
                            horizontalTitleGap: .0,
                            minLeadingWidth: 0,
                            child: ExpansionTile(
                              iconColor: Colors.black,
                              collapsedIconColor: Colors.black,
                              textColor: text_color,
                              title: Text("Insutance",
                                  style: GoogleFonts.quicksand(
                                      textStyle: const TextStyle(
                                          color: Color(0xff22263D),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold))),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 19),
                          child: Divider(
                            color: divider_color,
                            thickness: 1.2,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child:ListTileTheme(
                            contentPadding: EdgeInsets.symmetric(horizontal: 15),
                            dense: true,
                            horizontalTitleGap: .0,
                            minLeadingWidth: 0,
                            child: ExpansionTile(
                              iconColor: Colors.black,
                              collapsedIconColor: Colors.black,
                              textColor: text_color,
                              title: Text("Fixed Deposits",
                                  style: GoogleFonts.quicksand(
                                      textStyle: const TextStyle(
                                          color: Color(0xff22263D),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold))),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 19),
                          child: Divider(
                            color: divider_color,
                            thickness: 1.2,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child: ListTileTheme(
                            contentPadding: EdgeInsets.symmetric(horizontal: 15),
                            dense: true,
                            horizontalTitleGap: .0,
                            minLeadingWidth: 0,
                            child: ExpansionTile(
                              iconColor: Colors.black,
                              collapsedIconColor: Colors.black,
                              textColor: text_color,
                              title: Text("Small Deposits",
                                  style: GoogleFonts.quicksand(
                                      textStyle: const TextStyle(
                                          color: Color(0xff22263D),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold))),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 19),
                          child: Divider(
                            color: divider_color,
                            thickness: 1.2,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child:ListTileTheme(
                            contentPadding: EdgeInsets.symmetric(horizontal: 15),
                            dense: true,
                            horizontalTitleGap: .0,
                            minLeadingWidth: 0,
                            child: ExpansionTile(
                              iconColor: Colors.black,
                              collapsedIconColor: Colors.black,
                              textColor: text_color,
                              title: Text("NPS",
                                  style: GoogleFonts.quicksand(
                                      textStyle: const TextStyle(
                                          color: Color(0xff22263D),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold))),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 19),
                          child: Divider(
                            color: divider_color,
                            thickness: 1.2,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child: ListTileTheme(
                            contentPadding: EdgeInsets.symmetric(horizontal: 15),
                            dense: true,
                            horizontalTitleGap: .0,
                            minLeadingWidth: 0,
                            child: ExpansionTile(
                              iconColor: Colors.black,
                              collapsedIconColor: Colors.black,
                              textColor: text_color,
                              title: Text("Talk to expert",
                                  style: GoogleFonts.quicksand(
                                      textStyle: const TextStyle(
                                          color: Color(0xff22263D),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold))),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 19),
                          child: Divider(
                            color: divider_color,
                            thickness: 1.2,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child: ListTileTheme(
                            contentPadding: EdgeInsets.symmetric(horizontal: 15),
                            dense: true,
                            horizontalTitleGap: .0,
                            minLeadingWidth: 0,
                            child: ExpansionTile(
                              iconColor: Colors.black,
                              collapsedIconColor: Colors.black,
                              textColor: text_color,
                              title: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AboutUs()));
                                },
                                child: Text("About Us",
                                    style: GoogleFonts.quicksand(
                                        textStyle: const TextStyle(
                                            color: Color(0xff22263D),
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold))),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 19),
>>>>>>> master
                          child: Divider(
                            color: divider_color,
                            thickness: 1.2,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
<<<<<<< HEAD
                        ExpansionTile(
                          iconColor: Colors.black,
                          collapsedIconColor: Colors.black,
                          textColor: text_color,

                          trailing: trailing_icon,
                          title: Text("Equity Trading",
                              style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                      color: Color(0xff22263D),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold))),
=======
                        Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child: ListTileTheme(
                            contentPadding: EdgeInsets.symmetric(horizontal: 15),
                            dense: true,
                            horizontalTitleGap: .0,
                            minLeadingWidth: 0,
                            child: ExpansionTile(
                              iconColor: Colors.black,
                              collapsedIconColor: Colors.black,
                              textColor: text_color,
                              title: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const NewsAndInsights()));
                                },
                                child: Text("News and Insights",
                                    style: GoogleFonts.quicksand(
                                        textStyle: const TextStyle(
                                            color: Color(0xff22263D),
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold))),
                              ),
                            ),
                          ),
>>>>>>> master
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 19),
                          child: Divider(
                            color: divider_color,
                            thickness: 1.2,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
<<<<<<< HEAD
                        ExpansionTile(
                          iconColor: Colors.black,
                          collapsedIconColor: Colors.black,
                          textColor: text_color,

                          trailing: trailing_icon,
                          title: Text("F&Q Trading",
                              style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                      color: Color(0xff22263D),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold))),
=======
                        Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child:  ListTileTheme(
                            contentPadding: EdgeInsets.symmetric(horizontal: 15),
                            dense: true,
                            horizontalTitleGap: .0,
                            minLeadingWidth: 0,
                            child: ExpansionTile(
                              iconColor: Colors.black,
                              collapsedIconColor: Colors.black,
                              textColor: text_color,
                              title: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ContactUs()));
                                },
                                child: Text("Contact Us",
                                    style: GoogleFonts.quicksand(
                                        textStyle: const TextStyle(
                                            color: Color(0xff22263D),
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold))),
                              ),
                            ),
                          ),
>>>>>>> master
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 19),
                          child: Divider(
                            color: divider_color,
                            thickness: 1.2,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
<<<<<<< HEAD
                        ExpansionTile(
                          iconColor: Colors.black,
                          collapsedIconColor: Colors.black,
                          textColor: text_color,

                          trailing: trailing_icon,
                          title: Text("Wealth Management",
                              style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                      color: Color(0xff22263D),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold))),
=======
                        Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child: ListTileTheme(
                            contentPadding: EdgeInsets.symmetric(horizontal: 15),
                            dense: true,
                            horizontalTitleGap: .0,
                            minLeadingWidth: 0,
                            child: ExpansionTile(
                              iconColor: Colors.black,
                              collapsedIconColor: Colors.black,
                              textColor: text_color,
                              title: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TermsConditons()));
                                },
                                child: Text("Term & Conditions",
                                    style: GoogleFonts.quicksand(
                                        textStyle: const TextStyle(
                                            color: Color(0xff22263D),
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold))),
                              ),
                            ),
                          ),
>>>>>>> master
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 19),
                          child: Divider(
                            color: divider_color,
                            thickness: 1.2,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
<<<<<<< HEAD
                        ExpansionTile(
                          iconColor: Colors.black,
                          collapsedIconColor: Colors.black,
                          textColor: text_color,

                          trailing: trailing_icon,
                          title: Text("Insutance",
                              style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                      color: Color(0xff22263D),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold))),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 19),
                          child: Divider(
                            color: divider_color,
                            thickness: 1.2,
=======
                        Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child: ListTileTheme(
                            contentPadding: EdgeInsets.symmetric(horizontal: 15),
                            dense: true,
                            horizontalTitleGap: .0,
                            minLeadingWidth: 0,
                            child: ExpansionTile(
                              iconColor: Colors.black,
                              collapsedIconColor: Colors.black,
                              textColor: text_color,
                              title: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Disclamer()));
                                },
                                child: Text("Disclaimer",
                                    style: GoogleFonts.quicksand(
                                        textStyle: const TextStyle(
                                            color: Color(0xff22263D),
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold))),
                              ),
                            ),
>>>>>>> master
                          ),
                        ),
                      ],
                    ),
<<<<<<< HEAD
                    Column(
                      children: [
                        ExpansionTile(
                          iconColor: Colors.black,
                          collapsedIconColor: Colors.black,
                          textColor: text_color,

                          trailing: trailing_icon,
                          title: Text("Fixed Deposits",
                              style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                      color: Color(0xff22263D),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold))),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 19),
                          child: Divider(
                            color: divider_color,
                            thickness: 1.2,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        ExpansionTile(
                          iconColor: Colors.black,
                          collapsedIconColor: Colors.black,
                          textColor: text_color,

                          trailing: trailing_icon,
                          title: Text("Small Deposits",
                              style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                      color: Color(0xff22263D),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold))),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 19),
                          child: Divider(
                            color: divider_color,
                            thickness: 1.2,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        ExpansionTile(
                          iconColor: Colors.black,
                          collapsedIconColor: Colors.black,
                          textColor: text_color,

                          trailing: trailing_icon,
                          title: Text("NPS",
                              style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                      color: Color(0xff22263D),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold))),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 19),
                          child: Divider(
                            color: divider_color,
                            thickness: 1.2,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        ExpansionTile(
                          iconColor: Colors.black,
                          collapsedIconColor: Colors.black,
                          textColor: text_color,

                          trailing: trailing_icon,
                          title: Text("Talk to expert",
                              style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                      color: Color(0xff22263D),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold))),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 19),
                          child: Divider(
                            color: divider_color,
                            thickness: 1.2,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        ExpansionTile(
                          iconColor: Colors.black,
                          collapsedIconColor: Colors.black,
                          textColor: text_color,

                          trailing: trailing_icon,
                          title: InkWell(onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>AboutUs()));},
                            child: Text("About Us",
                                style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        color: Color(0xff22263D),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 19),
                          child: Divider(
                            color: divider_color,
                            thickness: 1.2,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        ExpansionTile(
                          iconColor: Colors.black,
                          collapsedIconColor: Colors.black,
                          textColor: text_color,

                          trailing: trailing_icon,
                          title: InkWell(onTap:(){Navigator.push(context,MaterialPageRoute(builder: (context)=>NewsAndInsights()));},
                            child: Text("News and Insights",
                                style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        color: Color(0xff22263D),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 19),
                          child: Divider(
                            color: divider_color,
                            thickness: 1.2,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        ExpansionTile(
                          iconColor: Colors.black,
                          collapsedIconColor: Colors.black,
                          textColor: text_color,

                          trailing: trailing_icon,
                          title: InkWell(
                            onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>ContactUs()));},
                            child: Text("Contact Us",
                                style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        color: Color(0xff22263D),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 19),
                          child: Divider(
                            color: divider_color,
                            thickness: 1.2,
                          ),
                        )
                      ],
                    ),





                    InkWell(
                      onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>TermsConditons()));},
                      child: Container(
                      height: 30,
                      alignment: Alignment.center,
                      child: Text("Terms And Conditions"),
                    ),),




                    InkWell(
                      onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>Disclamer()));},
                      child: Container(
                      height: 30,
                      alignment: Alignment.center,
                      child: Text("Disclamer"),
                    ),)
=======
>>>>>>> master
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
