

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../api/apiClient.dart';
import '../../model/digiLocker_response_data.dart';
import '../../model/get_digilocker_response_data.dart';

class KRAController extends GetxController {
  RxInt isVisible = 1.obs;
  RxString urlLink = "".obs;
  RxBool isChecked = false.obs;
  RxBool isRTR = false.obs;
  RxBool isSelected = false.obs;
  RxInt isRTRInt = 0.obs;
  RxBool isGenderSelect = false.obs;
  RxBool isMaritalSelect = false.obs;
  RxBool isEnComeSelect = false.obs;
  RxBool isExperienceSelect = false.obs;
  var maidenName = TextEditingController();
  DigiLockerDetailModel? digiLockerDetailModel;

  @override
  void onInit() {
    authenticatDigilocker();
    super.onInit();
  }

  void authenticatDigilocker() async {
    var response = await APiProvider().authenticateDigilocker();
    if (response != null) {
      DigiLockerModel digiLockerModel = response;
      urlLink.value = digiLockerModel.link;
      getDigilockerData();
      debugPrint("======== ${urlLink.value}");
    }
  }

  void getDigilockerData() async {
    var response = await APiProvider().digilockerData();
    if (response != null) {
      DigiLockerDetailModel digiLockerModel = response;
      digiLockerDetailModel = response;
    }
  }



}