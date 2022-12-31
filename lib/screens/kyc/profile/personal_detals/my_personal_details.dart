import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/getx_controller/profile/personal_details_controller.dart';
import 'package:trust_money/screens/kyc/profile/digilocker/authenticate_adhaar.dart';
import 'package:trust_money/screens/kyc/profile/digilocker/kra_record.dart';
import 'package:trust_money/screens/kyc/profile/digilocker/show_adhaar_details.dart';
import 'package:trust_money/screens/kyc/profile/email_and_pan/email_and_pan_verification.dart';
import 'package:trust_money/screens/kyc/profile/ipv/ipv_verification.dart';
import 'package:trust_money/screens/kyc/profile/personal_detals/app_textfield.dart';
import 'package:trust_money/screens/kyc/profile/personal_detals/bottom_sheets.dart';
import 'package:trust_money/screens/kyc/profile/personal_detals/show_personal_details/show_personal_details.dart';
import 'package:trust_money/utils/colorsConstant.dart';
import 'package:trust_money/utils/strings.dart';
import 'package:trust_money/utils/styles.dart';
import '../../../../utils/helper_widget/custom_snsckbar.dart';

class MyPersonalDetails extends StatelessWidget {
  MyPersonalDetails({
    Key? key,
  }) : super(key: key);

  PersonalDetailsController _personalDetailsController =
      Get.find<PersonalDetailsController>();

  RxBool isButtonClick = false.obs;
  String dateOfBirth1 = "";

  @override
  Widget build(BuildContext context) {
    _personalDetailsController.onInit(); //ShowPersonalDetails
    return Obx(() => _personalDetailsController.isKYCPending.value
        ? Column(
            children: [
              Obx(() => Visibility(
                  visible: _personalDetailsController.isVisible.value == 1,
                  child: personaDetail(context))),
              // child: IPVVerification())),
              Obx(() => Visibility(
                  visible: _personalDetailsController.isVisible.value == 2,
                  child: EmailVeryfication())),
              Obx(() => Visibility(
                  visible: _personalDetailsController.isVisible.value == 3,
                  child: KRARecord())),
              Obx(() => Visibility(
                  visible: _personalDetailsController.isVisible.value == 4,
                  child: IPVVerification())),
              Obx(() => Visibility(
                  visible: _personalDetailsController.isVisible.value == 5,
                  child: AuthenticateAdhaar())),
              Obx(() => Visibility(
                  visible: _personalDetailsController.isVisible.value == 6,
                  child: ShowAdhaarDetails())),
            ],
          )
        : Visibility(child: ShowPersonalDetails()));
    // : ShowPersonalDetails();
  }

