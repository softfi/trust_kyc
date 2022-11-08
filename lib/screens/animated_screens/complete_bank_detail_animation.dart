import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import '../Congratulations/bank_congratulations.dart';
class BankAnimation extends StatefulWidget {
  const BankAnimation({Key? key}) : super(key: key);

  @override
  State<BankAnimation> createState() => _BankAnimationState();
}

class _BankAnimationState extends State<BankAnimation> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.asset("assets/images/bank.mp4")
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        setState(() {});
      });
    Future.delayed(const Duration(seconds: 5), () async{
     await Navigator.push(context,
          MaterialPageRoute(builder: (context) => const BankComplete()));
     Navigator.pop(context);
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(15.0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : Container(),
            Text(
              "We Are Verifying \nYour Bank Account",
              textAlign: TextAlign.center,
              style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                      color: Color(0xff22263D),
                      fontSize: 22,
                      fontWeight: FontWeight.w500)),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "We will deposit ₹1 in your bank account to verify your account, please wait this may take sometime.",
              textAlign: TextAlign.center,
              style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                      color: Color(0xffC8C7CE),
                      fontSize: 14,
                      fontWeight: FontWeight.w500)),
            ),
          ],
        ),
      ),
    );
  }
}
