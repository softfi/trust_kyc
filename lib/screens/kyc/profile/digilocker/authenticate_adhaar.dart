import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/screens/kyc/profile/digilocker/digilocker_page.dart';

import '../../../../getx_controller/profile/personal_details_controller.dart';
import '../../../../utils/colorsConstant.dart';
import '../../../../utils/styles.dart';

class AuthenticateAdhaar extends StatelessWidget {
  AuthenticateAdhaar({Key? key}) : super(key: key);

  PersonalDetailsController _personalDetailsController =
      Get.find<PersonalDetailsController>();

  RxBool isButtonClick = false.obs;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _personalDetailsController.isVisible.value = 2;
        return false;
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          height: MediaQuery.of(context).size.height / 1.4,
          padding: const EdgeInsets.all(12),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color(0xffF7F7FA).withOpacity(0.35),
              border: Border.all(width: 1.2, color: const Color(0xffbcbcbc))),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4.0, vertical: 3),
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
              const SizedBox(
                height: 10,
              ),
              Text(
                "Hey ${_personalDetailsController.firstName.value.text}, Let’s Authenticate Your AADHAAR",
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                      color: Color(0xff22263D),
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
              ),
              _space,
              _space,
              InkWell(
                onTap: () {
                  isButtonClick.value = true;
                  //_personalDetailsController.isVisible.value= 6;
                   Get.to(()=>Digilocker());
                },
                child: Obx(() => Container(
                      height: 45,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x29000000),
                            blurRadius: 4.0,
                          ),
                        ],
                        border: Border.all(
                            width: 1.4,
                            color: isButtonClick.value == false
                                ? AppColors.textColor
                                : const Color(0xffE1E0E6)),
                        color: isButtonClick.value == false
                            ? Colors.white
                            : Color(0xffFF405A),
                      ),
                      child: Center(
                          child: Text(
                        "Authenticate Aadhaar",
                        style: GoogleFonts.quicksand(
                          textStyle: TextStyle(
                              color: isButtonClick.value == false
                                  ? AppColors.textColor
                                  : Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                      )),
                    )),
              ),
              // Obx(() => Visibility(
              //     visible: _personalDetailsController.isShowing.value == 3,
              //     child: panWidget(context))),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _space => const SizedBox(height: 16);

  Widget get _space1 => const SizedBox(height: 5);
}
