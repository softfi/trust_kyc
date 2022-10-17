import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_view/photo_view.dart';
import 'package:trust_money/utils/colorsConstant.dart';
import 'package:video_player/video_player.dart';

class ImagePreview extends StatefulWidget {
  const ImagePreview({Key? key,required this.imageFile}) : super(key: key);
final String imageFile;

  @override
  State<ImagePreview> createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
  late VideoPlayerController _videoPlayerController;

  Future _initVideoPlayer() async {
    _videoPlayerController = VideoPlayerController.file(File(widget.imageFile));
    await _videoPlayerController.initialize();
    await _videoPlayerController.setLooping(true);
    await _videoPlayerController.play();
  }

  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(backgroundColor: Colors.white,
        automaticallyImplyLeading: false,elevation: 0.0,
        title:const Text("Preview"),
        actions: [
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon:Icon(Icons.clear,color: Colors.black,))
        ],
      ),
        body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder(
                future: _initVideoPlayer(),
                builder: (context, state) {
                  if (state.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return VideoPlayer(_videoPlayerController);
                  }
                },
              ),
              // PhotoView(tightMode: true,
              //   imageProvider:FileImage(widget.imageFile),
              // ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                      ),
                      child: Container(padding: EdgeInsets.symmetric(horizontal: 25),
                        height: 45,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x29000000),
                              blurRadius: 3.0,
                            ),
                          ],
                          border: Border.all(
                              width: 2,
                              color: AppColors.primaryColor),
                          color:Colors.white,
                        ),
                        child: Center(
                            child: Text(
                              "Delete",
                              style: GoogleFonts.quicksand(
                                textStyle: TextStyle(
                                    color:AppColors.primaryColor, fontWeight: FontWeight.w500, fontSize: 15
                                ),
                              ),
                            )),
                      ),
                    ),

                  ),
                ),  Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                      ),
                      child: Container(padding: EdgeInsets.symmetric(horizontal: 25),
                        height: 45,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x29000000),
                              blurRadius: 3.0,
                            ),
                          ],
                          border: Border.all(
                              width: 2,
                              color: AppColors.primaryColor),
                          color:Colors.white,
                        ),
                        child: Center(
                            child: Text(
                              "Retake",
                              style: GoogleFonts.quicksand(
                                textStyle: TextStyle(
                                    color:AppColors.primaryColor, fontWeight: FontWeight.w500, fontSize: 15
                                ),
                              ),
                            )),
                      ),
                    ),

                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
