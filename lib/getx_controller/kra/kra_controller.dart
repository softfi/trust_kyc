import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../api/apiClient.dart';
import '../../model/digiLocker_response_data.dart';
import '../../model/get_digilocker_response_data.dart';
import '../../model/profession_response_data.dart';

class KRAController extends GetxController {
  RxInt isVisible = 1.obs;
  RxString urlLink = "".obs;
  RxBool isChecked = false.obs;
  RxBool isRTR = false.obs;
  RxBool isSelected = false.obs;
  RxInt isRTRInt = 0.obs;
  RxInt isGenderSelect = 0.obs;
  RxInt isMaritalSelect = 0.obs;
  RxInt isEnComeSelect = 0.obs;
  RxInt isExperienceSelect = 0.obs;
  var _selectedChip = 0.obs;

  get selectedChip => this._selectedChip.value;

  set selectedChip(index) => this._selectedChip.value = index;
  var maidenName = TextEditingController();
  DigiLockerDetailModel? digiLockerDetailModel;

  RxList<ProfessionModel> professionList = List<ProfessionModel>.empty(growable: true).obs;

  @override
  void onInit() {
    authenticatDigilocker();
    getProfessionList();
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
      if (digiLockerModel.gender == "M") {
        isGenderSelect.value = 1;
      } else if (digiLockerModel.gender == "F") {
        isGenderSelect.value = 2;
      } else {
        isGenderSelect.value = 3;
      }
    }
  }

  void getProfessionList() async {
    debugPrint("firstName.value.text.toString()");
    Get.dialog(const Center(
      child: CircularProgressIndicator(),
    ));
    var response = await APiProvider().getOccupationList();
    debugPrint(response.toString());
    if (response != null) {
      debugPrint("==========776 ${response}");
      professionList.value = response;
      Get.back();
    }
  }
}
