import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/screens/home/vedio_page.dart';
import 'package:trust_money/utils/images.dart';
import 'package:video_player/video_player.dart';

import '../../utils/colorsConstant.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  bool _isLoading = false;
  bool _isRecordingPlay = false;
  bool _isRecording = false;
  bool _isRecordingStop = false;
  late CameraController _cameraController;
  late VideoPlayerController _videoPlayerController;

  var file;

  _initCamera() async {
    final cameras = await availableCameras();
    final front = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front);
    _cameraController = CameraController(front, ResolutionPreset.max);
    await _cameraController.initialize();
    setState(() => _isLoading = false);
  }

  _recordVideo() async {
    if (_isRecording) {
      // final file = await _cameraController.stopVideoRecording();
      // setState(() => _isRecording = false);
      // final route = MaterialPageRoute(
      //   fullscreenDialog: true,
      //   builder: (_) => VideoPage(filePath: file.path),
      // );
      // Navigator.push(context, route);
    } else {
      await _cameraController.prepareForVideoRecording();
      await _cameraController.startVideoRecording();
      setState(() => _isRecording = true);
    }
  }

  Future _initVideoPlayer() async {
    _videoPlayerController = VideoPlayerController.file(File(file.path));
    await _videoPlayerController.initialize();
    // await _videoPlayerController.play();
  }

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x29000000),
                      blurRadius: 4.0,
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: 160,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.red),
                      ),
                      Text("Enter the 4 digits dfhgsf wueyruyr uyy weeyrwey ryf euwyr weeurywe uryweu fweurt weuyewtruywetr uwerteuwr wer tweuy rweuyrt eqry,",textAlign: TextAlign.center,)
                    ],
                  ),
                ),
              ),
            )
          ],
        )
        /* Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
                height: 400,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 3,
                      color: _isLoading
                          ? const Color(0xff66DC65)
                          : AppColors.primaryColor),
                ),
                child: _isLoading == false
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: SvgPicture.asset(
                            ConstantImage.profile_pic,
                          ),
                        ),
                      )
                    : _isRecordingPlay == false
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: CameraPreview(_cameraController),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Stack(
                              children: [
                                FutureBuilder(
                                  future: _initVideoPlayer(),
                                  builder: (context, state) {
                                    // return VideoPlayer(_videoPlayerController!);
                                    if (state.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    } else {
                                      return VideoPlayer(
                                          _videoPlayerController);
                                    }
                                  },
                                ),
                                Positioned(
                                  top: 180,
                                  left: 130,
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.5, color: Colors.white),
                                      borderRadius: BorderRadius.circular(35),
                                      color:
                                          Color(0xffffffff).withOpacity(0.20),
                                    ),
                                    child: const Center(
                                        child: Icon(
                                      Icons.play_arrow,
                                      size: 30,
                                      color: Colors.white,
                                    )),
                                  ),
                                )
                              ],
                            ),
                          )),
          ),
          const SizedBox(
            height: 40,
          ),
          _isLoading == false
              ? InkWell(
                  onTap: () async {
                    setState(() {
                      _isLoading = true;
                    });
                  },
                  child: Container(
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: AppColors.primaryColor),
                    child: Center(
                        child: Text(
                      "Capture",
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 10),
                      ),
                    )),
                  ),
                )
              : _isRecordingStop == false
                  ? InkWell(
                      onTap: () async {
                        setState(() {
                          _recordVideo();
                          Future.delayed(Duration(seconds: 15), () async {
                            _isRecordingPlay = true;
                            file = await _cameraController.stopVideoRecording();
                            setState(() => _isRecording = false);
                            final route = MaterialPageRoute(
                              fullscreenDialog: true,
                              builder: (_) => VideoPage(filePath: file.path),
                            );
                            //Navigator.push(context, route);
                          });
                          setState(() {
                            _isRecordingStop = true;
                          });
                        });
                      },
                      child: Container(
                        height: 30,
                        width: 140,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            color: Color(0xff02AD41)),
                        child: Center(
                            child: Text(
                          "Start Recording",
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 10),
                          ),
                        )),
                      ),
                    )
                  : _isRecordingPlay == false
                      ? InkWell(
                          onTap: () async {
                            file = await _cameraController.stopVideoRecording();
                            setState(() => _isRecording = false);
                            final route = MaterialPageRoute(
                              fullscreenDialog: true,
                              builder: (_) => VideoPage(filePath: file.path),
                            );
                            //Navigator.push(context, route);

                            setState(() {
                              _isRecordingPlay = true;
                            });
                          },
                          child: Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                color: Color(0xffFF0023)),
                            child: Center(
                                child: Text(
                              "Stop",
                              style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10),
                              ),
                            )),
                          ),
                        )
                      : InkWell(
                          onTap: () async {
                            final route = MaterialPageRoute(
                              fullscreenDialog: true,
                              builder: (_) => VideoPage(filePath: file.path),
                            );
                            Navigator.push(context, route);
                            setState((){
                              _isLoading = false;
                              _isRecordingPlay = false;
                              _isRecording = false;
                              _isRecordingStop = false;
                            });

                          },
                          child: Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                color: AppColors.primaryColor),
                            child: Center(
                                child: Text(
                              "Preview",
                              style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10),
                              ),
                            )),
                          ),
                        ),
        ],
      ),*/
        );
  }
}
