import 'package:camera/camera.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/getx_controller/ipv/ipv_controller.dart';
import 'package:trust_money/screens/animated_screens/vedio_page.dart';
import 'package:video_player/video_player.dart';

import '../../../../getx_controller/personal_details_controller.dart';
import '../../../../utils/colorsConstant.dart';
import '../../../../utils/images.dart';
import '../../../../utils/strings.dart';
import '../../../../utils/styles.dart';
import '../personal_detals/app_textfield.dart';

class IPVVerification extends StatelessWidget {
  IPVVerification({Key? key}) : super(key: key);
  PersonalDetailsController _personalDetailsController =
      Get.put(PersonalDetailsController());
  IPVController _ipvController = Get.put(IPVController());

  RxBool isButtonClick = false.obs;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _personalDetailsController.isVisible.value = 2;
        return false;
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          padding: const EdgeInsets.all(12),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: const Color(0xffF7F7FA).withOpacity(0.35),
              border: Border.all(width: 1.2, color: const Color(0xffbcbcbc))),
          child: Column(
            children: [
              ipvWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget ipvWidget(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            Text(
              "Personal Details",
              style: ConstStyle.quickMedium,
            ),
            const SizedBox(
              width: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                "STEP 2 of 2",
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                      color: Color(0xffFF405A),
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
      const Divider(
        thickness: 0.7,
        indent: 5,
        endIndent: 5,
      ),
      _space,
      Text(
        Strings.identity,
        style: GoogleFonts.quicksand(
          textStyle: const TextStyle(
              color: Color(0xff22263D),
              fontWeight: FontWeight.w500,
              fontSize: 20),
        ),
      ),
      _space,
      Text(
        Strings.identity_text,
        style: GoogleFonts.sourceSansPro(
          textStyle: const TextStyle(
              color: Color(0xff22263D),
              fontWeight: FontWeight.w500,
              fontSize: 15),
        ),
      ),
      _space,
      Text(
        Strings.note,
        textAlign: TextAlign.center,
        style: GoogleFonts.sourceSansPro(
          textStyle: const TextStyle(
              color: Color(0xffFF405A),
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
              fontSize: 12),
        ),
      ),
      _space,
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Center(
          child: Obx(() => Container(
                height: 250,
                width: 340,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 3,
                      color: _ipvController.isLoading.value == true
                          ? const Color(0xff66DC65)
                          : AppColors.primaryColor),
                ),
                child: _ipvController.isLoading.value == false
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: SvgPicture.asset(
                            ConstantImage.profile_pic,
                          ),
                        ),
                      )
                    : _ipvController.isRecordingPlay.value == true
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: CameraPreview(
                                _ipvController.cameraController.value!),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Stack(
                              children: [
                                FutureBuilder(
                                  future: _ipvController.initVideoPlayer(),
                                  builder: (context, state) {
                                    if (state.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    } else {
                                      return VideoPlayer(_ipvController
                                          .videoPlayerController.value!);
                                    }
                                  },
                                ),
                                Positioned(
                                  top: 105,
                                  left: 150,
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
                          ),
                /*  child: _ipvController.isLoading.value
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: SvgPicture.asset(
                          ConstantImage.profile_pic,
                        ),
                      ),
                    )
                  : _ipvController.isRecordingPlay.value
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: CameraPreview(_ipvController.cameraController.value!),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Stack(
                            children: [
                              FutureBuilder(
                                future: _ipvController.initVideoPlayer(),
                                builder: (context, state) {
                                  if (state.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  } else {
                                    return VideoPlayer(_ipvController
                                        .videoPlayerController.value!);
                                  }
                                },
                              ),
                              Positioned(
                                top: 105,
                                left: 150,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(width: 0.5, color: Colors.white),
                                    borderRadius: BorderRadius.circular(35),
                                    color: Color(0xffffffff).withOpacity(0.20),
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
                        )*/
              )),
        ),
      ),
      _space,
      Obx(
        () => _ipvController.isLoading.value == false
            ? GestureDetector(
                onTap: () {
                  debugPrint("========5463 ${_ipvController.isLoading.value}");
                  _ipvController.isLoading.value = true;
                  _ipvController.isRecordingStop.value == false;
                  debugPrint("========5463 ${_ipvController.isLoading.value}");
                },
                child: Center(
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
                ),
              )
            : _ipvController.isRecordingStop.value == false
                ? InkWell(
                    onTap: () async {
                      _ipvController.isRecordingStop.value = true;
                      _ipvController.isRecordingPlay.value == false;
                      isButtonClick.value = true;
                      // _ipvController.isLoading.value = false;
                      //  debugPrint("========5463 ${_ipvController.isLoading.value}");
                      // _ipvController.recordVideo();
                      // Future.delayed(Duration(seconds: 15), () async {
                      //   _ipvController.isRecordingPlay.value = true;
                      //   _ipvController.file.value ==
                      //       await _ipvController.cameraController.value!
                      //           .stopVideoRecording();
                      // });
                    },
                    child: Center(
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
                    ),
                  )
                : _ipvController.isRecordingPlay.value == false
                    ? InkWell(
                        onTap: () async {
                          _ipvController.isRecordingPlay.value = true;
                          // _ipvController.file.value ==
                          //     await _ipvController.cameraController.value!
                          //         .stopVideoRecording();
                          // _ipvController.isRecordingPlay.value = true;
                        },
                        child: Center(
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
                        ),
                      )
                    : InkWell(
                        onTap: () async{
                          final route = MaterialPageRoute(
                            fullscreenDialog: true,
                            builder: (_) =>
                                VideoPage(filePath:  _ipvController.file.value!.path),
                          );
                          await Navigator.push(context, route);
                        },
                        child: Center(
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
                      ),

        /*_ipvController.isLoading.value == false
              ? GestureDetector(
                  onTap: () {
                    debugPrint(
                        "========5463 ${_ipvController.isLoading.value}");
                    _ipvController.isLoading.value = true;
                    _ipvController.isRecordingStop.value == true;
                    debugPrint(
                        "========5463 ${_ipvController.isLoading.value}");
                  },
                  child: Center(
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
                  ),
                )
              : _ipvController.isRecordingStop.value == false
                  ? InkWell(
                      onTap: () async {
                        _ipvController.isRecordingStop.value = true;
                        _ipvController.isRecordingPlay.value = true;
                        isButtonClick.value = true;
                        // _ipvController.isLoading.value = false;
                        //  debugPrint("========5463 ${_ipvController.isLoading.value}");
                        // _ipvController.recordVideo();
                        // Future.delayed(Duration(seconds: 15), () async {
                        //   _ipvController.isRecordingPlay.value = true;
                        //   _ipvController.file.value ==
                        //       await _ipvController.cameraController.value!
                        //           .stopVideoRecording();
                        // });
                      },
                      child: Center(
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
                      ),
                    )
                  : _ipvController.isRecordingPlay.value == false
                      ? InkWell(
                          onTap: () async {
                            _ipvController.isRecordingPlay.value = true;
                            // _ipvController.file.value ==
                            //     await _ipvController.cameraController.value!
                            //         .stopVideoRecording();
                            // _ipvController.isRecordingPlay.value = true;
                          },
                          child: Center(
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
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            Get.to(VideoPage(
                                filePath: _ipvController.file.value!.path));
                          },
                          child: Center(
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
                        )*/
      ),
      _space,
      _space,
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 60,
            width: 50,
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                color: Color(0x0000001A),
                blurRadius: 8.0,
              ),
            ], borderRadius: BorderRadius.circular(5), color: Colors.white),
            child: Center(
                child: Text(
              "${_ipvController.randumNumber1}",
              style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 25),
              ),
            )),
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            height: 60,
            width: 50,
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                color: Color(0x0000001A),
                blurRadius: 8.0,
              ),
            ], borderRadius: BorderRadius.circular(5), color: Colors.white),
            child: Center(
                child: Text(
              "${_ipvController.randumNumber2}",
              style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 25),
              ),
            )),
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            height: 60,
            width: 50,
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                color: Color(0x0000001A),
                blurRadius: 8.0,
              ),
            ], borderRadius: BorderRadius.circular(5), color: Colors.white),
            child: Center(
                child: Text(
              "${_ipvController.randumNumber3}",
              style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 25),
              ),
            )),
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            height: 60,
            width: 50,
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                color: Color(0x0000001A),
                blurRadius: 8.0,
              ),
            ], borderRadius: BorderRadius.circular(5), color: Colors.white),
            child: Center(
                child: Text(
              "${_ipvController.randumNumber4}",
              style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 25),
              ),
            )),
          ),
        ],
      ),
      _space,
      _space,
      RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          const TextSpan(
              text: Strings.authinstructions,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff22263D))),
          TextSpan(
            text: "see example",
            style: const TextStyle(
                fontSize: 14,
                decoration: TextDecoration.underline,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                color: Color(0xffFF405A)),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                hintBottomSheet();
              },
          ),
        ]),
      ),
      _space,
      _space1,
      Center(
        child: Text(
          Strings.tips,
          textAlign: TextAlign.center,
          style: GoogleFonts.sourceSansPro(
            textStyle: const TextStyle(
                color: Color(0xff22263D),
                fontWeight: FontWeight.w500,
                fontSize: 15),
          ),
        ),
      ),
      _space,
      _space1,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              SvgPicture.asset(
                ConstantImage.bulb,
                height: 40,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                Strings.good_light,
                style: GoogleFonts.sourceSansPro(
                  textStyle: const TextStyle(
                      color: Color(0xff22263D),
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              SvgPicture.asset(
                ConstantImage.webcam,
                height: 40,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                Strings.look,
                textAlign: TextAlign.center,
                style: GoogleFonts.sourceSansPro(
                  textStyle: const TextStyle(
                      color: Color(0xff22263D),
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                ConstantImage.sunglasses,
                height: 40,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                Strings.Sungalses,
                textAlign: TextAlign.center,
                style: GoogleFonts.sourceSansPro(
                  textStyle: const TextStyle(
                      color: Color(0xffff405A),
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                ConstantImage.cap,
                height: 40,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                Strings.Caps,
                textAlign: TextAlign.center,
                style: GoogleFonts.sourceSansPro(
                  textStyle: const TextStyle(
                      color: Color(0xffff405A),
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              )
            ],
          )
        ],
      ),
      _space,
      _space,
      InkWell(
        onTap: () {
          isButtonClick.value = true;
        },
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Color(0x29000000),
                blurRadius: 4.0,
              ),
            ],
            border: Border.all(
                width: 2,
                color: isButtonClick.value == false
                    ? AppColors.textColor
                    : const Color(0xffE1E0E6)),
            color:
                isButtonClick.value == false ? Colors.white : Color(0xffFF405A),
          ),
          child: Center(
              child: Text(
            "Continue",
            style: GoogleFonts.quicksand(
              textStyle: const TextStyle(
                  color: Color(0xff22263D),
                  fontWeight: FontWeight.w500,
                  fontSize: 15),
            ),
          )),
        ),
      ),
      _space1,
      _space1,
      Center(
        child: Text(
          "Save & Complete Later",
          style: GoogleFonts.sourceSansPro(
            textStyle: const TextStyle(
                color: Color(0xff22263D),
                fontWeight: FontWeight.w500,
                fontSize: 15),
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
    ]);
  }

  Widget get _space => const SizedBox(height: 16);

  Widget get _space1 => const SizedBox(height: 5);

  void hintBottomSheet() {
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
                  Text(
                    "Code Position Examples",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SvgPicture.asset(
                    ConstantImage.example,
                    height: 200,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1.5, color: Colors.white)),
                      child: Center(
                          child: Text(
                        "Close",
                        style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500)),
                      )),
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