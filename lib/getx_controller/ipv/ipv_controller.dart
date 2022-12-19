import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../api/apiClient.dart';
import '../../model/code_verification_response_data.dart';

class IPVController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isRecordingPlay = false.obs;
  RxBool isRecordingStop = false.obs;
  RxString randumNumber1 = "".obs;
  RxString randumNumber2 = "".obs;
  RxString randumNumber3 = "".obs;
  RxString randumNumber4 = "".obs;
  RxBool isSelected = false.obs;

  @override
  void onInit() {
    getIPVCode();
    super.onInit();
  }

  // _initCamera() async {
  //   final cameras = await availableCameras();
  //   final front = cameras.firstWhere(
  //           (camera) => camera.lensDirection == CameraLensDirection.front);
  //   _cameraController = CameraController(
  //     front,
  //     ResolutionPreset.medium,
  //     imageFormatGroup: ImageFormatGroup.yuv420,
  //   );
  //   await _cameraController.initialize();
  //   isLoading.value = true;
  // }

  // _recordVideo() async {
  //   await _cameraController.prepareForVideoRecording();
  //   await _cameraController.startVideoRecording();
  //   setState(() => _isRecording = true);
  // }

  // Future _initVideoPlayer() async {
  //   _videoPlayerController = VideoPlayerController.file(File(file.path));
  //   await _videoPlayerController.initialize();
  // }

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
}
