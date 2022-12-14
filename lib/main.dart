import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:trust_money/getx_controller/profile/personal_details_controller.dart';
import 'package:trust_money/utils/sharedPreference.dart';
import 'package:trust_money/utils/images.dart';
import 'package:video_player/video_player.dart';
import 'bottom_navigation/bottom_navigation.dart';
import 'getx_controller/kra/kra_controller.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return GetMaterialApp(
      home: MyPage(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          brightness: Brightness.dark,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<MyPage> {
  bool? userIsLoggedIn;
  bool splashBackgroundColorChange = false;
 // late VideoPlayerController _controller;

  getLoggedInState() async {
    await HelperFunctions.getuserLoggedInSharedPreference().then((value) {
      setState(() {
        userIsLoggedIn = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    initControllers();
    getLoggedInState();
    Future.delayed(const Duration(seconds: 4), () {
      print("==========first $splashBackgroundColorChange");
      setState(() {
        splashBackgroundColorChange = true;
      });
      print("=============last $splashBackgroundColorChange");
    });

    Future.delayed(const Duration(seconds: 7), () {

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => CustomBottomNavigation(currentIndex: 0,)), (e) => false);
    });
  }

  @override
  void dispose() {
    super.dispose();
   // _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: splashBackgroundColorChange == false
            ? const LinearGradient(
                colors: [
                  Color(0xffBEFBFF),
                  Color(0xffFFD7DB),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            : const LinearGradient(
                colors: [Colors.white, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
      ),
      child: Center(
        child: Image.asset(
          ConstantImage.splash,
          scale: 3,
        ),
      ),
    );
  }

  void initControllers() {
    Get.put(PersonalDetailsController());
    Get.put(KRAController());
  }
}
