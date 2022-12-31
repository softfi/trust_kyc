import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/api/apiClient.dart';
import 'package:trust_money/getx_controller/profile/personal_details_controller.dart';
import 'package:trust_money/utils/colorsConstant.dart';
import 'package:trust_money/utils/styles.dart';
import '../../../../utils/helper_widget/custom_snsckbar.dart';
import '../../../../utils/images.dart';
import '../../../../utils/strings.dart';
import '../../../Congratulations/email_congratulations.dart';
import '../../../animated_screens/verified_animation.dart';

class EmailPANBottomSheet {
  static emailBottomSheet(BuildContext context, TextEditingController emailId) {
    emailId.clear();
    Get.bottomSheet(
        Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Text("Please provide your email id",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.white)),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    autovalidateMode: AutovalidateMode.always,
                    child: TextFormField(
                      validator: (input) =>
                          input!.isValidEmail() ? null : "Invalid email",
                      controller: emailId,
                      keyboardType: TextInputType.emailAddress,
                      autofocus: false,
                      style: ConstStyle.sourceSans,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: AppColors.borderColor,
                          width: 1,
                        )),
                        disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: AppColors.borderColor,
                          width: 1,
                        )),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.borderColor,
                            width: 1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.borderColor,
                            width: 1,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.borderColor,
                            width: 1,
                          ),
                        ),
                        labelStyle: TextStyle(
                            color: AppColors.textColor, letterSpacing: 4),
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Color(0xffC8C7CE)),
                        hintText: "Enter Email id",
                        contentPadding: EdgeInsets.only(left: 14.0, top: 0.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () async {
                      validateAndSendOtp(emailId.text);
                    },
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.white),
                      ),
                      child: Center(
                          child: Text(
                        "Submit",
                        style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500)),
                      )),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
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

  static onOtpAddedBottomSheet(BuildContext context, String email_id) {
    TextEditingController optController = TextEditingController();
    Get.bottomSheet(
        Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  InkWell(onTap: (){
                    Get.back();
                  },
                    child: RichText(
                      text: TextSpan(children: [
                        const TextSpan(
                            text:
                                "Enter the 4 to 6 digits, One Time Password sent on your Email ",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Colors.white)),
                        TextSpan(
                            text: "${email_id}  ",
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: AppColors.btnColor)),
                        const WidgetSpan(
                          child: Image(
                            image: AssetImage(
                              ConstantImage.edit,
                            ),
                            color: AppColors.btnColor,
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ]),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(width: 1, color: Colors.white),
                    ),
                    child: TextField(
                      controller: optController,
                      keyboardType: TextInputType.number,
                      autofocus: false,
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                            letterSpacing: 4,
                            color: Color(0xff22263D),
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                      ),
                      onChanged: (text) {
                        if (optController.text.length > 6) {
                          FocusScope.of(context).unfocus();
                        }
                      },
                      obscureText: true,
                      inputFormatters: [LengthLimitingTextInputFormatter(6)],
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(
                            color: AppColors.textColor, letterSpacing: 4),
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Color(0xffC8C7CE)),
                        hintText: "Enter Your OTP",
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: EdgeInsets.only(left: 14.0, top: 0.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Strings.not_get,
                        style: ConstStyle.sourceSans2,
                      ),
                      InkWell(
                        onTap: () async {
                          validateAndResendSendOtp(email_id);
                        },
                        child: Container(
                          height: 23,
                          width: 87,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: Colors.white),
                          child: Center(
                              child: Text(
                            "Resend OTP",
                            style: ConstStyle.quickStandSmall1,
                          )),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () async {
                      verifyKycEmailOTP(email_id, optController.text);
                    },
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.white)),
                      child: Center(
                          child: Text(
                        "Verify",
                        style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500)),
                      )),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
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

  static void validateAndSendOtp(String text) async {
    if (text.isNotEmpty) {
      bool isOk = text.isValidEmail();
      if (isOk) {
        var response = await APiProvider().SendKycEmailOtp(text, false);
        if (response != null) {
          Get.back();
          onOtpAddedBottomSheet(Get.context!, text);
        }
      } else {
        ShowCustomSnackBar().ErrorSnackBar("Enter a valid email");
      }
    } else {
      ShowCustomSnackBar().ErrorSnackBar("Enter email first");
    }
  }

  static void validateAndResendSendOtp(String email_id) async {
    if (email_id.isNotEmpty) {
      var response = await APiProvider().SendKycEmailOtp(email_id, true);
      if (response != null) {
        ShowCustomSnackBar().SuccessSnackBar(response.toString());
      }
    }
  }

  static void verifyKycEmailOTP(String email, String otp) async {
    PersonalDetailsController _personalDetailsController =
        Get.find<PersonalDetailsController>();
    if (otp.isNotEmpty) {
      var response = await APiProvider().verifyOtp(email, otp);
      if (response != null) {
        Get.back();
        _personalDetailsController.getPersonalDetails();
        _personalDetailsController.isShowing.value = 3;
        Get.to(const EmailComplete());
      }
    } else {
      ShowCustomSnackBar().SuccessSnackBar("Enter OTP first");
    }
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}'
            r'\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
