import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../api/apiClient.dart';
import '../../../model/get_pan_response_data.dart';
import '../../../screens/Congratulations/verify_pan_congratulations.dart';
import '../../../screens/animated_screens/verified_animation.dart';
import '../../../screens/kyc/profile/digilocker/digilocker_page.dart';
import '../../../screens/kyc/profile/personal_detals/my_personal_details.dart';
import '../../../utils/colorsConstant.dart';
import '../../../utils/images.dart';
import '../../../utils/sharedPreference.dart';
import '../../personal_details_controller.dart';

class PanCardUserDeatils extends GetxController {
  PanStatusModel? panDataModal;
  RxString panName = "".obs;
  Rx<TextEditingController> panNumber = TextEditingController().obs;

  verifyPan() async {
    Get.dialog(VerifiedAnim(
      image: "assets/images/loding.mp4",
      onClick: () {},
      title: "We Are Verifying \nYour PAN",
      subTitle: "We are validating your ID and Username with the authorities, this may take some time.",
    ));
    var response = await APiProvider().verfiyPanNumber(panNumber.value.text);
    if (response != null) {
      Get.back();
      PanStatusModel modal = response;
      panDataModal = response;
      panName.value = "${modal..panFname} ${modal..panMname} ${modal..panLname}";
      if (modal.panStatus == "E") {
        Get.to(PANVerified(onClick: () {
          Get.to(Digilocker());
          //_personalDetailsController.isVisible.value = 3;
          // Get.back();
        }));
      } else if (modal.panStatus == "X") {
        bottomSheet("DEACTIVATED");
      } else if (modal.panStatus == "I") {
        bottomSheet("INOPERATIVE");
      } else if (modal.panStatus == "N" ||
          modal.panStatus == "F" ||
          modal.panStatus == "ED" ||
          modal.panStatus == "D") {
        bottomSheet("INVALID");
      }
    }
  }

  void bottomSheet(String msg,) {
    Get.bottomSheet(
        Wrap(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  ConstantImage.card,
                  width: 75,
                  height: 75,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("Hi, [$panName]",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Colors.white)),
                const SizedBox(
                  height: 15,
                ),
                const Text("Your PAN is",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Colors.white)),
                Text("$msg",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        letterSpacing: 2,
                        color: AppColors.btnColor)),
                const SizedBox(
                  height: 15,
                ),
                const Text("Please provide on valid \nPAN Number",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Colors.white)),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.white)),
                      child: Center(
                          child: Text(
                        "Wrong name? -Re-enter PAN number",
                        style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w400)),
                      )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ],
        ),
        enableDrag: false,
        backgroundColor: AppColors.textColor,
        isDismissible: false,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30))));
  }
}