  Widget personaDetail(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xffF7F7FA).withOpacity(0.35),
                border: Border.all(width: 1.2, color: const Color(0xffbcbcbc))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      Text(
                        "Personal Details",
                        style: ConstStyle.quickMedium,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          "STEP 1 of 2",
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: Color(0xffFF405A),
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 0.7,
                  indent: 5,
                  endIndent: 5,
                ),
                _space,
                AppText(
                  title: 'First Name* ',
                ),
                _space1,
                AppTextField(
                  textCapitalization: TextCapitalization.words,
                  hint: '',
                  controller: _personalDetailsController.firstName.value,
                  lengthFormater: LengthLimitingTextInputFormatter(36),
                  textInputType: TextInputType.text,
                ),
                _space,
                AppText(
                  title: 'Last Name* ',
                ),
                _space1,
                AppTextField(
                  textCapitalization: TextCapitalization.words,
                  hint: '',
                  controller: _personalDetailsController.lastName.value,
                  lengthFormater: LengthLimitingTextInputFormatter(36),
                  textInputType: TextInputType.text,
                ),
                _space,
                AppText(
                  title: 'Mobile Name* ',
                ),
                _space1,
                TextContainer(
                  titleText:
                      ' +91 ${_personalDetailsController.mobileNumber.toString()}',
                  perfixIcon: Image.asset(
                    "assets/images/india.png",
                    scale: 4,
                  ),
                  postfixIcon: Image.asset(
                    "assets/images/done1.png",
                    color: Colors.green,
                    scale: 6,
                  ),
                  color: Color(0xffF7F7FA),
                ),
                _space,
                AppText(
                  title: 'Date of Birth - Should be as per Aadhar',
                ),
                _space1,
                InkWell(
                  onTap: () {
                    _personalDetailsController.pickDate();
                  },
                  child: Obx(() => TextContainer(
                        color: Colors.white,
                        titleText: _personalDetailsController.dob.value,
                        perfixIcon: Container(),
                        postfixIcon: Image.asset(
                          "assets/images/calender.png",
                          width: 25,
                          height: 25,
                        ),
                      )),
                ),
                _space,
                _space,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Are You Politically Exposed",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                            color: Color(0xff22263D),
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                    ),
                    Obx(() => Stack(
                          children: [
                            CustomSwitch(
                              activeColor: Colors.green,
                              value: _personalDetailsController
                                  .potentiallyExposedStatus.value,
                              onChanged: (value) {
                                _personalDetailsController
                                    .potentiallyExposedStatusInt.value = 0;
                                debugPrint(_personalDetailsController
                                    .potentiallyExposedStatus.value
                                    .toString());
                                PersonalBottomSheet.closeApplicationBottomSheet(
                                    context);
                              },
                            ),
                            InkWell(
                              onTap: () {
                                PersonalBottomSheet.closeApplicationBottomSheet(
                                    context);
                              },
                              child: Container(
                                height: 40,
                                width: 70,
                              ),
                            )
                          ],
                        )),
                  ],
                ),
                _space,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: Text(
                        Strings.active_check,
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: Color(0xff22263D),
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                      ),
                    ),
                    Obx(() => CustomSwitch(
                          activeColor: Colors.green,
                          value:
                              _personalDetailsController.activateFuture.value,
                          onChanged: (value) {
                            _personalDetailsController.activateFuture.value =
                                value;
                            if (value == true) {
                              _personalDetailsController
                                  .activateFutureInt.value = 1;
                            } else {
                              _personalDetailsController
                                  .activateFutureInt.value = 0;
                            }
                          },
                        )),
                  ],
                ),
                _space,
                _space,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: Obx(() => Checkbox(
                            checkColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            activeColor: AppColors.primaryColor,
                            value: _personalDetailsController.isChecked1.value,
                            onChanged: (bool? value) {
                              _personalDetailsController.isChecked1.value =
                                  value!;
                              if (value == true) {
                                _personalDetailsController.isCheckedInt1.value =
                                    1;
                              } else {
                                _personalDetailsController.isCheckedInt1.value =
                                    0;
                              }
                            },
                          )),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: Text(
                            "I understand and agree to allow Trust Money to share my data with its group companies.",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                  color: Color(0xff22263D),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                            )),
                      ),
                    ),
                  ],
                ),
                _space,
                Row(
                  children: [
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: Obx(() => Checkbox(
                            checkColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            activeColor: AppColors.primaryColor,
                            value: _personalDetailsController.isChecked2.value,
                            onChanged: (bool? value) {
                              _personalDetailsController.isChecked2.value =
                                  value!;
                              if (value == true) {
                                _personalDetailsController.isCheckedInt2.value =
                                    1;
                              } else {
                                _personalDetailsController.isCheckedInt2.value =
                                    0;
                              }
                            },
                          )),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: Text(
                            "I understand and agree to allow Trust Money to share my data with companies mandated by the Govt.",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                  color: Color(0xff22263D),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                            )),
                      ),
                    ),
                  ],
                ),
                _space,
                _space,
                Obx(() => InkWell(
                      onTap: () {
                        if (_personalDetailsController.isCheckedInt1.value !=
                                0 &&
                            _personalDetailsController.isCheckedInt2.value !=
                                0) {
                          isButtonClick.value = true;
                          _personalDetailsController.update_personal_details();
                        } else {
                          ShowCustomSnackBar().ErrorSnackBar(
                              "Accept all terms and conditions first");
                        }
                      },
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x29000000),
                              blurRadius: 4.0,
                            ),
                          ],
                          border: Border.all(
                              width: 2,
                              color: isButtonClick.value == false
                                  ? (_personalDetailsController
                                                  .isCheckedInt1.value !=
                                              0 &&
                                          _personalDetailsController
                                                  .isCheckedInt2.value !=
                                              0)
                                      ? AppColors.textColor
                                      : Color(0xffE1E0E6)
                                  : Color(0xffFF405A)),
                          color: isButtonClick.value == false
                              ? Colors.white
                              : Color(0xffFF405A),
                        ),
                        child: Center(
                            child: Text(
                          "Continue",
                          style: GoogleFonts.quicksand(
                            textStyle: TextStyle(
                                color: isButtonClick.value == false
                                    ? (_personalDetailsController
                                                    .isCheckedInt1.value !=
                                                0 &&
                                            _personalDetailsController
                                                    .isCheckedInt2.value !=
                                                0)
                                        ? AppColors.textColor
                                        : Color(0xffE1E0E6)
                                    : Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          ),
                        )),
                      ),
                    )),
                _space,
                InkWell(
                  onTap: () {
                    _personalDetailsController.updateStatus.value = "1";
                    PersonalBottomSheet.saveAndCompleteBottomSheet();
                  },
                  child: Center(
                    child: Text(
                      "Save & Complete Later",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                            color: Color(0xff22263D),
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget get _space => const SizedBox(height: 16);

  Widget get _space1 => const SizedBox(height: 5);
}
