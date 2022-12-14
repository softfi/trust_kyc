import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/model/profession_response_data.dart';
import 'package:trust_money/screens/kyc/profile/digilocker/filterChip.dart';
import '../../../../getx_controller/auth/pan/pan_controller.dart';
import '../../../../getx_controller/kra/kra_controller.dart';
import '../../../../getx_controller/profile/personal_details_controller.dart';
import '../../../../utils/colorsConstant.dart';
import '../../../../utils/styles.dart';
import '../personal_detals/app_textfield.dart';
import '../personal_detals/bottom_sheets.dart';
import 'custom_dropdown.dart';


class KRARecord extends StatelessWidget {
  KRARecord({Key? key}) : super(key: key);
  PersonalDetailsController _personalDetailsController =
      Get.find<PersonalDetailsController>();
  KRAController _kRAController = Get.find<KRAController>();

  //PanCardUserDeatils _panCardUserDeatils = Get.put(PanCardUserDeatils());
  RxBool isButtonClick = false.obs;
  RxList<String> genderList = [
    "",
    "Male",
    "Female",
    "Trans.",
  ].obs;
  RxList<String> maritalList = [
    "",
    "Single",
    "Married",
    "others",
  ].obs;
  RxList<String> annualIncomeList = [
    "",
    "Below 1 Lakh",
    "1-5 Lakhs",
    "5-10 Lakhs",
    "10-25 Lakhs",
    "Above 25 Lakhs"
  ].obs;
  RxList<String> ExperienceList = [
    "",
    "Less than 1 Year",
    "1-2 Years",
    "2-5 Years",
    "5-10 Years",
    "10-20 Years",
    "20-25 Years",
    "Above 25 Years",
  ].obs;

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
          padding: const EdgeInsets.all(12),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color(0xffF7F7FA).withOpacity(0.35),
              border: Border.all(width: 1.2, color: const Color(0xffbcbcbc))),
          child: Column(
            children: [
              kraWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget kraWidget(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
        "Hey ${_personalDetailsController.modaltest.value!.panName ?? ""}, We Need Some Additional Information, It Won???t Take Long.",
        style: ConstStyle.quickMedium,
      ),
      _space,
      _space,
      AppText(
        title: 'What is your gender?',
      ),
      _space1,
      MyFilterChip(
        selectedIndex: _kRAController.isGenderSelect,
        //_kRAController.digiLockerDetailModel!.gender == "M" ? _kRAController.isGenderSelect = 1:_kRAController.isGenderSelect.value = 2,
        title: genderList,
      ),
      _space,
      AppText(
        title: 'What is your marital status?',
      ),
      _space1,
      MyFilterChip(
        selectedIndex: _kRAController.isMaritalSelect,
        title: maritalList,
      ),
      _space,
      AppText(
        title: 'What is your annual income?',
      ),
      _space1,
      MyFilterChip(
        selectedIndex: _kRAController.isEnComeSelect,
        title: annualIncomeList,
      ),
      _space,
      AppText(
        title: 'What is your Occupaion',
      ),
      _space1,
      Container(
          height: 50,
          // width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 1.1, color: AppColors.borderColor),
            color: Colors.white,
          ),
          child:    Obx(() =>Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  dropdownFullScreen: true,
                  dropdownOverButton: true,
                  buttonWidth: double.infinity,
                  hint: const Text("Select Occupation",
                      style: TextStyle(
                          color: Color(0xffC8C7CE), letterSpacing: 2)),
                  items:_kRAController.professionList.value.map
                    ((e){
                    return DropdownMenuItem(
                      value: e.professionName,
                      child: Text(
                        e.professionName,
                      ),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    List<ProfessionModel> temp = _kRAController
                        .professionList.value
                        .where((element) => element.professionName == newValue)
                        .toList();
                    _kRAController.professionId.value = newValue.toString();

                  },
                  value: _kRAController.professionId.value,
                ),
              )))),
      _space,
      AppText(
        title: 'What is your trading experience?',
      ),
      _space1,
      MyFilterChip(
        selectedIndex: _kRAController.isExperienceSelect,
        title: ExperienceList,
      ),
      _space,
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Have you filed ITR last 2 Years",
              style: GoogleFonts.sourceSansPro(
                textStyle: const TextStyle(
                    color: Color(0xff22263D),
                    fontWeight: FontWeight.w400,
                    fontSize: 15),
              )),
          CustomSwitch(
            activeColor: Colors.green,
            value: _kRAController.isRTR.value,
            onChanged: (value) {
              _kRAController.isRTR.value = value;
              if (value == true) {
                _kRAController.isRTRInt.value = 1;
              } else {
                _kRAController.isRTRInt.value = 0;
              }
            },
          )
        ],
      ),
      _space,
      AppText(
        title: 'Mother???s Maiden Name',
      ),
      _space1,
      AppTextField(
        textCapitalization: TextCapitalization.words,
        hint: 'Enter Maiden Name',
        controller: _kRAController.maidenName.value,
        lengthFormater: LengthLimitingTextInputFormatter(36),
        textInputType: TextInputType.text,
      ),
      _space,
      _space,
      _space,
      InkWell(
          onTap: () {
            if (_kRAController.maidenName.value.text != "") {
              isButtonClick.value = true;
              _kRAController.update_personal_details();
            }
          },
          child: Obx(
            () => Container(
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
                        ? (_kRAController.maidenName.value.text.isNotEmpty)
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
                          ? (_kRAController.maidenName.value.text.isNotEmpty)
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
          _personalDetailsController.updateStatus.value = "2";
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
    ]);
  }

  Widget get _space => const SizedBox(height: 16);

  Widget get _space1 => const SizedBox(height: 5);
}
