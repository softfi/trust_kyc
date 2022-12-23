import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/screens/kyc/profile/my_profile.dart';
import 'package:video_player/video_player.dart';
class NewDematAnimation extends StatefulWidget {
  const NewDematAnimation({Key? key}) : super(key: key);

  @override
  State<NewDematAnimation> createState() => _NewDematAnimationState();
}

class _NewDematAnimationState extends State<NewDematAnimation> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.asset("assets/images/demat.mp4")
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        setState(() {});
      });
    Future.delayed(Duration(seconds: 5), () async{
      await Navigator.push(context,
          MaterialPageRoute(builder: (context) =>  MyProfile()));
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
      body: Column(
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
            "All Right!",
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
            "The New Demat account has been added successfully.",
            textAlign: TextAlign.center,
            style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                    color: Color(0xffC8C7CE),
                    fontSize: 14,
                    fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }
}
