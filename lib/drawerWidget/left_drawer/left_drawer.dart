import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/drawerWidget/left_drawer/privacy_policy.dart';
import 'package:trust_money/screens/about_us/about_us.dart';
import 'package:trust_money/screens/bond/read_bonds.dart';
import 'package:trust_money/screens/contactUs/contact_us.dart';
import 'package:trust_money/screens/disclimar/disclamer.dart';
import 'package:trust_money/screens/faq.dart';
import 'package:trust_money/screens/news_and_insights/newandinsights.dart';
import 'package:trust_money/screens/termsAndConditons/termsAndConditons.dart';
import 'package:trust_money/utils/colorsConstant.dart';

import '../../screens/bond/gold_bond.dart';
import '../../screens/bond/collection_of_bonds.dart';
import '../../screens/bond/learn_bonds/learn_bond.dart';

var bg_color = Colors.white;
var divider_color = AppColors.textColor;
var text_style = GoogleFonts.quicksand(
    textStyle: const TextStyle(
        color: Color(0xff22263D), fontSize: 20, fontWeight: FontWeight.bold));

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
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child: ListTileTheme(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 15),
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
                                            fontWeight: FontWeight.w600))),
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 0,
                                        right:
                                            MediaQuery.of(context).size.width /
                                                12,
                                        left: 15),
                                    color: bg_color,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const ReadBonds()));
                                          },
                                          child: Container(
                                              padding: EdgeInsets.only(top: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("Explore Bonds",
                                                      style: GoogleFonts.quicksand(
                                                          textStyle: const TextStyle(
                                                              color: Color(
                                                                  0xff22263D),
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500))),
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
                                                        const CollectionOfBonds()));
                                          },
                                          child: Container(
                                              padding: const EdgeInsets.only(top: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("Collection of Bonds",
                                                      style: GoogleFonts.quicksand(
                                                          textStyle: const TextStyle(
                                                              color: Color(
                                                                  0xff22263D),
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500))),
                                                  Divider(
                                                    color: divider_color,
                                                  )
                                                ],
                                              )),
                                        ),
                                        Container(
                                            padding: EdgeInsets.only(top: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("How it works",
                                                    style: GoogleFonts.quicksand(
                                                        textStyle:
                                                            const TextStyle(
                                                                color: Color(
                                                                    0xff22263D),
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500))),
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
                                                        FAQs()));
                                          },
                                          child: Container(
                                              padding: EdgeInsets.only(top: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      "Frequently Asked Questions",
                                                      style: GoogleFonts.quicksand(
                                                          textStyle: const TextStyle(
                                                              color: Color(
                                                                  0xff22263D),
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500))),
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
                                                        const LearnBond()));
                                          },
                                          child: Container(
                                              padding: EdgeInsets.only(top: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      "Learn,from Bonds, Trust Bonds",
                                                      style: GoogleFonts.quicksand(
                                                          textStyle: const TextStyle(
                                                              color: Color(
                                                                  0xff22263D),
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500))),
                                                  Divider(
                                                    color: divider_color,
                                                  )
                                                ],
                                              )),
                                        ),
                                        InkWell(
                                          onTap: () {
                                          },
                                          child: Container(
                                              padding: EdgeInsets.only(top: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("Bond Ki Khaberin",
                                                      style: GoogleFonts.quicksand(
                                                          textStyle: const TextStyle(
                                                              color: Color(
                                                                  0xff22263D),
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500))),
                                                ],
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
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
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
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
                                          fontWeight: FontWeight.w600))),
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
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 15),
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
                                          fontWeight: FontWeight.w600))),
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
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
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
                                          fontWeight: FontWeight.w600))),
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
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
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
                                          fontWeight: FontWeight.w600))),
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
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
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
                                          fontWeight: FontWeight.w600))),
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
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
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
                                          fontWeight: FontWeight.w600))),
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
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
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
                                          fontWeight: FontWeight.w600))),
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
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
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
                                          fontWeight: FontWeight.w600))),
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
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
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
                                          fontWeight: FontWeight.w600))),
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
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
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
                                            fontWeight: FontWeight.w600))),
                              ),
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
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
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
                                            fontWeight: FontWeight.w600))),
                              ),
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
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
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
                                            fontWeight: FontWeight.w600))),
                              ),
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
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
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
                                              TermsConditons()));
                                },
                                child: Text("Term & Conditions",
                                    style: GoogleFonts.quicksand(
                                        textStyle: const TextStyle(
                                            color: Color(0xff22263D),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600))),
                              ),
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
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
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
                                              PrivacyPolicy()));
                                },
                                child: Text("Privacy Policy",
                                    style: GoogleFonts.quicksand(
                                        textStyle: const TextStyle(
                                            color: Color(0xff22263D),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600))),
                              ),
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
                                      builder: (context) => Disclaimer()));
                            },
                            child: Text("Disclaimer",
                                style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        color: Color(0xff22263D),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600))),
                          ),
                        ),
                      ),
                    ),
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
