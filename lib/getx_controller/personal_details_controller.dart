import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trust_money/api/apiClient.dart';
import 'package:trust_money/model/perosnal_details/get_personal_detail_response.dart';

class PersonalDetailsController extends GetxController {
  RxBool isShowing = true.obs;
  //GetPersonalDetailModel? modal;
  var firstName = TextEditingController();
  var lastName = TextEditingController();
  RxString mobileNumber = "".obs;

  @override
  void onInit() {
    getPersonalDetails();
    super.onInit();
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
