import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:trust_money/api/apiClient.dart';
import 'package:trust_money/model/perosnal_details/get_personal_detail_response.dart';

import '../utils/sharedPreference.dart';

class PersonalDetailsController extends GetxController {
  RxBool isShowing = true.obs;
  RxString mobileNumber = "".obs;
  RxString dob = "DD/MM/YYYY".obs;
  RxBool isChecked1 = false.obs;
  RxBool isChecked2 = false.obs;
  RxInt isCheckedInt1 = 0.obs;
  RxInt isCheckedInt2 = 0.obs;
  RxBool potentiallyExposedStatus = false.obs;
  RxBool activateFuture = false.obs;
  RxInt potentiallyExposedStatusInt = 0.obs;
  RxInt activateFutureInt = 0.obs;
  var firstName = TextEditingController();
  var lastName = TextEditingController();
  Rx<DateTime> currentStartDate = DateTime.now().obs;

  @override
  void onInit() {
    getPersonalDetails();
    super.onInit();
  }

  void pickDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: currentStartDate.value,
        firstDate: DateTime(1900),
        lastDate: DateTime.now());
    if (pickedDate != null && pickedDate != currentStartDate) {
      currentStartDate.value = pickedDate;
      dob = DateFormat('dd-MM-yyyy').format(pickedDate) as RxString;
      print("dob " + dob.toString());
      HelperFunctions.saveDOB(dob.toString());
    }
  }

  void getPersonalDetails() async {
    var response = await APiProvider().personalDetail();
    if (response != null) {
      GetPersonalDetailModel modal = response;
      firstName.text = modal.firstname ?? "";
      lastName.text = modal.lastname ?? "";
      mobileNumber.value = modal.mobileNumber;
    } else {
      Get.showSnackbar(const GetSnackBar(
        title: "Something went Wrong!",
      ));
    }
  }
}
