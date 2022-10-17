import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/screens/Congratulations/invalid_pan_name.dart';
import 'package:trust_money/screens/Congratulations/verify_pan_congratulations.dart';
import 'package:video_player/video_player.dart';

class InvalidPANAnimation extends StatefulWidget {
  const InvalidPANAnimation({Key? key,required this.msg}) : super(key: key);
  final String msg;

  @override
  State<InvalidPANAnimation> createState() => _InvalidPANAnimationState();
}

class _InvalidPANAnimationState extends State<InvalidPANAnimation> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.asset("assets/images/loding.mp4")
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        setState(() {});
      });
    Future.delayed(Duration(seconds: 8), () {
      Navigator.pop(context);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) =>  InvalidPanName(msg: widget.msg)));
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
            ) : Container(),
            Text(
              "We Are Verifying \nYour Pan",
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
              "We are validating your PAN and Username with the authorities, this may take some time.",
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
