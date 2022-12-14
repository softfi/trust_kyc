import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/screens/kyc/profile/email_and_pan/bottom_sheets.dart';
import 'package:trust_money/utils/colorsConstant.dart';

import '../../../../getx_controller/auth/email/email_controller.dart';
import '../../../../getx_controller/personal_details_controller.dart';
import '../../../../utils/images.dart';
import '../../../../utils/styles.dart';

class EmailVerification extends StatelessWidget {
  EmailVerification({
    Key? key,
    this.onClick,
  }) : super(key: key);
  EmailController _emailController = Get.put(EmailController());
  PersonalDetailsController _personalDetailsController =
      Get.put(PersonalDetailsController());
  bool isPanSelected = false;
  final void Function()? onClick;
  final email_id = TextEditingController();
  final panNumber = TextEditingController();

  bool isButtonClick = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _personalDetailsController.isShowing.value = true;
        return false;
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color(0xffF7F7FA).withOpacity(0.35),
            border: Border.all(width: 1.2, color: const Color(0xffbcbcbc))),
        child: Column(
          children: [
            Obx(() => Visibility(
                  visible: _emailController.isEmailShowing.value,
                  child: emailWidget(context),
                )),
            Obx(() => Visibility(
                visible: !_emailController.isEmailShowing.value,
                child: verifiedEmail(context))),
            Obx(() => Visibility(
                visible: !_emailController.isEmailShowing.value,
                child: panWidget(context))),
            emailWidget(context),
          ],
        ),
      ),
    );
  }

  Widget emailWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
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
                Text(
                  "Hey Jairaj, Let’s Verify Your Email Id",
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                ),
                _space,
                _space,
                _space,
                Container(
                    height: 55,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x29000000),
                            blurRadius: 4.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          ConstantImage.google,
                          scale: 8,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Sign in with Google",
                          style: ConstStyle.sourceSans,
                        )
                      ],
                    )),
                _space,
                _space,
                Center(child: Text("Or", style: ConstStyle.quickMedium)),
                _space,
                _space,
                InkWell(
                  onTap: () {
                    _personalDetailsController.isShowing.value = false;
                    // EmailPANBottomSheet.onEmailAddedBottomSheet(
                    //     context, email_id);
                    //onEmailAddedBottomSheet();
                  },
                  child: Container(
                      height: 55,
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Color(0x29000000),
                          blurRadius: 6.0,
                        ),
                      ], color: AppColors.primaryColor),
                      child: Center(
                        child: Text(
                            "Would you like to use a different E-mail address",
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                color: Color(0xffFfffff),
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            )),
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.27,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget verifiedEmail(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hey jairaj, Congratulations! Your Email is Verified",
          style: ConstStyle.quickMedium,
        ),
        _space,
        Text("Email ID* ", style: ConstStyle.sourceSansPro),
        _space1,
        Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1.1, color: AppColors.borderColor),
                color: Color(0xffF7F7FA)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.70,
                    child: Text(
                      "dk@gmail.com",
                      overflow: TextOverflow.ellipsis,
                      style: ConstStyle.sourceSans5,
                    )),
                Image.asset(
                  "assets/images/done1.png",
                  color: Colors.green,
                  scale: 6,
                ),
              ],
            )),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.35,
        ),
        InkWell(
          onTap: () {
            isButtonClick = true;
            _personalDetailsController.isShowing.value = false;
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
                  color: isButtonClick == false
                      ? AppColors.textColor
                      : const Color(0xffE1E0E6)),
              color: isButtonClick == false ? Colors.white : Color(0xffFF405A),
            ),
            child: Center(
                child: Text(
              "Continue",
              style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                    color: Color(0xff22263D),
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              ),
            )),
          ),
        ),
        _space1,
        _space1,
        Center(
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
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget panWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hey Jairaj, Let’s Validate Your PAN ",
            style: ConstStyle.quickMedium,
          ),
          _space,
          Text("PAN Number* ", style: ConstStyle.sourceSansPro),
          _space1,
          Container(
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                  width: 1.1,
                  color:
                      isPanSelected ? AppColors.textColor : Color(0xffC8C7CE)),
            ),
            child: TextField(
              controller: panNumber,
              autofocus: false,
              style: ConstStyle.sourceSansmob,
              textCapitalization: TextCapitalization.characters,
              onChanged: (text) {
                if (panNumber.text.length < 10) {
                  isPanSelected = false;
                } else {
                  isPanSelected = true;
                }
              },
              inputFormatters: [
                LengthLimitingTextInputFormatter(10),
              ],
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  suffixIcon: Container(
                    width: 80,
                    color:
                        isPanSelected ? AppColors.textColor : Color(0xffC8C7CE),
                    child: Center(
                      child: Text("Verify",
                          style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500))),
                    ),
                  ),
                  hintText: "10 Digit PAN Number",
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                      color: isPanSelected
                          ? AppColors.textColor
                          : Color(0xffC8C7CE),
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      letterSpacing: 4),
                  fillColor: Colors.white,
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 7.0, top: 5.0)),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.40,
          ),
        ],
      ),
    );
  }

  Widget get _space => const SizedBox(height: 16);

  Widget get _space1 => const SizedBox(height: 5);
}
