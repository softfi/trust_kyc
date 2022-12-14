import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trust_money/getx_controller/profile/personal_details_controller.dart';
import 'package:trust_money/utils/helper_widget/custom_snsckbar.dart';
import '../../api/apiClient.dart';
import '../../model/digiLocker_response_data.dart';
import '../../model/get_digilocker_response_data.dart';
import '../../model/profession_response_data.dart';

class KRAController extends GetxController {
  RxInt isVisible = 1.obs;
  RxBool isChecked = false.obs;
  RxBool isAddressAdd = false.obs;
  RxBool isRTR = false.obs;
  RxBool isUploadScansShow = true.obs;
  RxInt selectedNomonneeIdentificationId=0.obs;
  RxBool scansView = false.obs;
  RxBool isFrontImageClick = false.obs;
  RxBool isBackImageClick = false.obs;
  Rxn professionId = Rxn();
  RxString motherName = "".obs;
  RxString urlLink = "".obs;
  RxString fileName1 = "".obs;
  RxString fileName2 = "".obs;
  RxString adhaarNumber = "".obs;
  RxString adhaarAddress = "".obs;
  RxString frontImage = "".obs;
  RxString backImage = "".obs;
  RxInt isRTRInt = 0.obs;
  RxInt isGenderSelect = 0.obs;
  RxInt isMaritalSelect = 0.obs;
  RxInt isEnComeSelect = 0.obs;
  Rx<File> backImageFile=File("").obs, frontImageFile=File("").obs;
var digiLockerDetailModel = Rxn<DigiLockerDetailModel>();
  RxInt isExperienceSelect = 0.obs;
  Rx<TextEditingController> maidenName = TextEditingController().obs;
  Rx<TextEditingController> addressline1 = TextEditingController().obs;
  Rx<TextEditingController> addressline2 = TextEditingController().obs;
  Rx<TextEditingController> pinCode = TextEditingController().obs;
  Rxn selectedSate=Rxn();
  Rxn selectedCity=Rxn();
  PersonalDetailsController _personalDetailsController =
      Get.find<PersonalDetailsController>(); //list sa=[]
  RxList<ProfessionModel> professionList =
      List<ProfessionModel>.empty(growable: true).obs;
  RxList newProfessionalList = List.empty(growable: true).obs;

  @override
  void onInit() {
    getProfessionList();
    authenticatDigilocker();
    super.onInit();
  }

  void authenticatDigilocker() async {
    var response = await APiProvider().authenticateDigilocker();
    if (response != null) {
      DigiLockerModel model = response;
      urlLink.value = model.link.toString();
      debugPrint("urlLink444444=============>${urlLink.value.toString()}");
    }
  }

  void getDigilockerData() async {
    var response = await APiProvider().digilockerData();
    if (response != null) {
      DigiLockerDetailModel model = response;
      digiLockerDetailModel.value = response;
      _personalDetailsController.getPersonalDetails();
      debugPrint(model.toString());
      debugPrint("1235647777974521464779878645");
      adhaarNumber.value = model.aadharNumber;
      adhaarAddress.value = "${model.landmark ?? ""} ${model.location ??""} ${model.villageTownCity} ${model.district} ${model.state} ${model.pincode}";
      if (model.gender == "M") {
        isGenderSelect.value = 1;
      } else if (model.gender == "F") {
        isGenderSelect.value = 2;
      } else {
        isGenderSelect.value = 3;
      }
    }
  }

  void getProfessionList() async {
    var response = await APiProvider().getOccupationList();
    if (response != null) {
      professionList.value = response;
      professionList.value.forEach((element) {
        newProfessionalList.value.add(element.professionName);
      });
    }
  }

  void update_personal_details() {
    if (isGenderSelect.value == 0) {
      ShowCustomSnackBar().ErrorSnackBar("Select Your Gender");
    } else if (isMaritalSelect.value == 0) {
      ShowCustomSnackBar().ErrorSnackBar("Select Your Marital Status");
    } else if (isEnComeSelect == 0) {
      ShowCustomSnackBar().ErrorSnackBar("Select Your Annual Income");
    }else if(professionId.value ==null || professionId.value==""){
      ShowCustomSnackBar().ErrorSnackBar("Select occupation");
    }
    else if (professionId.value == null) {
      ShowCustomSnackBar().ErrorSnackBar("Enter Your Maiden Name");
    } else if (isExperienceSelect == 0) {
      ShowCustomSnackBar().ErrorSnackBar("Select Your Experience");
    } else if (maidenName.value.text.isEmpty) {
      ShowCustomSnackBar().ErrorSnackBar("Enter Your Maiden Name");
    } else {
      motherName.value = maidenName.value.text;
      updateData();
    }
  }

  void updateData() async {
    Get.dialog(const Center(
      child: CircularProgressIndicator(),
    ));
    var response = await APiProvider().updatePersonalDeatil();
    if (response != null) {
      _personalDetailsController.getPersonalDetails();
      _personalDetailsController.isVisible.value = 4;
      Get.back();
    }
    ShowCustomSnackBar().SuccessSnackBar(response.toString());
  }
}
