import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../api/apiClient.dart';
import '../../model/code_verification_response_data.dart';
import '../../utils/helper_widget/custom_snsckbar.dart';
import '../personal_details_controller.dart';

class IPVController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isRecordingPlay = false.obs;
  RxBool isRecordingStop = false.obs;
  RxString randumNumber1 = "".obs;
  RxString randumNumber2 = "".obs;
  RxString randumNumber3 = "".obs;
  RxString randumNumber4 = "".obs;
  RxBool isSelected = false.obs;
  var file = Rx<File?>(null);
  set file1(value) => file.value = value;
  get file1 => file.value;
  PersonalDetailsController _personalDetailsController =
      Get.put(PersonalDetailsController());

  var videoPlayerController = Rx<VideoPlayerController?>(null);

  set videoPlayController1(value) => videoPlayerController.value = value;

  get videoPlayController1 => videoPlayerController.value;
  var cameraController = Rx<CameraController?>(null);

  set cameraController1(value) => cameraController.value = value;

  get cameraController1 => cameraController.value;

  @override
  void onInit() {
    getIPVCode();
    initCamera();
    Future.delayed(const Duration(seconds: 15), () async {
      file.value = (await cameraController.value!.stopVideoRecording()) as File?;
      isLoading.value = false;
      isRecordingStop.value = false;
      isRecordingPlay.value = false;
    });
    super.onInit();
  }
  late VideoPlayerController videoPlayerController12;

  void dispose() {
    videoPlayerController12.dispose();
    videoPlayerController12.pause();
    super.dispose();
  }

  Future initVideoPlayerPerviview() async {
    videoPlayerController12 =
        VideoPlayerController.file(File(file.value!.path));
    await videoPlayerController12.initialize();
    await videoPlayerController12.play();
    await videoPlayerController12.setLooping(true);
  }

  initCamera() async {
    final cameras = await availableCameras();
    final front = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front);
    cameraController.value = CameraController(
      front,
      ResolutionPreset.low,
      imageFormatGroup: ImageFormatGroup.bgra8888,
    );
    await cameraController.value!.initialize();
    isLoading.value = true;
  }

  recordVideo() async {
    await cameraController.value!.prepareForVideoRecording();
    await cameraController.value!.startVideoRecording();
  }

  initVideoPlayer() async {
    videoPlayerController.value =
        VideoPlayerController.file(File(file.value!.path));
    await videoPlayerController.value!.initialize();
  }

  getIPVCode() async {
    var response = await APiProvider().getIPVCode();
    if (response != null) {
      CodeVerificationModel modal = response;
      randumNumber1.value = modal.randomNumber[0];
      randumNumber2.value = modal.randomNumber[0];
      randumNumber3.value = modal.randomNumber[0];
      randumNumber4.value = modal.randomNumber[0];
    }
  }

  void updateVideo(File file) async {
    debugPrint("=======xfile ${file}");
    // File? file = File(xFile);
    Get.dialog(const Center(
      child: CircularProgressIndicator(),
    ));
    var response = await APiProvider().uploadVideo(file);
    if (response != null) {
      Get.back();
      //updateData();
    } else {
      Get.back();
    }
    ShowCustomSnackBar().SuccessSnackBar(response.toString());
  }

  void updateData() async {
    Get.dialog(const Center(
      child: CircularProgressIndicator(),
    ));
    var response = await APiProvider().updatePersonalDeatil();
    if (response != null) {
      _personalDetailsController.getPersonalDetails();
      Get.back();
    }
    ShowCustomSnackBar().SuccessSnackBar(response.toString());
  }
}
