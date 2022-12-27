import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../api/apiClient.dart';
import '../../utils/helper_widget/custom_snsckbar.dart';

class DematController extends GetxController {
  RxString imageURL = "".obs;
  RxBool citizen_OfThe_USA = false.obs;
  RxInt citizen_OfThe_USAInt = 0.obs;
  RxBool Country_Residency = true.obs;
  RxInt Country_ResidencyInt = 0.obs;
  RxBool isMandatory = true.obs;
  RxBool isAware = false.obs;
  RxInt isAwareInt = 0.obs;
  RxBool aceeptTerm = false.obs;
  RxInt aceeptTermInt = 0.obs;
  RxBool awareButtonClick = false.obs;

  void checkValidation(File signatureImage, String bornID,String wealthID) {
    if (signatureImage != null) {
      updateData(signatureImage,bornID,wealthID);
    } else {
      ShowCustomSnackBar().ErrorSnackBar("Select signature image first");
    }
  }

  void updateData(File signatureImage,String bornID,String wealthID) async {
    debugPrint("=======signatureImage $signatureImage");
    Get.dialog(const Center(child: CircularProgressIndicator()));
    var response = await APiProvider().uploadImage(signatureImage,bornID,wealthID);
    debugPrint("=======signatureImage1234 $response");
    if (response != null) {
      Get.back();
      imageURL.value = response;
    }
    ShowCustomSnackBar().SuccessSnackBar(response.toString());
  }

// void addNewDematAccount() async {
//   var response = await APiProvider().addDematAccount(
//       image: imageURL.value,
//       check_box_terms_selected: "",
//       check_box_account_statement_electronic: "",
//       wealth: '',
//       USAcitizen: "",
//       taxResidency: "null",
//       Bornregion: '');
//   debugPrint("=======00090893asdsdadasd3333 $response");
//   if (response != null) {
//     Get.back();
//     imageURL.value = response;
//   }
//   ShowCustomSnackBar().SuccessSnackBar(response.toString());
// }

}
