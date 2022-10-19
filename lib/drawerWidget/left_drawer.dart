import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/screens/bond/bonds.dart';
import 'package:trust_money/utils/colorsConstant.dart';

import '../screens/bond/buying_bonds.dart';
import '../screens/bond/learn_bond.dart';

var bg_color = Colors.white;
var divider_color = Colors.black;
var text_style = GoogleFonts.quicksand(
    textStyle: const TextStyle(
        color: Color(0xff22263D), fontSize: 20, fontWeight: FontWeight.bold));
var trailing_icon = Icon(
  Icons.keyboard_arrow_down_outlined,
  color: AppColors.primaryColor,
);
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
                        icon: Icon(Icons.clear))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        ExpansionTile(
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
                                padding: EdgeInsets.only(left: 15),
                                color: bg_color,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(onTap: (){
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
                                              Divider(
                                                color: divider_color,
                                              )
                                            ],
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
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
                          title: Text("Mutual Funds",
                              style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                      color: Color(0xff22263D),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold))),
                          // theme: const ExpandedTileThemeData(
                          //   headerColor: Colors.white,
                          //   // headerRadius: 24.0,
                          //   // headerPadding: EdgeInsets.all(24.0),
                          //   headerSplashColor: Colors.red,
                          //   contentBackgroundColor: Colors.white,
                          //   // contentPadding: EdgeInsets.all(24.0),
                          //   // contentRadius: 12.0,
                          // ),
                          // controller: _controller_bonds,
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
                          title: Text("Equity Trading",
                              style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                      color: Color(0xff22263D),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold))),
                          // theme: const ExpandedTileThemeData(
                          //   headerColor: Colors.white,
                          //   // headerRadius: 24.0,
                          //   // headerPadding: EdgeInsets.all(24.0),
                          //   headerSplashColor: Colors.red,
                          //   contentBackgroundColor: Colors.white,
                          //   // contentPadding: EdgeInsets.all(24.0),
                          //   // contentRadius: 12.0,
                          // ),
                          // controller: _controller_bonds,
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
                          title: Text("F&Q Trading",
                              style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                      color: Color(0xff22263D),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold))),
                          // theme: const ExpandedTileThemeData(
                          //   headerColor: Colors.white,
                          //   // headerRadius: 24.0,
                          //   // headerPadding: EdgeInsets.all(24.0),
                          //   headerSplashColor: Colors.red,
                          //   contentBackgroundColor: Colors.white,
                          //   // contentPadding: EdgeInsets.all(24.0),
                          //   // contentRadius: 12.0,
                          // ),
                          // controller: _controller_bonds,
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
                          title: Text("Wealth Management",
                              style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                      color: Color(0xff22263D),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold))),
                          // theme: const ExpandedTileThemeData(
                          //   headerColor: Colors.white,
                          //   // headerRadius: 24.0,
                          //   // headerPadding: EdgeInsets.all(24.0),
                          //   headerSplashColor: Colors.red,
                          //   contentBackgroundColor: Colors.white,
                          //   // contentPadding: EdgeInsets.all(24.0),
                          //   // contentRadius: 12.0,
                          // ),
                          // controller: _controller_bonds,
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
                          title: Text("Insutance",
                              style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                      color: Color(0xff22263D),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold))),
                          // theme: const ExpandedTileThemeData(
                          //   headerColor: Colors.white,
                          //   // headerRadius: 24.0,
                          //   // headerPadding: EdgeInsets.all(24.0),
                          //   headerSplashColor: Colors.red,
                          //   contentBackgroundColor: Colors.white,
                          //   // contentPadding: EdgeInsets.all(24.0),
                          //   // contentRadius: 12.0,
                          // ),
                          // controller: _controller_bonds,
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
                          title: Text("Fixed Deposits",
                              style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                      color: Color(0xff22263D),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold))),
                          // theme: const ExpandedTileThemeData(
                          //   headerColor: Colors.white,
                          //   // headerRadius: 24.0,
                          //   // headerPadding: EdgeInsets.all(24.0),
                          //   headerSplashColor: Colors.red,
                          //   contentBackgroundColor: Colors.white,
                          //   // contentPadding: EdgeInsets.all(24.0),
                          //   // contentRadius: 12.0,
                          // ),
                          // controller: _controller_bonds,
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
                          // theme: const ExpandedTileThemeData(
                          //   headerColor: Colors.white,
                          //   // headerRadius: 24.0,
                          //   // headerPadding: EdgeInsets.all(24.0),
                          //   headerSplashColor: Colors.red,
                          //   contentBackgroundColor: Colors.white,
                          //   // contentPadding: EdgeInsets.all(24.0),
                          //   // contentRadius: 12.0,
                          // ),
                          // controller: _controller_bonds,
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
                          // theme: const ExpandedTileThemeData(
                          //   headerColor: Colors.white,
                          //   // headerRadius: 24.0,
                          //   // headerPadding: EdgeInsets.all(24.0),
                          //   headerSplashColor: Colors.red,
                          //   contentBackgroundColor: Colors.white,
                          //   // contentPadding: EdgeInsets.all(24.0),
                          //   // contentRadius: 12.0,
                          // ),
                          // controller: _controller_bonds,
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
                          // theme: const ExpandedTileThemeData(
                          //   headerColor: Colors.white,
                          //   // headerRadius: 24.0,
                          //   // headerPadding: EdgeInsets.all(24.0),
                          //   headerSplashColor: Colors.red,
                          //   contentBackgroundColor: Colors.white,
                          //   // contentPadding: EdgeInsets.all(24.0),
                          //   // contentRadius: 12.0,
                          // ),
                          // controller: _controller_bonds,
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
                          title: Text("About Us",
                              style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                      color: Color(0xff22263D),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold))),
                          // theme: const ExpandedTileThemeData(
                          //   headerColor: Colors.white,
                          //   // headerRadius: 24.0,
                          //   // headerPadding: EdgeInsets.all(24.0),
                          //   headerSplashColor: Colors.red,
                          //   contentBackgroundColor: Colors.white,
                          //   // contentPadding: EdgeInsets.all(24.0),
                          //   // contentRadius: 12.0,
                          // ),
                          // controller: _controller_bonds,
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
                          title: Text("News and Insights",
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
                          title: Text("Contact Us",
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