import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:trust_money/screens/auths/sign_up.dart';
import 'package:trust_money/utils/colorsConstant.dart';
import 'package:video_player/video_player.dart';

class IntroScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IntroScreen();
  }
}

String video = "assets/images/demat.mp4";
List videString = [
  "assets/images/demat.mp4",
  "assets/images/pan.mp4",
  "assets/images/bank.mp4",
  "assets/images/existing_demat.mp4",
];

class _IntroScreen extends State<IntroScreen> {
  late VideoPlayerController _controller;

  call() {
    _controller = VideoPlayerController.asset(video)
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        setState(() {});
      });
  }

  @override
  void initState() {
    call();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PageDecoration pageDecoration = PageDecoration(
      titleTextStyle: GoogleFonts.quicksand(
          textStyle: const TextStyle(
              color: Color(0xff22263D),
              fontSize: 25,
              fontWeight: FontWeight.w500)), //tile font size, weight and color
      bodyTextStyle: GoogleFonts.sourceSansPro(
          textStyle: const TextStyle(
              color: Color(0xff22263D),
              fontSize: 15,
              fontWeight: FontWeight.w500)),
      //body text size and color
      descriptionPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      imagePadding: const EdgeInsets.all(
          20), //image padding//show linear gradient background of page
    );

    return IntroductionScreen(
      animationDuration: 350,
      isProgress: true,
      onChange: (int i) {
        video = videString[i];
        print("videos" + video);
        call();
      },
      globalBackgroundColor: Colors.white,
      //main background of screen
      pages: [
        //set your page view here
        PageViewModel(
          title: "We Are Verifying \nYour Demat Details",
          body: "",
          image: introImage('assets/images/demat.mp4'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "We Are Verifying \nYour Email ID",
          body: "",
          image: introImage('assets/images/pan.mp4'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "We Are Verifying \nYour Bank Account",
          body: "",
          image: introImage('assets/images/bank.map4'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "E-Sign In Process, \nThis May Take Some Time.",
          body: "",
          image: introImage('assets/images/existing_demat.mp4'),
          decoration: pageDecoration,
        ),

        //add more screen here
      ],
      dotsDecorator: const DotsDecorator(
        activeColor: AppColors.btnColor,
        size: Size(10.0, 10.0),
        color: Color(0xffC8C7CE),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      onDone: () => goHomepage(context),
      onSkip: () => goHomepage(context),
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: Text('Skip',
        style: GoogleFonts.sourceSansPro(
            textStyle: const TextStyle(
                color: Color(0xff22263D),
                fontSize: 15,
                fontWeight: FontWeight.w500)),
      ),
      next: Text("Next",
          style: GoogleFonts.quicksand(
              textStyle: const TextStyle(
                  color: Color(0xff22263D),
                  fontSize: 15,
                  fontWeight: FontWeight.bold))),
      done: Text(
        'Getting Started',
        style: GoogleFonts.quicksand(
            textStyle: const TextStyle(
                color: Color(0xff22263D),
                fontSize: 15,
                fontWeight: FontWeight.w500)),
      ),
    );
  }

  void goHomepage(context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) {
      return const SignUp();
    }), (Route<dynamic> route) => false);
  }

  Widget introImage(String assetName) {
    //widget to show intro image
    return SizedBox(
      child: Align(
          alignment: Alignment.bottomCenter,
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container()),
    );
  }
}
