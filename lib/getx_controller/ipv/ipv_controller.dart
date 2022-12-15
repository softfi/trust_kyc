import 'package:camera/camera.dart';
import 'package:get/get.dart';

class IPVController extends GetxController {

  RxBool isLoading = false.obs;
  RxBool isRecordingPlay = false.obs;
  RxBool isRecordingStop = false.obs;
  RxString randumNumber  ="".obs;
  RxBool isSelected = false.obs;

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

}
