import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/drawerWidget/left_drawer.dart';
import 'package:trust_money/screens/auths/sign_up.dart';
import 'package:trust_money/screens/bond/bonds.dart';
import 'package:trust_money/utils/colorsConstant.dart';
import 'package:trust_money/utils/sharedPreference.dart';
import '../../bottom_navigation/bottom_navigation.dart';
import '../../drawerWidget/drawerWidget.dart';
import '../../utils/images.dart';
import '../../utils/strings.dart';
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIPOs = 2;
  bool? userIsLoggedIn;

  getLoggedInState() async {
    await HelperFunctions.getuserLoggedInSharedPreference().then((value) {
      setState(() {
        userIsLoggedIn = value;
        print("====00001 $userIsLoggedIn");
      });
    });
  }

  @override
  void initState() {
    getLoggedInState();
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        exit(0);
      },
      child: Scaffold(
        key: _scaffoldKey,
        bottomNavigationBar: const CustomBottomNavigation(),
        drawer: const LeftDrawer(),
        endDrawer: const DrawerWidget(),
        drawerEnableOpenDragGesture: false,
        endDrawerEnableOpenDragGesture: false,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          elevation: 0,
          backgroundColor: const Color(0xffF2A9B0),
          toolbarHeight: 55,
          centerTitle: true,
          title: Image.asset(
            ConstantImage.white_logo,
            height: 50,
            width: 50,
          ),
          actions: [
            userIsLoggedIn == null
                ? InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUp()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 11.0, bottom: 11, right: 11),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.45),
                                spreadRadius: 5,
                                blurRadius: 11,
                                offset: const Offset(0, 3),
                              ),
                            ],
                            color: Colors.white),
                        child: Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                              "Sign Up/In",
                              style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : IconButton(
                    onPressed: () {
                      _scaffoldKey.currentState?.openEndDrawer();
                    },
                    icon: const Icon(Icons.person_pin))
          ],
        ),
        body: SingleChildScrollView(
          child: Stack(
            alignment: AlignmentDirectional.topEnd,
            fit: StackFit.passthrough,
            children: [
              Column(
                children: [
                  Container(
                    height: 600,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff6dd4e5),
                          Color(0xffF2A9B0),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                  Container(
                    height: 300,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.white,
                          Color(0xff6dd4e5),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35.0),
                child: Image.asset(
                  ConstantImage.leaf,
                  color: Colors.white,
                  height: 400,
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 45.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                              "From the makers of the most \nTrusted Bonds Investment House.\n",
                              style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Hello I am ",
                                        style: GoogleFonts.quicksand(
                                          textStyle:  TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 26,
                                            shadows: <Shadow>[
                                              Shadow(
                                                blurRadius: 11,
                                                offset:Offset(0, 3),
                                                color: Color(0x00000029).withOpacity(0.19),
                                              ),
                                            ],
                                          ),
                                        )),
                                    Row(
                                      children: [
                                        Text("Bond, Trust Bond",
                                            style: GoogleFonts.quicksand(
                                              textStyle:  TextStyle(
                                                color: AppColors.textColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 26,
                                                shadows: <Shadow>[
                                                  Shadow(
                                                    blurRadius: 11,
                                                    offset:Offset(0, 3),
                                                    color: Color(0x00000029).withOpacity(0.19),
                                                  ),
                                                ],
                                              ),
                                            )),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 4.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey.withOpacity(0.11),
                                                  spreadRadius: 5,
                                                  blurRadius: 3,
                                                  offset: const Offset(0, 3),
                                                ),
                                              ],
                                              color:Colors.transparent
                                            ),
                                            child: SvgPicture.asset(
                                              ConstantImage.spyMale,
                                              height: 50,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Positioned(
                                  top: 23,
                                  left: 232,
                                  child: Container(
                                    alignment: const Alignment(-0.62, -1),
                                    color: Colors.transparent,
                                    height: 50,
                                    child: Transform.rotate(
                                      angle: -math.pi / 4,
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        color: Colors.white,
                                        alignment: const Alignment(-0.62, 1),
                                        child: const SizedBox(
                                          width: 20,
                                          height: 60,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 5,
                                  left: 158,
                                  child: Container(
                                    height: 33,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                    child: Center(
                                        child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0),
                                      child: Text(
                                        "( Naam to suna hoga! )",
                                        style: GoogleFonts.quicksand(
                                            textStyle: const TextStyle(
                                                color: Color(0xff22263D),
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                    )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            "Licensed to make\nmoney for you.",
                            style: GoogleFonts.quicksand(
                              textStyle:  TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                shadows: <Shadow>[
                                  Shadow(
                                    blurRadius: 11,
                                    offset:Offset(0, 3),
                                    color: Color(0x00000029).withOpacity(0.19),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 12),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.45),
                                    spreadRadius: 5,
                                    blurRadius: 11,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                                color: Colors.white.withOpacity(0.80),
                                borderRadius: BorderRadius.circular(50)),
                            child: Text("Let’s find the right BOND for you",
                                style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                    color: Color(0xff22263D),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Image.asset(
                          ConstantImage.quick,
                          fit: BoxFit.cover,
                          height: 416,
                          //width: MediaQuery.of(context).size.width,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.45),
                                spreadRadius: 5,
                                blurRadius: 11,
                                offset: const Offset(0, 3),
                              ),
                            ], color: Colors.white),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  fillColor: Colors.white54,
                                  filled: true,
                                  border: InputBorder.none,
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  hintText: "Bond name, issuer and bond type",
                                  hintStyle: GoogleFonts.sourceSansPro(
                                    textStyle: const TextStyle(
                                        color: Color(0xff1D2B84),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  ),
                                  prefixIcon: const Icon(Icons.search,
                                      color: Color(0xff1D2B84)),
                                  suffixIcon: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: 100,
                                      decoration: const BoxDecoration(
                                        color: AppColors.textColor,
                                        boxShadow: [],
                                      ),
                                      child: Center(
                                          child: Text(
                                        "Search",
                                        style: GoogleFonts.sourceSansPro(
                                          textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      )),
                                    ),
                                  )),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    currentIPOs = 1;
                                  });
                                },
                                child: Container(
                                  height: 45,
                                  width: width / 3,
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0x29000000),
                                          blurRadius: 6.0,
                                        ),
                                      ],
                                      color: currentIPOs == 1
                                          ? const Color(0xff22263D)
                                          : Colors.white),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Text(
                                      "Current IPOs",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: TextStyle(
                                            color: currentIPOs == 1
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
                                    currentIPOs = 2;
                                  });
                                },
                                child: Container(
                                  height: 45,
                                  width: width / 3,
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0x29000000),
                                          blurRadius: 6.0,
                                        ),
                                      ],
                                      color: currentIPOs == 2
                                          ? const Color(0xff22263D)
                                          : Colors.white),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Text(
                                      "Bonds in Spotlight",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: TextStyle(
                                            color: currentIPOs == 2
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
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        myList(),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            Strings.home_note,
                            style: GoogleFonts.sourceSansPro(
                                textStyle: const TextStyle(
                                    color: Color(0xff22263D),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic)),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Bonds()));
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                height: 55,
                                width: 220,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      bottomLeft: Radius.circular(50)),
                                  color: Color(0xffEC515F),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Explore All Bonds",
                                      style: GoogleFonts.quicksand(
                                        textStyle: const TextStyle(
                                          color: Color(0xffFfffff),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Image.asset("assets/images/text.png"),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        investWidget(),
                        const SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text("Seekho toh sirf",
                              style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            children: [
                              Text("Bond, Trust Bond ",
                                  style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        color: Color(0xffFF405A),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 28),
                                  )),
                              Text("se",
                                  style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        color: AppColors.textColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 23),
                                  )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            "Learn your smart investment moves from the best so far…",
                            style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15)),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        seekhoList(),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              height: 55,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Color(0xffEC515F),
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
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            "From around the market",
                            style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 19)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            "Bond ki khabaren",
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  color: Color(0xffFF405A),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 28),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        khabarenList(),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              height: 55,
                              width: 150,
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
                        ),

                        /* Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          color: AppColors.textColor,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("BONDS",
                                    style: GoogleFonts.sourceSansPro(
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 23),
                                    )),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text("- Explore Bonds",
                                    style: GoogleFonts.sourceSansPro(
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15),
                                    )),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text("- Collection of Bonds",
                                    style: GoogleFonts.sourceSansPro(
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15),
                                    )),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text("- How it works?",
                                    style: GoogleFonts.sourceSansPro(
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15),
                                    )),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text("- Frequently Asked Questions",
                                    style: GoogleFonts.sourceSansPro(
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15),
                                    )),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text("- Learn, from Bond, Trust Bond",
                                    style: GoogleFonts.sourceSansPro(
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15),
                                    )),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text("- Talk to Bond, Trust Bond",
                                    style: GoogleFonts.sourceSansPro(
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15),
                                    )),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text("- Bond Ki khabaren",
                                    style: GoogleFonts.sourceSansPro(
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15),
                                    )),
                                const SizedBox(
                                  height: 25,
                                ),
                                Text("Talk to expert",
                                    style: GoogleFonts.sourceSansPro(
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 23),
                                    )),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text("- Write to us",
                                    style: GoogleFonts.sourceSansPro(
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15),
                                    )),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text("- Login to Chat",
                                    style: GoogleFonts.sourceSansPro(
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15),
                                    )),
                                const SizedBox(
                                  height: 25,
                                ),
                                Text("About Us",
                                    style: GoogleFonts.sourceSansPro(
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 22),
                                    )),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text("News and Insights",
                                    style: GoogleFonts.sourceSansPro(
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 22),
                                    )),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text("Contact Us",
                                    style: GoogleFonts.sourceSansPro(
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 22),
                                    )),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text("Privacy Policy",
                                    style: GoogleFonts.sourceSansPro(
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 22),
                                    )),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text("Terms & Conditions",
                                    style: GoogleFonts.sourceSansPro(
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 22),
                                    )),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text("Disclaimer",
                                    style: GoogleFonts.sourceSansPro(
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 22),
                                    )),
                                const SizedBox(
                                  height: 15,
                                ),
                                Image.asset(
                                  "assets/images/white_logo.png",
                                  height: 100,
                                  width: 100,
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Image.asset(
                                  "assets/images/social_media.png",
                                  scale: 4,
                                ),
                                const SizedBox(
                                  height: 35,
                                ),
                                Text(
                                    "© 2020-2021 Trust Capital Pvt Ltd. \nCIN: U72123MH1234PTC123456",
                                    style: GoogleFonts.sourceSansPro(
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    )),
                              ],
                            ),
                          ),
                        ),*/
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  subscribe(),
                  const SizedBox(
                    height: 20,
                  ),
                  needHelp(),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              Positioned(
                right: 0,
                bottom: 1100,
                child: Image.asset(
                  ConstantImage.bg,
                  color: Colors.black26,
                  height: 400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget investWidget() {
    return Stack(
      children: [
        Positioned(
            bottom: -13,
            right: -40,
            child: Image.asset(
              "assets/images/m_tree.png",
              height: 280,
              width: 190,
            )
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 5,
                height: 460,
                color: AppColors.textColor,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "INVEST IN \n3 SIMPLE STEPS",
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        color: Color(0xff00C6D8),
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "REGISTER & COMPLETE KYC",
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                  ),
                  Text(
                    "Upload your documents online",
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "CHOOSE BOND",
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                  ),
                  Text(
                    "Select bonds that match \nyour investment goal",
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "MAKE INVESTMENT",
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                  ),
                  Text(
                    "Pay online and receive bond \nunits in your Demat account",
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SvgPicture.asset("assets/images/line.svg")),
        Positioned(
          left: 20.9,
          top: 15,
          child: Transform.rotate(
            angle: math.pi / 4,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(3),
                    bottomLeft: Radius.circular(3)),
                color: AppColors.textColor,
              ),
              width: 5,
              height: 18,
            ),
          ),
        ),
        Positioned(
          left: 30.7,
          top: 15,
          child: Transform.rotate(
            angle: -math.pi / 4,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(3),
                    bottomLeft: Radius.circular(3)),
                color: Color(0xff00C6D8),
              ),
              width: 5,
              height: 18,
            ),
          ),
        ),
        Positioned(
          top: 156,
          left: 15,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xff00C6D8),
            ),
            width: 25,
            height: 25,
            child: Center(
                child: Text(
              "1",
              style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            )),
          ),
        ),
        Positioned(
          top: 235,
          left: 15,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xff00C6D8),
            ),
            width: 25,
            height: 25,
            child: Center(
                child: Text(
              "2",
              style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            )),
          ),
        ),
        Positioned(
          bottom: 140,
          left: 15,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xff00C6D8),
            ),
            width: 25,
            height: 25,
            child: Center(
                child: Text(
              "3",
              style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            )),
          ),
        ),

      ],
    );
  }

  Widget myList() {
    return SizedBox(
      height: 438,
      width: double.infinity,
      child: ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding:
                const EdgeInsets.only(right: 12.0, top: 2, bottom: 2, left: 12),
            child: Container(
              width: 290,
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                  color: Color(0x29000000),
                  blurRadius: 4.0,
                ),
              ], color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 30,
                      width: 40,
                      decoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(5)),
                          color: AppColors.textColor),
                      child: const Center(
                        child: Icon(
                          Icons.share,
                          color: Colors.white,
                          size: 14,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: const Color(0xff58C3D5).withOpacity(0.35)),
                          child: Center(
                            child: Text(
                              "M",
                              style: GoogleFonts.sourceSansPro(
                                textStyle: const TextStyle(
                                  color: Color(0xff22263D),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        SizedBox(
                          width: 160,
                          child: Text("MAHINDRA & MAHINDRA FINANCIAL",
                              style: GoogleFonts.sourceSansPro(
                                textStyle: const TextStyle(
                                  color: Color(0xff22263D),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    color: const Color(0xffD67278).withOpacity(0.11),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Coupon",
                                  style: GoogleFonts.sourceSansPro(
                                    textStyle: const TextStyle(
                                        color: Color(0xff1D2B84),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "8.00%",
                                  style: GoogleFonts.sourceSansPro(
                                    textStyle: const TextStyle(
                                        color: Color(0xffFF405A),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Yield",
                                style: GoogleFonts.sourceSansPro(
                                  textStyle: const TextStyle(
                                      color: Color(0xff1D2B84),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "10.60%",
                                style: GoogleFonts.sourceSansPro(
                                  textStyle: const TextStyle(
                                      color: Color(0xffFF405A),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: const Color(0xff9BA9AD).withOpacity(0.11),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Interest Payment",
                                  style: GoogleFonts.sourceSansPro(
                                    textStyle: const TextStyle(
                                        color: Color(0xff1D2B84),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Annual",
                                  style: GoogleFonts.sourceSansPro(
                                    textStyle: const TextStyle(
                                        color: Color(0xffFF405A),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Min. Investment",
                                style: GoogleFonts.sourceSansPro(
                                  textStyle: const TextStyle(
                                      color: Color(0xff1D2B84),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Annual",
                                style: GoogleFonts.sourceSansPro(
                                  textStyle: const TextStyle(
                                      color: Color(0xffFF405A),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Image.asset(
                    "assets/images/meter.png",
                    fit: BoxFit.fill,
                    height: 130,
                    width: 240,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 35,
                          child: Text(
                            "IPO",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                  color: Color(0xffFF405A),
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          height: 33,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x29000000),
                                blurRadius: 5.0,
                              ),
                            ],
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xffEC515F),
                                Color(0xffC4414D),
                              ],
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                            ),
                          ),
                          child: Center(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Text("Read More",
                                style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                                )),
                          )),
                        ),
                        const SizedBox(
                          width: 35,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          );
        },
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
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.25),
                spreadRadius: 2,
                blurRadius: 11,
                offset: const Offset(0, 3),
              ),
            ], color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: ListTile(
                dense: false,
                leading: Image.asset(
                  ConstantImage.dummy_pic,
                ),
                title: Text(
                  "What are 54EC Bonds or Capital Gain Bonds",
                  style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Row(
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
                          color:  Color(0xffE1E0E7),
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
          ),
        );
      },
    );
  }

  Widget khabarenList() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.25),
                spreadRadius: 2,
                blurRadius: 11,
                offset: const Offset(0, 3),
              ),
            ], color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: ListTile(
                leading: Image.asset(
                  ConstantImage.dummy_pic,
                ),
                title: Text(
                  "Rainmatter invests Rs 3.5 Cr in Trust Money",
                  style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Row(
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
                          color:  Color(0xffE1E0E7),
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
          ),
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

class Triangle extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    final x = size.width;
    final y = size.height;

    path.moveTo(0, y/2);
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
