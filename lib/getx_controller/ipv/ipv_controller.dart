import 'dart:io';

import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

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
  var file =  Rxn<File>();

  // var file = Rx<File>;
 // late VideoPlayerController _videoPlayerController;
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
    super.onInit();
  }

  initCamera() async {
    final cameras = await availableCameras();
    final front = cameras.firstWhere(
            (camera) => camera.lensDirection == CameraLensDirection.front);
    cameraController.value = CameraController(
      front,
      ResolutionPreset.medium,
      imageFormatGroup: ImageFormatGroup.yuv420,
    );
    await cameraController.value!.initialize();
    isLoading.value = true;
  }

  recordVideo() async {
    await cameraController.value!.prepareForVideoRecording();
    await cameraController.value!.startVideoRecording();
  }

  initVideoPlayer() async {
    videoPlayerController.value = VideoPlayerController.file(File(file.value!.path));
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
}
