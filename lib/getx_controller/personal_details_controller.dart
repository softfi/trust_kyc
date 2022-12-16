import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:trust_money/api/apiClient.dart';
import 'package:trust_money/model/perosnal_details/get_personal_detail_response.dart';

import '../utils/sharedPreference.dart';

class PersonalDetailsController extends GetxController {
  Rx<TextEditingController> emailID = TextEditingController().obs;
  RxInt isVisible = 1.obs;
  RxInt a = 1.obs;
  RxString mobileNumber = "".obs;
  RxString mail = "".obs;
  RxString dob = "DD/MM/YYYY".obs;
  RxBool isChecked1 = false.obs;
  RxBool isChecked2 = false.obs;
  RxBool isPanSelected = false.obs;
  RxInt isCheckedInt1 = 0.obs;
  RxInt isCheckedInt2 = 0.obs;
  RxBool potentiallyExposedStatus = false.obs;
  RxBool activateFuture = false.obs;
  RxInt potentiallyExposedStatusInt = 0.obs;
  RxInt activateFutureInt = 0.obs;
  Rx<TextEditingController> firstName = TextEditingController().obs;
  Rx<TextEditingController> lastName = TextEditingController().obs;
  Rx<TextEditingController> panNumber = TextEditingController().obs;
  Rx<DateTime> currentStartDate =
      DateTime.now().subtract(Duration(days: 6574)).obs;

  @override
  void onInit() {
    getPersonalDetails();
    getPerferences();
    super.onInit();
  }

  void getPerferences() async {
    mail = await HelperFunctions.getEmailId();
  }

  void pickDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: currentStartDate.value,
        firstDate: DateTime(1900),
        lastDate: DateTime.now().subtract(Duration(days: 6574)));
    if (pickedDate != null && pickedDate != currentStartDate) {
      currentStartDate.value = pickedDate;
      dob.value = DateFormat('dd-MM-yyyy').format(pickedDate);
      print("dob " + dob.toString());
      HelperFunctions.saveDOB(dob.toString());
    }
  }

  void getPersonalDetails() async {
    var response = await APiProvider().personalDetail();
    if (response != null) {
      GetPersonalDetailModel modal = response;
      firstName.value.text = modal.firstname ?? "";
      lastName.value.text = modal.lastname ?? "";
      mobileNumber.value = modal.mobileNumber;
    }
  }

  void update_personal_details() {
    if (dob.value != "DD/MM/YYYY") {
      updateData();
    } else {
      Get.showSnackbar(GetSnackBar(
        messageText: Text(
          "Select date first",
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ));
    }
  }

  void updateData() async {
    Get.dialog(Center(
      child: CircularProgressIndicator(),
    ));
    var response = await APiProvider().updatePersonalDeatil();
    if (response != null) {
      Get.back();
      if (mail != "" && mail != null) {
        a.value = 2;
      } else {
        isVisible.value = 2;
      }
      Get.showSnackbar(GetSnackBar(
        messageText: Text(response.toString()),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.green,
      ));
    }
  }
}
