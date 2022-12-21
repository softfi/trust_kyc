import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:trust_money/api/apiClient.dart';
import 'package:trust_money/model/perosnal_details/get_personal_detail_response.dart';
import '../model/status_bar/progress_status_bar.dart';
import '../utils/helper_widget/custom_snsckbar.dart';
import '../utils/sharedPreference.dart';

class PersonalDetailsController extends GetxController {
  Rx<TextEditingController> emailID = TextEditingController().obs;
  RxInt isVisible = 1.obs;
  RxString mobileNumber = "".obs;
  RxString mail = "".obs;
  RxString updateStatus = "".obs;
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
      DateTime.now().subtract(const Duration(days: 6574)).obs;
  GetPersonalDetailModel? modaltest;
  var barStatusModel = Rxn<StatusBarModel>();

  @override
  void onInit() {
    getPersonalDetails();
    getStatusBar();
    getPerferences();
    super.onInit();
  }

  void getPersonalDetails() async {
    debugPrint("firstName.value.text.toString()");
    var response = await APiProvider().personalDetail();
    debugPrint(response.toString());
    if (response != null) {
      GetPersonalDetailModel modal = response;
      modaltest = response;
      firstName.value.text = modal.firstname;
      lastName.value.text = modal.lastname;
      mobileNumber.value = modal.mobileNumber;
      emailID.value.text = modal.emailId.toString();
      await HelperFunctions.saveFirstName(modal.firstname.toString());
      await HelperFunctions.saveLastName(modal.lastname.toString());
      debugPrint(firstName.value.text.toString());
      //dob.value = modal.dob.toUtc().toString().replaceRange(10, dob.toString().length + 1, "");
      dob.value = dob.value = DateFormat('dd-MM-yyyy').format(modal.dob);
      update();
    } else {
      Get.back();
    }
  }

  void getPerferences() async {
    mail.value = await HelperFunctions.getEmailId();
  }

  void pickDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: currentStartDate.value,
        firstDate: DateTime(1900),
        lastDate: DateTime.now().subtract(const Duration(days: 6574)));
    if (pickedDate != null && pickedDate != currentStartDate) {
      currentStartDate.value = pickedDate;
      dob.value = DateFormat('dd-MM-yyyy').format(pickedDate);
      print("dob " + dob.toString());
      HelperFunctions.saveDOB(dob.toString());
    }
  }

  void update_personal_details() {
    if (dob.value != "DD/MM/YYYY") {
      updateData();
    } else {
      Get.showSnackbar(const GetSnackBar(
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
    Get.dialog(const Center(
      child: CircularProgressIndicator(),
    ));
    var response = await APiProvider().updatePersonalDeatil();
    if (response != null) {
      getPersonalDetails();
      isVisible.value = 2;
      Get.back();
    } else {
      Get.back();
    }
    Get.showSnackbar(GetSnackBar(
      messageText: Text(response.toString()),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.green,
    ));
  }

  void updateStatusBar() async {
    Get.dialog(const Center(
      child: CircularProgressIndicator(),
    ));
    var response = await APiProvider().updateprogressbar(updateStatus.value);
    if (response != null) {
      Get.back();
      Get.back();
      ShowCustomSnackBar().SuccessSnackBar(response);
    } else {
      Get.back();
    }
  }

  void getStatusBar() async {
    Get.dialog(const Center(
      child: CircularProgressIndicator(),
    ));
    var response = await APiProvider().getProgressBar();
    if (response != null) {
      barStatusModel = response;
      ShowCustomSnackBar().SuccessSnackBar(response);
    } else {
      Get.back();
    }
  }
}
