import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

import '../../../../getx_controller/ipv/ipv_controller.dart';
import '../../../../utils/colorsConstant.dart';
import '../../../../utils/images.dart';

class VideoPreview extends StatelessWidget {
  VideoPreview({Key? key}) : super(key: key);
  IPVController _ipvController = Get.put(IPVController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
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
              Get.back();
              _ipvController.videoPlayerController12.dispose();
            },
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.70,
            child: FutureBuilder(
              future: _ipvController.initVideoPlayerPreview(),
              builder: (context, state) {
                AspectRatio(
                  aspectRatio: _ipvController.videoPlayerController12.value.aspectRatio,
                  child: VideoPlayer(_ipvController.videoPlayerController12),
                );
                if (state.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return VideoPlayer(_ipvController.videoPlayerController12);
                }
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              _ipvController.videoPlayerController12.dispose();
              confirmationBottomSheet();
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

  void confirmationBottomSheet() {
    Get.bottomSheet(
        Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
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
                  const SizedBox(
                    height: 8,
                  ),
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
                  const SizedBox(
                    height: 30,
                  ),
                 Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                            Get.back();
                          },
                          child: Container(
                            height: 45,
                            width: 130,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.white)),
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
                                _ipvController.isLoading.value = 1;
                                _ipvController.isRecordingPlay.value = false;
                                _ipvController.isRecordingStop.value = false;
                                Get.back();
                                Get.back();
                              },
                              child: Container(
                                height: 45,
                                width: 130,
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
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ],
        ),
        enableDrag: false,
        backgroundColor: AppColors.textColor,
        isDismissible: false,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30))));
  }
}
