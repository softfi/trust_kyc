import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/api/apiClient.dart';
import 'package:trust_money/getx_controller/personal_details_controller.dart';
import 'package:trust_money/utils/colorsConstant.dart';
import 'package:trust_money/utils/styles.dart';
import '../../../../utils/images.dart';
import '../../../../utils/strings.dart';
import '../../../Congratulations/email_congratulations.dart';
import '../../../animated_screens/verified_animation.dart';

class EmailPANBottomSheet {
  static emailBottomSheet(BuildContext context, TextEditingController emailId) {
    Get.bottomSheet(
        Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
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
                    height: 30,
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
                        hintStyle: TextStyle(
                            color: Color(0xff22263D), letterSpacing: 4),
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
                  RichText(
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
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(
                            color: AppColors.textColor, letterSpacing: 4),
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                            color: Color(0xff22263d), letterSpacing: 4),
                        hintText: "******",
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
    debugPrint(text);
    if (text.isNotEmpty) {
      bool isOk = text.isValidEmail();
      if (isOk) {
        Get.dialog(Center(
          child: CircularProgressIndicator(),
        ));
        var response = await APiProvider().SendKycEmailOtp(text, false);
        if (response != null) {
          Get.back();
          Get.back();
          onOtpAddedBottomSheet(Get.context!, text);
        }
      } else {
        Get.showSnackbar(GetSnackBar(
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
          messageText: Text(
            "Enter a valid email",
            style: TextStyle(color: Colors.white),
          ),
        ));
      }
    } else {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
        messageText: Text(
          "Enter email first",
          style: TextStyle(color: Colors.white),
        ),
      ));
    }

    // show this  when otp is sent
  }

  static void validateAndResendSendOtp(String email_id) async {
    if (email_id.isNotEmpty) {
      Get.dialog(Center(
        child: CircularProgressIndicator(),
      ));
      var response = await APiProvider().SendKycEmailOtp(email_id, true);
      if (response != null) {
        Get.back();
        Get.showSnackbar(GetSnackBar(
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
          messageText: Text(
            response.toString(),
            style: TextStyle(color: Colors.white),
          ),
        ));
      }
    }
  }

  static void verifyKycEmailOTP(String email, String otp) async {
    PersonalDetailsController _personalDetailsController =
        Get.put(PersonalDetailsController());
    if (otp.isNotEmpty) {
      Get.dialog(VerifiedAnim(
        image: "assets/images/loding.mp4",
        onClick: () {},
        title: "We Are Verifying Your Email ID",
        subTitle: "We are validating your ID and Username with the service provider, this may take some time.",
      ));
      var response = await APiProvider().verifyOtp(email, otp);
      if (response != null) {
        Get.back();
        Get.back();
        _personalDetailsController.isShowing.value = 3;
        Get.to(const EmailComplete());
      }
    } else {
      Get.showSnackbar(const GetSnackBar(
        messageText: Text("Enter OTP first"),
      ));
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
