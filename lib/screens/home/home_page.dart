import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/drawerWidget/left_drawer/left_drawer.dart';
import 'package:trust_money/getx_controller/personal_details_controller.dart';
import 'package:trust_money/screens/auths/sign_in.dart';
import 'package:trust_money/screens/auths/sign_up.dart';
import 'package:trust_money/screens/bond/read_bonds.dart';
import 'package:trust_money/screens/home/common_widget.dart';
import 'package:trust_money/utils/colorsConstant.dart';
import 'package:trust_money/utils/sharedPreference.dart';
import '../../drawerWidget/drawerWidget.dart';
import '../../utils/images.dart';
import '../../utils/strings.dart';
import 'dart:math' as math;

import '../bond/bond_advantages.dart';
import '../bond/common_widget.dart';
import '../bond/read_more_brands/read_more_bonds.dart';
import '../bond/view_all.dart';
import 'custom_listtile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIPOs = 2;
  bool? userIsLoggedIn;
PersonalDetailsController _personalDetailsController=Get.put(PersonalDetailsController());
  getLoggedInState() async {
    await HelperFunctions.getuserLoggedInSharedPreference().then((value) {
      setState(() {
        userIsLoggedIn = value;
        // if(userIsLoggedIn!)_personalDetailsController.onInit();
        print("====00001 $userIsLoggedIn");
      });
    });
  }

  @override
  void initState() {
    getLoggedInState();
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      color: const Color(0xffE59AA2),
      child: SafeArea(
        child: Scaffold(
            key: _scaffoldKey,
            drawer: const LeftDrawer(),
            endDrawer: const DrawerWidget(),
            drawerEnableOpenDragGesture: false,
            endDrawerEnableOpenDragGesture: false,
            body: CustomScrollView(slivers: [
              SliverAppBar(
                snap: false,
                pinned: false,
                floating: false,
                elevation: 0,
                centerTitle: true,
                iconTheme: const IconThemeData(
                  color: Colors.white,
                ),
                backgroundColor: const Color(0xffE59AA2),
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
                                    builder: (context) => const SignIn()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 11.0, bottom: 11, right: 11),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
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
                          ))
                      : IconButton(
                          onPressed: () {
                            _scaffoldKey.currentState?.openEndDrawer();
                          },
                          icon: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: const Icon(
                                Icons.person,
                                color: Color(0xffE59AA2),
                              )))
                ],
              ),
              SliverToBoxAdapter(
                child: Stack(
                  alignment: AlignmentDirectional.topEnd,
                  fit: StackFit.passthrough,
                  children: [
                    Container(
                      height: 1100,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xffE59AA2),
                            Color(0xff00C6D8).withOpacity(0.55),
                            Color(0xffFFFFFF),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 12,
                      right: 0,
                      child: Image.asset(
                        ConstantImage.leaf,
                        color: Colors.white,
                        height: 409,
                        width: 169,
                      ),
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Text(
                                    "From the makers of the most \nTrusted Bonds Investment House.\n",
                                    style: GoogleFonts.quicksand(
                                      textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Stack(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Hello I am ",
                                              style: GoogleFonts.quicksand(
                                                textStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 26,
                                                  shadows: <Shadow>[
                                                    Shadow(
                                                      blurRadius: 11,
                                                      offset: Offset(0, 3),
                                                      color: Color(0x00000029)
                                                          .withOpacity(0.19),
                                                    ),
                                                  ],
                                                ),
                                              )),
                                          Row(
                                            children: [
                                              Text("Bond, Trust Bond",
                                                  style: GoogleFonts.quicksand(
                                                    textStyle: TextStyle(
                                                      color:
                                                          AppColors.textColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 26,
                                                      shadows: <Shadow>[
                                                        Shadow(
                                                          blurRadius: 11,
                                                          offset: Offset(0, 3),
                                                          color:
                                                              Color(0x00000029)
                                                                  .withOpacity(
                                                                      0.19),
                                                        ),
                                                      ],
                                                    ),
                                                  )),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 4.0),
                                                child: Container(
                                                  decoration:
                                                      BoxDecoration(boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.11),
                                                      spreadRadius: 5,
                                                      blurRadius: 3,
                                                      offset:
                                                          const Offset(0, 3),
                                                    ),
                                                  ], color: Colors.transparent),
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
                                              alignment:
                                                  const Alignment(-0.62, 1),
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
                                            borderRadius:
                                                BorderRadius.circular(13),
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
                                                      fontWeight:
                                                          FontWeight.w500)),
                                            ),
                                          )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Text(
                                  "Licensed to make\nmoney for you.",
                                  style: GoogleFonts.quicksand(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      shadows: <Shadow>[
                                        Shadow(
                                          blurRadius: 11,
                                          offset: Offset(0, 3),
                                          color: Color(0x00000029)
                                              .withOpacity(0.19),
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14, vertical: 12),
                                  decoration: BoxDecoration(
                                      // boxShadow: [
                                      //   BoxShadow(
                                      //     color: Colors.grey.withOpacity(0.45),
                                      //     spreadRadius: 5,
                                      //     blurRadius: 11,
                                      //     offset: const Offset(0, 3),
                                      //   ),
                                      // ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50)),
                                  child:
                                      Text("Let’s find the right BOND for you",
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  ConstantImage.quick,
                                  fit: BoxFit.cover,
                                  // height: 416,
                                  //width: MediaQuery.of(context).size.width,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Container(
                                  height: 60,
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.25),
                                      spreadRadius: 3,
                                      blurRadius: 11,
                                      offset: const Offset(0, 1),
                                    ),
                                  ], color: Color(0xffB2EEF8)),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        fillColor: Color(0xffB2EEF8),
                                        filled: true,
                                        border: InputBorder.none,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 20),
                                        hintText:
                                            "Bond name, issuer and bond type",
                                        hintStyle: GoogleFonts.sourceSansPro(
                                          textStyle: const TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16),
                                        ),
                                        prefixIcon: const Icon(Icons.search,
                                            color: Colors.grey),
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
                                height: 40,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
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
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.25),
                                                spreadRadius: 3,
                                                blurRadius: 11,
                                                offset: const Offset(0, 1),
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
                                height: 25,
                              ),
                              ReadMoreList(),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Text(
                                  Strings.home_note,
                                  style: GoogleFonts.sourceSansPro(
                                      textStyle: const TextStyle(
                                          color: Color(0xff22263D),
                                          fontSize: 11,
                                          height: 1.1,
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
                                            builder: (context) =>
                                                const ReadBonds()));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 12.0),
                                    child: ViewAllWidget(
                                      title: 'Explore All Bonds',
                                      width: 225,
                                    ),
                                  )),
                              const SizedBox(
                                height: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Image.asset("assets/images/text.png"),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CommonWidget.invest(),
                              const SizedBox(
                                height: 50,
                              ),
                              SeekhoWidget(),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: ViewAllWidget(
                                    title: 'View All', width: 150),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Text(
                                  "Bond ki khabaren",
                                  style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        color: Color(0xffFF405A),
                                        fontWeight: FontWeight.w700,
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
                                padding: const EdgeInsets.only(right: 12.0),
                                child: ViewAllWidget(
                                  title: 'View All',
                                  width: 150,
                                ),
                              ),
                            ],
                          ),
                        ),
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
                  ],
                ),
              )
            ])),
      ),
    );
  }
}
