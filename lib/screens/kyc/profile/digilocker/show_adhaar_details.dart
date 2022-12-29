import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/getx_controller/kra/kra_controller.dart';
import 'package:trust_money/getx_controller/profile/personal_details_controller.dart';
import 'package:trust_money/screens/kyc/profile/digilocker/diffrent_address.dart';
import 'package:trust_money/screens/kyc/profile/personal_detals/app_textfield.dart';

import '../../../../getx_controller/profile/add_nominee_controller.dart';
import '../../../../utils/colorsConstant.dart';
import '../../../../utils/styles.dart';

class ShowAdhaarDetails extends StatelessWidget {
  ShowAdhaarDetails({Key? key}) : super(key: key);
  final PersonalDetailsController _personalDetailsController =
      Get.put(PersonalDetailsController());
  final KRAController _kraController = Get.put(KRAController());

  RxBool isButtonClick = false.obs;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _personalDetailsController.isVisible.value = 5;
        return false;
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
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
              _space,
              Text(
                "Hey ${_personalDetailsController.modaltest.value!.panName ?? ""} Please Verify, We Fetched This Information From Pan And KRA Records, As Provided By You.",
                style: ConstStyle.quickMedium,
              ),
              _space,
              AppText(
                title: 'Aadhaar Number ',
              ),
              _space1,
             Obx(() => TextContainer(
                color: Color(0xffF7F7FA),
                titleText: _kraController.adhaarNumber.value ?? "",
                perfixIcon: Container(),
                postfixIcon: Image.asset(
                  "assets/images/done1.png",
                  color: Colors.green,
                  scale: 6,
                ),
              )),
              _space,
              AppText(
                title: 'Address (As per records in KRA)',
              ),
              _space1,
               Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1.1, color: AppColors.borderColor),
                  color: Color(0xffF7F7FA),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                  child: Obx(() =>Text(
                    _kraController.adhaarAddress.value,
                    style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                          color: Color(0xff22263D),
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          letterSpacing: 1),
                    ),
                  ),
                ),
              )),
              _space,
              _space,
              InkWell(
                onTap: () {
                  if (_kraController.isAddressAdd.value == false) {
                    _kraController.isAddressAdd.value = true;
                  } else {
                    _kraController.isAddressAdd.value = false;
                  }
                },
                child: Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: _kraController.isAddressAdd.value
                                ? Color(0xff22263D)
                                : Color(0xffC8C7CE),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "I wish to update my Address",
                          style: ConstStyle.sourceSans1,
                        ),
                      ],
                    )),
              ),
              _space,
              _space,
              Obx(() => Visibility(
                  visible: _kraController.isAddressAdd.value,
                  child: DifferentAddress())),
              _space,
              _space,
              InkWell(
                onTap: () {

                  _personalDetailsController.updateData().then((val){
                    debugPrint("donedone done doen");
                    isButtonClick.value = true;
                    _personalDetailsController.isVisible.value= 3;
                  });
                  // Get.to(()=>Digilocker());
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
                        "Continue",
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
              _space,
              _space1,
            ],
          ),
        ),
      ),
    );
  }

  Widget get _space => const SizedBox(height: 16);

  Widget get _space1 => const SizedBox(height: 5);
}
