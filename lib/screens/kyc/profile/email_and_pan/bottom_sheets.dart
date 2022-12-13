import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/utils/colorsConstant.dart';
import 'package:trust_money/utils/styles.dart';

import '../../../../utils/images.dart';
import '../../../../utils/strings.dart';

class EmailPANBottomSheet {
  static onEmailAddedBottomSheet(BuildContext context,
      TextEditingController email_id) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(35),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (context) =>
          Padding(
            padding: EdgeInsets.only(
                top: 0,
                right: 0,
                left: 0,
                bottom: MediaQuery
                    .of(context)
                    .viewInsets
                    .bottom),
            child: Wrap(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color: AppColors.primaryColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 45,
                          ),
                          const Text("Please provide your email id",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: Colors.white)),
                          SizedBox(
                            height: 25,
                          ),
                          Form(
                            autovalidateMode: AutovalidateMode.always,
                            child: TextFormField(
                              validator: (input) =>
                              input!.isValidEmail() ? null : "Invalid email",
                              controller: email_id,
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
                                    color: AppColors.textColor,
                                    letterSpacing: 4),
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    color: Color(0xff22263d), letterSpacing: 4),
                                hintText: "Enter Email id",
                                contentPadding:
                                EdgeInsets.only(left: 14.0, top: 0.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        child: InkWell(
                          onTap: () async {
                            Navigator.pop(context);
                            onOtpAddedBottomSheet(context, email_id);
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
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
    );
  }

  static onOtpAddedBottomSheet(BuildContext context,
      TextEditingController email_id) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(35),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (context) =>
          Padding(
            padding: EdgeInsets.only(
                top: 0,
                right: 0,
                left: 0,
                bottom: MediaQuery
                    .of(context)
                    .viewInsets
                    .bottom),
            child: Wrap(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color: AppColors.primaryColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 35,
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
                                  text: "${email_id.text}  ",
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
                         const SizedBox(height: 25,),
                          Container(
                            alignment: Alignment.center,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(width: 1, color: Colors.white),
                            ),
                            child: TextField(
                             // controller: otpdata,
                              keyboardType: TextInputType.number,
                              autofocus: false,
                              style: ConstStyle.sourceSans,
                              decoration: const InputDecoration(
                                labelStyle: TextStyle(
                                    color: AppColors.textColor,
                                    letterSpacing: 4),
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    color: Color(0xff22263d), letterSpacing: 4),
                                hintText: "******",
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding:
                                EdgeInsets.only(left: 14.0, top: 0.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 7,
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
                              // Navigator.pop(context);
                              // _resendOTPEmail(
                              //     mobNo.toString(), email_id.text.toString(),
                              //     true);
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
                     const SizedBox(height: 30,),
                      InkWell(
                        onTap: () async {
                          Navigator.pop(context);
                          // _verifyOTPEmail(
                          //     email_id.text.toString(),
                          //     otpdata.text.toString());
                          // mail = await HelperFunctions.getEmailId();
                        },
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: Colors.white)),
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
          ),
    );
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
