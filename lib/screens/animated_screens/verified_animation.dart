import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

class VerifiedAnim extends StatefulWidget {
  VerifiedAnim(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.image,
      this.onClick})
      : super(key: key);
  String? title, subTitle, image;
  final void Function()? onClick;

  @override
  State<VerifiedAnim> createState() => _VerifiedAnimState();
}

class _VerifiedAnimState extends State<VerifiedAnim> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.asset(widget.image!)
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        setState(() {});
      });
    Future.delayed(const Duration(seconds: 5), () async {
      Navigator.pop(context);
      widget.onClick!();
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
              widget.title!,
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
              widget.subTitle!,
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
