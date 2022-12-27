import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../../api/apiClient.dart';
import '../../model/code_verification_response_data.dart';
import '../../repositories/demat_repository.dart';
import '../../screens/Congratulations/profile_complete_congratulations.dart';
import '../../screens/animated_screens/verified_animation.dart';
import '../../utils/helper_widget/custom_snsckbar.dart';
import '../../utils/images.dart';
import '../auth/pan/pan_controller.dart';
import '../profile/personal_details_controller.dart';

class IPVController extends GetxController {
  var newCameraController = Rxn<CameraController>();
  RxInt isLoading = 1.obs;
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
  RxString fileLink = "".obs;
  PersonalDetailsController _personalDetailsController =
      Get.put(PersonalDetailsController());
  PanCardUserDeatils _panCardUserDeatils = Get.put(PanCardUserDeatils());
  var videoPlayerController = Rxn<VideoPlayerController>();

  set videoPlayController1(value) => videoPlayerController.value = value;

  get videoPlayController1 => videoPlayerController.value;

  // var cameraController = Rx<CameraController?>(null);
  // set cameraController1(value) => cameraController.value = value;
  // get cameraController1 => cameraController.value;

  @override
  void onInit() {
    initCamera();
    getIPVCode();
    Timer(Duration(seconds: 15), () {
      debugPrint("11111111111111111111111111111111111111");
    });
    // Future.delayed(const Duration(seconds: 15), () async {
    //   debugPrint("12121212121212121212121212121");
    //   file.value =
    //   await( cameraController.value!.stopVideoRecording()) as File?;
    //   isLoading.value = 1;
    //   isRecordingStop.value = false;
    //   isRecordingPlay.value = false;
    // });
    super.onInit();
  }

  late VideoPlayerController videoPlayerController12;

  void dispose() {
    newCameraController.value!.dispose();
    videoPlayerController12.dispose();
    videoPlayerController12.pause();
    super.dispose();
  }

  Future initVideoPlayerPreview() async {
    videoPlayerController12 =
        VideoPlayerController.file(File(file.value!.path));
    await videoPlayerController12.initialize();
    await videoPlayerController12.play();
    await videoPlayerController12.setLooping(true);
  }

  Future<String> initCamera() async {
    newCameraController.value = CameraController(
        const CameraDescription(
            name: "1",
            lensDirection: CameraLensDirection.front,
            sensorOrientation: 1),
        ResolutionPreset.low);
    newCameraController.value!.initialize().then((value) {});
    // final cameras = await availableCameras();
    // final front = cameras.firstWhere(
    //     (camera) => camera.lensDirection == CameraLensDirection.front);
    // cameraController.value = CameraController(
    //   front,
    //   ResolutionPreset.low,
    //   imageFormatGroup: ImageFormatGroup.bgra8888,
    // );
    // await cameraController.value!.initialize();
    // isLoading.value = 1;
    return "ikuii";
  }

  // recordVideo() async {
  //   await cameraController.value!.prepareForVideoRecording();
  //   await cameraController.value!.startVideoRecording();
  // }

  initVideoPlayer() async {
    videoPlayerController.value =
        VideoPlayerController.file(File(file.value!.path));
    await videoPlayerController.value!.initialize();
  }

  newInItVideoPlayer() async {
    videoPlayerController.value =
        VideoPlayerController.file(File(file.value!.path));
    await videoPlayerController.value!.initialize();
  }

  getIPVCode() async {
    var response = await APiProvider().getIPVCode();
    if (response != null) {
      CodeVerificationModel modal = response;
      randumNumber1.value = modal.randomNumber[0];
      randumNumber2.value = modal.randomNumber[1];
      randumNumber3.value = modal.randomNumber[2];
      randumNumber4.value = modal.randomNumber[3];
    }
  }

  // void updateVideo(File file) async {
  //   debugPrint("=======xfile ${file}");
  //   // File? file = File(xFile);
  //   Get.dialog(const Center(
  //     child: CircularProgressIndicator(),
  //   ));
  //   var response = await DematDetailRepository().uploadVideo(file);
  //   if (response != null) {
  //     updateData();
  //     Get.back();
  //   }
  //   //ShowCustomSnackBar().SuccessSnackBar(response.toString());
  // }

  void updateVideo(File file) async {
    debugPrint("=======xfile ${file}");
    Get.dialog(VerifiedAnim(
        title: "We Are Verifying Your Identity",
        subTitle:
            "We are validating your ID and Username with the authorities, this may take some time.",
        image: "assets/images/loding.mp4",
        onClick: () {}));
    var response = await DematDetailRepository().uploadVideo(file);
    debugPrint("fielssss $response");
    if (response != null) {
      Get.back();
      // UploadVideoModal model = response;
      // fileLink.value = model.video;
      fileLink.value = response;
      Get.to(() => CustomCongratulations(
                title:
                    'Congratulations! ${_personalDetailsController.modaltest.value!.panName} Identity Verification \ncompleted Successfully',
                image: ConstantImage.profile,
              ))!
          .then((value) {
        Future.delayed(const Duration(seconds: 4), () {
          _personalDetailsController.selectedIndex.value = 1;
        });
      });
      updateData();
      Get.back();
    }
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
