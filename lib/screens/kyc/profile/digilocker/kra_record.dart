import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../getx_controller/kra/kra_controller.dart';
import '../../../../getx_controller/personal_details_controller.dart';
import '../../../../utils/colorsConstant.dart';
import '../../../../utils/styles.dart';
import '../personal_detals/app_textfield.dart';

class Help {
  String label;
  Color color;
  bool isSelected = false;

  Help(this.label, this.color, this.isSelected);
}

class KRARecord extends StatelessWidget {
  KRARecord({Key? key}) : super(key: key);
  PersonalDetailsController _personalDetailsController = Get.put(PersonalDetailsController());
  KRAController _kRAController = Get.put(KRAController());
  RxBool isButtonClick = false.obs;
  List profession = ["sds", "sds1", "sds2", "sds3"];
  String profId = "sds";

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
        "Hey ${_personalDetailsController.firstName.value.text}, Please Verify, We Fetched This Information From Pan And KRA Records, As Provided By You.",
        style: ConstStyle.quickMedium,
      ),
      _space,
      AppText(
        title: 'Aadhaar Number ',
      ),
      _space1,
      TextContainer(
        color: Color(0xffF7F7FA),
        titleText: "5436 7658 7658",
        perfixIcon: Container(),
        postfixIcon: Container(),
      ),
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
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
          child: Text(
            "A 1XX4, XXXXX XXXXX XXX, XXXXX XXXXX XXXXX, XXXXX - XXXXX, XXXXX - XXXX64, XXXXXXXXXX, XXXXX.",
            style: GoogleFonts.sourceSansPro(
              textStyle: const TextStyle(
                  color: Color(0xff22263D),
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  letterSpacing: 3),
            ),
          ),
        ),
      ),
      _space,
      AppText(
        title: 'What is your gender?',
      ),
      Wrap(
        spacing: 10,
        runSpacing: -6,
        direction: Axis.horizontal,
        children: helpChips([
          Help("Male", AppColors.primaryColor, false),
          Help("Female", AppColors.primaryColor, false),
          Help("Trans", AppColors.primaryColor, false),
        ]),
      ),
      _space,
      AppText(
        title: 'What is your marital status?',
      ),
      Wrap(
        spacing: 10,
        runSpacing: -6,
        direction: Axis.horizontal,
        children: helpChips([
          Help("Single", AppColors.primaryColor, false),
          Help("Married", AppColors.primaryColor, false),
          Help("Others", AppColors.primaryColor, false),
        ]),
      ),
      _space,
      AppText(
        title: 'What is your annual income?',
      ),
      Wrap(
        spacing: 10,
        runSpacing: -6,
        direction: Axis.horizontal,
        children: helpChips([
          Help("Below 1 Lakh", AppColors.primaryColor, false),
          Help("1-5 Lakhs", AppColors.primaryColor, false),
          Help("5-10 Lakhs", AppColors.primaryColor, false),
          Help("10-25 Lakhs", AppColors.primaryColor, false),
          Help("Above 25 Lakhs", AppColors.primaryColor, false),
        ]),
      ),
      _space,
      AppText(
        title: 'What is your Occupaion',
      ),
      _space1,
      Container(
        height: 45,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1.1, color: AppColors.borderColor),
        ),
        /* child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  hint: const Text(
                    "Select Occupation",
                    style: TextStyle(color: Color(0xffC8C7CE)),
                  ),
                  items: profession.map((item) {
                    return DropdownMenuItem(
                        value: item.professionName.toString(),
                        child: Text(
                          item.professionName,
                          style: const TextStyle(
                            fontSize: 17.0,
                          ),
                        ));
                  }).toList(),
                  onChanged: (String? newVal) {
                    profId = newVal!;
                    print(profId.toString());
                  },
                  value: profId,
                ),
              ))*/
      ),
      _space,
      AppText(
        title: 'What is your trading experience?',
      ),
      Wrap(
        spacing: 10,
        runSpacing: -6,
        direction: Axis.horizontal,
        children: helpChips([
          Help("Less than 1 Year", AppColors.primaryColor, false),
          Help("1-2 Years", AppColors.primaryColor, false),
          Help("2-5 Years", AppColors.primaryColor, false),
          Help("5-10 Years", AppColors.primaryColor, false),
          Help("10-20 Years", AppColors.primaryColor, false),
          Help("20-25 Years", AppColors.primaryColor, false),
          Help("Above 25 Years", AppColors.primaryColor, false),
        ]),
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
        title: 'Mother’s Maiden Name',
      ),
      _space1,
      AppTextField(
        textCapitalization: TextCapitalization.words,
        hint: 'Enter Maiden Name',
        controller: _kRAController.maidenName,
        textInputType: TextInputType.text,
      ),
      _space,
      _space,
      _space,
      InkWell(
        onTap: () {
          isButtonClick.value = true;
          _personalDetailsController.isVisible.value = 4;
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
    ]);
  }

  List<Widget> helpChips(List<Help> list) {
    List<Widget> chips = [];
    for (int i = 0; i < list.length; i++) {
      Widget item = FilterChip(
        label: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(list[i].label),
        ),
        labelStyle: GoogleFonts.quicksand(
          textStyle: const TextStyle(
              fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        backgroundColor: list[i].color,
        selected: list[i].isSelected,
        onSelected: (bool val) {
          _kRAController.isSelected.value = val;
          // setState(() {
          //   _chipsList[i].isSelected = value;
          // });
        },
        showCheckmark: false,
      );
      chips.add(item);
    }
    return chips;
  }

  Widget get _space => const SizedBox(height: 16);

  Widget get _space1 => const SizedBox(height: 5);
}
