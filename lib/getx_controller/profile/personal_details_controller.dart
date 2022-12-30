import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:trust_money/api/apiClient.dart';
import 'package:trust_money/model/perosnal_details/get_personal_detail_response.dart';
import 'package:trust_money/model/perosnal_details/nominee_details_response.dart';
import '../../model/status_bar/progress_status_bar.dart';
import '../../utils/helper_widget/custom_snsckbar.dart';
import '../../utils/sharedPreference.dart';
import '../kra/kra_controller.dart';
import '../personal details controller/add_nominee_controller.dart';

class PersonalDetailsController extends GetxController {
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
  RxBool barLine = false.obs;
  RxBool tabVisible = true.obs;
  RxBool userIsLoggedIn = false.obs;
  RxBool isKYCPending = true.obs;
  var nomineeDetails = Rxn<NomineeDetailModel>();
  var tabController = Rxn<TabController>();
  Rx<TextEditingController> firstName = TextEditingController().obs;
  Rx<TextEditingController> lastName = TextEditingController().obs;
  Rx<TextEditingController> emailID = TextEditingController().obs;
  Rx<DateTime> currentStartDate =
      DateTime.now().subtract(const Duration(days: 6574)).obs;
  var modaltest = Rxn<GetPersonalDetailModel>();
  var barStatusModel = Rxn<StatusBarModel>();



  @override
  void onInit() {
    getKycStatus();
    getPersonalDetails();
    getPerferences();
    super.onInit();
  }

  getKycStatus() async {
    await HelperFunctions.getuserLoggedInSharedPreference().then((value) {
      userIsLoggedIn.value = value!;
    });
    var isKyc = await HelperFunctions.getUserKycCompleted();
    if (isKyc == true) {
      tabVisible.value = true;
      barLine.value = false;
      isKYCPending.value = false;
    }
  }

  getPersonalDetails() async {
    var response = await APiProvider().personalDetail();
    debugPrint(response.toString());
    if (response != null) {
      getStatusBar();
      //GetPersonalDetailModel modal = response;
      modaltest.value = response;
      debugPrint("=======0009089 $response");
      emailID.value.text = modaltest.value!.emailId.toString();
      checkProfileStatus.value = modaltest.value!.mothersMaidenName.toString();
      await HelperFunctions.saveFirstName(modaltest.value!.firstname.toString());
      await HelperFunctions.saveLastName(modaltest.value!.lastname.toString());
      debugPrint(firstName.value.text.toString());
      //dob.value = modal.dob.toUtc().toString().replaceRange(10, dob.toString().length + 1, "");
      dob.value = modaltest.value!.dob != null ? DateFormat('dd-MM-yyyy').format(modaltest.value!.dob):"DD-MM-YYYY";
    }
  }

  getNomineeDetails() async {
    var response = await APiProvider().nomineeDetail();
    debugPrint("Nominasdfasda" + response.toString());
    if (response != null) {
      nomineeDetails.value = response;
      debugPrint("Nominasdfasda" + nomineeDetails.value.toString());
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
      ShowCustomSnackBar().ErrorSnackBar("Select date first");
    }
  }

  validateDifferentAddress()async {
    AddNomineeController _addNomineeController = Get.put(AddNomineeController());
    final KRAController _kraController = Get.put(KRAController());
    if( _addNomineeController.selectedNomineeIndentitiy.value == null){
      ShowCustomSnackBar().ErrorSnackBar("Select Address Proof First");
    }else if(_kraController.addressline1.value.text.isEmpty){
      ShowCustomSnackBar().ErrorSnackBar("Enter Address line 1");
    }else if(_kraController.addressline2.value.text.isEmpty){
      ShowCustomSnackBar().ErrorSnackBar("Enter Address line 2");
    } else if(_kraController.pinCode.value.text .isEmpty){
      ShowCustomSnackBar().ErrorSnackBar("Select date first");
    } else if(_addNomineeController.selectedStateId.value == null){
      ShowCustomSnackBar().ErrorSnackBar("Select State first");
    } else if(_addNomineeController.cityList.value.isEmpty){
      ShowCustomSnackBar().ErrorSnackBar("Select City first");
    }else{
      updateData();
    }
  }

  Future<String> updateData() async {
    Get.dialog(const Center(
      child: CircularProgressIndicator(),
    ));
    var response = await APiProvider().updatePersonalDeatil();
    debugPrint("=======00090893asdsdadasd3333 $response");
    if (response != null) {
      getPersonalDetails();
      isVisible.value = 2;
      Get.back();
      ShowCustomSnackBar().SuccessSnackBar(response.toString());
    }
    return "done";
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
    }
  }

  void getStatusBar() async {
    var response = await APiProvider().getProgressBar();
    if (response != null) {
      barStatusModel.value = response;
      // ShowCustomSnackBar().SuccessSnackBar(barStatusModel.value!.message == 1 ? "Success" : "Failed");
    }
  }
}
