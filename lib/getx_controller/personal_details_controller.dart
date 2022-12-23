import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:trust_money/api/apiClient.dart';
import 'package:trust_money/model/perosnal_details/get_personal_detail_response.dart';
import '../model/status_bar/progress_status_bar.dart';
import '../utils/sharedPreference.dart';

class PersonalDetailsController extends GetxController {
  Rx<TextEditingController> emailID = TextEditingController().obs;
  RxInt isVisible = 1.obs;
  RxInt isShowing = 1.obs;
  RxString mobileNumber = "".obs;
  RxString mail = "".obs;
  RxString updateStatus = "".obs;
  RxString checkProfileStatus = "".obs;
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
  RxInt selectedIndex = 0.obs;
  RxBool barLine = true.obs;
  RxBool tabVisible = false.obs;
  var tabController = Rxn<TabController>();
  Rx<TextEditingController> firstName = TextEditingController().obs;
  Rx<TextEditingController> lastName = TextEditingController().obs;

  Rx<DateTime> currentStartDate =
      DateTime.now().subtract(const Duration(days: 6574)).obs;
  var modaltest = Rxn<GetPersonalDetailModel>();

  //GetPersonalDetailModel? modaltest;
  var barStatusModel = Rxn<StatusBarModel>();

  @override
  void onInit() {
    getKycStatus();
    getPerferences();
    super.onInit();
  }

  getKycStatus() async {
    var isKyc = await HelperFunctions.getUserKycCompleted();
    if (isKyc == true) {
      tabVisible.value = true;
      barLine.value = false;
    }
  }

  getPersonalDetails() async {
    var response = await APiProvider().personalDetail();
    debugPrint(response.toString());
    if (response != null) {
      GetPersonalDetailModel modal = response;
      modaltest = response;
      await HelperFunctions.saveFirstName(
          response.body[modal.firstname].toString());
      await HelperFunctions.saveLastName(
          response.body[modal.lastname].toString());
      // firstName.value.text = modal.firstname;
      // lastName.value.text = modal.lastname;
      // mobileNumber.value = modal.mobileNumber;
      emailID.value.text = modal.emailId.toString();
      checkProfileStatus.value = modal.mothersMaidenName.toString();
      await HelperFunctions.saveFirstName(modal.firstname.toString());
      await HelperFunctions.saveLastName(modal.lastname.toString());
      debugPrint(firstName.value.text.toString());
      //dob.value = modal.dob.toUtc().toString().replaceRange(10, dob.toString().length + 1, "");
      dob.value = dob.value = DateFormat('dd-MM-yyyy').format(modal.dob);
    }
  }

  void getPerferences() async {
    mail.value = await HelperFunctions.getEmailId();
    firstName.value.text = await HelperFunctions.getFirstName();
    lastName.value.text = await HelperFunctions.getLastName();
    mobileNumber.value = await HelperFunctions.getPhoneNumber();
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
    }
    Get.showSnackbar(GetSnackBar(
      messageText: Text(response.toString()),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.green,
    ));
  }

// void updateStatusBar() async {
//   Get.dialog(const Center(
//     child: CircularProgressIndicator(),
//   ));
//   var response = await APiProvider().updateprogressbar(updateStatus.value);
//   if (response != null) {
//     Get.back();
//     Get.back();
//     ShowCustomSnackBar().SuccessSnackBar(response);
//   }
// }
//
// void getStatusBar() async {
//   var response = await APiProvider().getProgressBar();
//   if (response != null) {
//     barStatusModel.value = response;
//     ShowCustomSnackBar().SuccessSnackBar(barStatusModel.value!.message==1?"Success":"Failed");
//   }
// }
}
