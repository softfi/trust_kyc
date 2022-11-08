import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/utils/colorsConstant.dart';
import 'package:video_player/video_player.dart';

import '../../utils/images.dart';

class VideoPage extends StatefulWidget {
  final String filePath;

  const VideoPage({Key? key, required this.filePath}) : super(key: key);

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController _videoPlayerController;

  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  Future _initVideoPlayer() async {
    _videoPlayerController = VideoPlayerController.file(File(widget.filePath));
    await _videoPlayerController.initialize();
    await _videoPlayerController.play();
    await _videoPlayerController.setLooping(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Preview', style: GoogleFonts.quicksand(
          textStyle: const TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.w600,
              fontSize: 18),
        )),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.clear,
              size: 25,
              color: AppColors.textColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*0.70,
            child: FutureBuilder(
              future: _initVideoPlayer(),
              builder: (context, state) {
                AspectRatio(
                  aspectRatio: _videoPlayerController.value.aspectRatio,
                  child: VideoPlayer(_videoPlayerController),
                );
                if (state.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return VideoPlayer(_videoPlayerController);
                }
              },
            ),
          ),
          const SizedBox(height: 30,),
          InkWell(onTap: (){
            onBank1AddedBottomSheet();
          },
            child: Container(
              height: 45,
              width: 150,
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: AppColors.textColor)),
              child: Center(
                child: Text(
                  "Retake",
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void onBank1AddedBottomSheet() {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(35),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (context) {
          return BottomSheet(
            builder: (BuildContext context) {
              return StatefulBuilder(builder: (BuildContext context, State) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.38,
                  decoration: const BoxDecoration(
                    color: AppColors.textColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35.0),
                      topRight: Radius.circular(35.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Image.asset(
                        ConstantImage.error,
                        width: 75,
                        height: 75,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Center(
                        child: Text(
                          "Are you sure?",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8,),
                      Center(
                        child: Text(
                          "Do you want to Retake this?",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 45,
                                width: MediaQuery.of(context).size.width / 2.4,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.white)),
                                child: Center(
                                  child: Text(
                                    "Cancel",
                                    style: GoogleFonts.quicksand(
                                      textStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: () async {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 45,
                                width: MediaQuery.of(context).size.width / 2.4,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.white),
                                color: Colors.white),
                                child: Center(
                                  child: Text(
                                    "Yes",
                                    style: GoogleFonts.quicksand(
                                      textStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.textColor),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 30,),
                    ],
                  ),
                );
              });
            },
            onClosing: () {},
          );
        });
  }
}
