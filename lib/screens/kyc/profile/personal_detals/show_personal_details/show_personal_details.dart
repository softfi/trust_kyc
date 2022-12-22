import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/utils/colorsConstant.dart';

import '../../../../../getx_controller/personal_details_controller.dart';
import '../../../../../utils/strings.dart';
import '../../../../../utils/styles.dart';
import '../app_textfield.dart';
import 'custom_container.dart';

class ShowPersonalDetails extends StatelessWidget {
  ShowPersonalDetails({Key? key}) : super(key: key);

  PersonalDetailsController _personalDetailsController =
      Get.put(PersonalDetailsController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 15),
      child: Container(
        padding: const EdgeInsets.all(14),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color(0xffF7F7FA).withOpacity(0.35),
            border: Border.all(width: 1.2, color: const Color(0xffbcbcbc))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text(
                  "Personal Details",
                  style: ConstStyle.quickMedium,
                ),
              ],
            ),
            _space1,
            Container(
              height: 3,
              width: 170,
              color: AppColors.textColor,
            ),
            const SizedBox(
              height: 10,
            ),
            showDetails()
          ],
        ),
      ),
    );
  }

  Widget showDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _space,
        DesableAppText(
          title: 'Full Name: ',
        ),
        _space1,
        DesableTitleText(
          title:
              "${_personalDetailsController.modaltest.value!.firstname} ${_personalDetailsController.modaltest.value!.firstname}",
        ),
        _space,
        DesableAppText(
          title: 'Mobile Number ',
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/india.png",
              width: 20,
              height: 20,
              scale: 4,
            ),
            const SizedBox(
              width: 5,
            ),
            DesableTitleText(
              title:
                  "+91 ${_personalDetailsController.modaltest.value!.mobileNumber}",
            ),
            const SizedBox(
              width: 15,
            ),
            MyContainer.verifiedContainer()
          ],
        ),
        _space,
        DesableAppText(
          title: 'Email ID:',
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DesableTitleText(
              title: "${_personalDetailsController.modaltest.value!.emailId}",
            ),
            const SizedBox(
              width: 15,
            ),
            MyContainer.verifiedContainer(),
            const SizedBox(
              width: 15,
            ),
          ],
        ),
        _space,
        DesableAppText(
          title: 'Date of Birth - Should be as per Aadhar',
        ),
        DesableTitleText(
          title: _personalDetailsController.dob.value,
        ),
        _space,
        DesableAppText(
          title: 'PAN Number',
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DesableTitleText(
              title: "${_personalDetailsController.modaltest.value!.panNumber}",
            ),
            const SizedBox(
              width: 15,
            ),
            MyContainer.verifiedContainer()
          ],
        ),
        _space,
        DesableAppText(
          title: 'Aadhaar Number',
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DesableTitleText(
              title: "${_personalDetailsController.modaltest.value!.aadharNumber ?? ""}",
            ),
            const SizedBox(
              width: 15,
            ),
            MyContainer.verifiedContainer()
          ],
        ),
        _space,
        DesableAppText(
          title: 'Aadhaar Number',
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DesableTitleText(
              title: "${_personalDetailsController.modaltest.value!.aadharNumber ?? ""}",
            ),
            const SizedBox(
              width: 15,
            ),
            MyContainer.verifiedContainer()
          ],
        ),
        _space,
        DesableAppText(
          title: 'What is your gender?',
        ),
        _space1,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 34,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: _personalDetailsController.modaltest.value!.gender == 1
                            ? Color(0xff23263B)
                            : Color(0xffC8C7CD)),
                    color: _personalDetailsController.modaltest.value!.gender == 1
                        ? Color(0xff22263D)
                        : Colors.white),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    "Male",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: TextStyle(
                          color:
                              _personalDetailsController.modaltest.value!.gender == 1
                                  ? Colors.white
                                  : Color(0xffC8C7CD),
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  ),
                )),
              ),
              const SizedBox(
                width: 15,
              ),
              Container(
                height: 34,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: _personalDetailsController.modaltest.value!.gender == 2
                            ? Color(0xff23263B)
                            : Color(0xffC8C7CD)),
                    color: _personalDetailsController.modaltest.value!.gender == 2
                        ? Color(0xff22263D)
                        : Colors.white),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    "Female",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: TextStyle(
                          color:
                              _personalDetailsController.modaltest.value!.gender == 2
                                  ? Colors.white
                                  : Color(0xffC8C7CD),
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  ),
                )),
              ),
              const SizedBox(
                width: 15,
              ),
              Container(
                height: 34,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: _personalDetailsController.modaltest.value!.gender == 3
                            ? Color(0xff23263B)
                            : Color(0xffC8C7CD)),
                    color: _personalDetailsController.modaltest.value!.gender == 3
                        ? Color(0xff22263D)
                        : Colors.white),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    "Trans",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: TextStyle(
                          color:
                              _personalDetailsController.modaltest.value!.gender == 3
                                  ? Colors.white
                                  : Color(0xffC8C7CD),
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  ),
                )),
              ),
              const SizedBox(
                width: 15,
              ),
              Visibility(
                visible:
                    _personalDetailsController.modaltest.value!.mothersMaidenName !=
                                "" &&
                            _personalDetailsController
                                    .modaltest.value!.mothersMaidenName !=
                                null
                        ? true
                        : false,
                child: InkWell(
                  onTap: () {
                    //updateGenderBottomSheet();
                  },
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xff00C6D8)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/edit.png",
                            scale: 6,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Update",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        _space,
        DesableAppText(
          title: 'What is your marital status?',
        ),
        _space1,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 34,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: _personalDetailsController
                                    .modaltest.value!.marriedStatus ==
                                1
                            ? Color(0xff23263B)
                            : Color(0xffC8C7CD)),
                    color:
                        _personalDetailsController.modaltest.value!.marriedStatus == 1
                            ? Color(0xff22263D)
                            : Colors.white),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    "Single",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: TextStyle(
                          color: _personalDetailsController
                                      .modaltest.value!.marriedStatus ==
                                  1
                              ? Colors.white
                              : Color(0xffC8C7CD),
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  ),
                )),
              ),
              const SizedBox(
                width: 15,
              ),
              Container(
                height: 34,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: _personalDetailsController
                                    .modaltest.value!.marriedStatus ==
                                2
                            ? Color(0xff23263B)
                            : Color(0xffC8C7CD)),
                    color:
                        _personalDetailsController.modaltest.value!.marriedStatus == 2
                            ? Color(0xff22263D)
                            : Colors.white),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    "Married",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: TextStyle(
                          color: _personalDetailsController
                                      .modaltest.value!.marriedStatus ==
                                  2
                              ? Colors.white
                              : Color(0xffC8C7CD),
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  ),
                )),
              ),
              const SizedBox(
                width: 15,
              ),
              Container(
                height: 34,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: _personalDetailsController
                                    .modaltest.value!.marriedStatus ==
                                3
                            ? Color(0xff23263B)
                            : Color(0xffC8C7CD)),
                    color:
                        _personalDetailsController.modaltest.value!.marriedStatus == 3
                            ? Color(0xff22263D)
                            : Colors.white),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    "Others",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: TextStyle(
                          color: _personalDetailsController
                                      .modaltest.value!.marriedStatus ==
                                  3
                              ? Colors.white
                              : Color(0xffC8C7CD),
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  ),
                )),
              ),
              const SizedBox(
                width: 15,
              ),
              Visibility(
                visible:
                    _personalDetailsController.modaltest.value!.mothersMaidenName !=
                                "" &&
                            _personalDetailsController
                                    .modaltest.value!.mothersMaidenName !=
                                null
                        ? true
                        : false,
                child: InkWell(
                  onTap: () {
                    //updateMaritalBottomSheet();
                  },
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xff00C6D8)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/edit.png",
                            scale: 6,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Update",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        _space,
        DesableAppText(
          title: 'What is your Occupaion',
        ),
        _space1,
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 1, color: Color(0xffC8C7CD)),
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
                    letterSpacing: 1),
              ),
            ),
          ),
        ),
        _space,
        DesableAppText(
          title: 'What is your Occupaion',
        ),
        DesableTitleText(
          title: "${_personalDetailsController.modaltest.value!.occupation}",
        ),
        _space,
        DesableAppText(
          title: 'What is your annual income?',
        ),
        _space1,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 34,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: _personalDetailsController
                                    .modaltest.value!.annualIncome ==
                                1
                            ? Color(0xff23263B)
                            : Color(0xffC8C7CD)),
                    color:
                        _personalDetailsController.modaltest.value!.annualIncome == 1
                            ? Color(0xff22263D)
                            : Colors.white),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    "Below 1 Lakh",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: TextStyle(
                          color: _personalDetailsController
                                      .modaltest.value!.annualIncome ==
                                  1
                              ? Colors.white
                              : Color(0xffC8C7CD),
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  ),
                )),
              ),
              SizedBox(
                width: 15,
              ),
              Container(
                height: 34,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: _personalDetailsController
                                    .modaltest.value!.annualIncome ==
                                2
                            ? Color(0xff23263B)
                            : Color(0xffC8C7CD)),
                    color:
                        _personalDetailsController.modaltest.value!.annualIncome == 2
                            ? Color(0xff22263D)
                            : Colors.white),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    "1-5 Lakh",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: TextStyle(
                          color: _personalDetailsController
                                      .modaltest.value!.annualIncome ==
                                  2
                              ? Colors.white
                              : Color(0xffC8C7CD),
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  ),
                )),
              ),
              SizedBox(
                width: 15,
              ),
              Container(
                height: 34,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: _personalDetailsController
                                    .modaltest.value!.annualIncome ==
                                3
                            ? Color(0xff23263B)
                            : Color(0xffC8C7CD)),
                    color:
                        _personalDetailsController.modaltest.value!.annualIncome == 3
                            ? Color(0xff22263D)
                            : Colors.white),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    "5-10 Lakh",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: TextStyle(
                          color: _personalDetailsController
                                      .modaltest.value!.annualIncome ==
                                  3
                              ? Colors.white
                              : Color(0xffC8C7CD),
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  ),
                )),
              ),
            ],
          ),
        ),
        _space1,
        _space1,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 34,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: _personalDetailsController
                                    .modaltest.value!.annualIncome ==
                                4
                            ? Color(0xff23263B)
                            : Color(0xffC8C7CD)),
                    color:
                        _personalDetailsController.modaltest.value!.annualIncome == 4
                            ? Color(0xff22263D)
                            : Colors.white),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    "10-20 Lakh",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: TextStyle(
                          color: _personalDetailsController
                                      .modaltest.value!.annualIncome ==
                                  4
                              ? Colors.white
                              : Color(0xffC8C7CD),
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  ),
                )),
              ),
              const SizedBox(
                width: 15,
              ),
              Container(
                height: 34,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color:  _personalDetailsController
                            .modaltest.value!.annualIncome ==
                                5
                            ? Color(0xff23263B)
                            : Color(0xffC8C7CD)),
                    color:
                        _personalDetailsController.modaltest.value!.annualIncome == 5
                            ? Color(0xff22263D)
                            : Colors.white),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    "Above 25 Lakh",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: TextStyle(
                          color: _personalDetailsController
                                      .modaltest.value!.annualIncome ==
                                  5
                              ? Colors.white
                              : Color(0xffC8C7CD),
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  ),
                )),
              ),
              const SizedBox(
                width: 15,
              ),
              Visibility(
                visible:
                    _personalDetailsController.modaltest.value!.mothersMaidenName !=
                                "" &&
                            _personalDetailsController
                                    .modaltest.value!.mothersMaidenName !=
                                null
                        ? true
                        : false,
                child: InkWell(
                  onTap: () {
                    //updateAnnualBottomSheet();
                  },
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xff00C6D8)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/edit.png",
                            scale: 6,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Update",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        _space,
        DesableAppText(
          title: 'What is your trading experience?',
        ),
        _space1,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 34,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: _personalDetailsController
                                    .modaltest.value!.tradingExperience ==
                                1
                            ? Color(0xff23263B)
                            : Color(0xffC8C7CD)),
                    color: _personalDetailsController
                                .modaltest.value!.tradingExperience ==
                            1
                        ? Color(0xff22263D)
                        : Colors.white),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    "Less than 1 Year",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: TextStyle(
                          color: _personalDetailsController
                                      .modaltest.value!.tradingExperience ==
                                  1
                              ? Colors.white
                              : Color(0xffC8C7CD),
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  ),
                )),
              ),
              SizedBox(
                width: 15,
              ),
              Container(
                height: 34,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: _personalDetailsController
                                    .modaltest.value!.tradingExperience ==
                                2
                            ? Color(0xff23263B)
                            : Color(0xffC8C7CD)),
                    color: _personalDetailsController
                                .modaltest.value!.tradingExperience ==
                            2
                        ? Color(0xff22263D)
                        : Colors.white),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    "1-2 Years",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: TextStyle(
                          color: _personalDetailsController
                                      .modaltest.value!.tradingExperience ==
                                  2
                              ? Colors.white
                              : Color(0xffC8C7CD),
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  ),
                )),
              ),
              SizedBox(
                width: 15,
              ),
              Container(
                height: 34,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: _personalDetailsController
                                    .modaltest.value!.tradingExperience ==
                                3
                            ? Color(0xff23263B)
                            : Color(0xffC8C7CD)),
                    color: _personalDetailsController
                                .modaltest.value!.tradingExperience ==
                            3
                        ? Color(0xff22263D)
                        : Colors.white),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    "2-5 Years",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: TextStyle(
                          color: _personalDetailsController
                                      .modaltest.value!.tradingExperience ==
                                  3
                              ? Colors.white
                              : Color(0xffC8C7CD),
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  ),
                )),
              ),
            ],
          ),
        ),
        _space1,
        _space1,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 34,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: _personalDetailsController
                                    .modaltest.value!.tradingExperience ==
                                4
                            ? Color(0xff23263B)
                            : Color(0xffC8C7CD)),
                    color: _personalDetailsController
                                .modaltest.value!.tradingExperience ==
                            4
                        ? Color(0xff22263D)
                        : Colors.white),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    "5-10 Years",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: TextStyle(
                          color: _personalDetailsController
                                      .modaltest.value!.tradingExperience ==
                                  4
                              ? Colors.white
                              : Color(0xffC8C7CD),
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  ),
                )),
              ),
              SizedBox(
                width: 15,
              ),
              Container(
                height: 34,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: _personalDetailsController
                                    .modaltest.value!.tradingExperience ==
                                5
                            ? Color(0xff23263B)
                            : Color(0xffC8C7CD)),
                    color: _personalDetailsController
                                .modaltest.value!.tradingExperience ==
                            5
                        ? Color(0xff22263D)
                        : Colors.white),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    "10-20 Years",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: TextStyle(
                          color: _personalDetailsController
                                      .modaltest.value!.tradingExperience ==
                                  5
                              ? Colors.white
                              : Color(0xffC8C7CD),
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  ),
                )),
              ),
              SizedBox(
                width: 15,
              ),
              Container(
                height: 34,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: _personalDetailsController
                                    .modaltest.value!.tradingExperience ==
                                6
                            ? Color(0xff23263B)
                            : Color(0xffC8C7CD)),
                    color: _personalDetailsController
                                .modaltest.value!.tradingExperience ==
                            6
                        ? Color(0xff22263D)
                        : Colors.white),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    "20-25 Years",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: TextStyle(
                          color: _personalDetailsController
                                      .modaltest.value!.tradingExperience ==
                                  6
                              ? Colors.white
                              : Color(0xffC8C7CD),
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  ),
                )),
              ),
            ],
          ),
        ),
        _space1,
        _space1,
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 34,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      color: _personalDetailsController
                                  .modaltest.value!.tradingExperience ==
                              7
                          ? Color(0xff23263B)
                          : Color(0xffC8C7CD)),
                  color:
                      _personalDetailsController.modaltest.value!.tradingExperience ==
                              7
                          ? Color(0xff22263D)
                          : Colors.white),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  "Above 25 Years",
                  style: GoogleFonts.sourceSansPro(
                    textStyle: TextStyle(
                        color: _personalDetailsController
                                    .modaltest.value!.tradingExperience ==
                                7
                            ? Colors.white
                            : Color(0xffC8C7CD),
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                ),
              )),
            ),
            const SizedBox(
              width: 15,
            ),
            Visibility(
              visible: _personalDetailsController
                              .modaltest.value!.mothersMaidenName !=
                          "" &&
                      _personalDetailsController.modaltest.value!.mothersMaidenName !=
                          null
                  ? true
                  : false,
              child: InkWell(
                onTap: () {
                  // updateExperienceBottomSheet();
                },
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xff00C6D8)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/edit.png",
                          scale: 6,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Update",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        _space,
        DesableAppText(
          title: 'Mother’s Maiden Name',
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DesableTitleText(
              title: _personalDetailsController.modaltest.value!.mothersMaidenName,
            ),
            const SizedBox(
              width: 15,
            ),
            MyContainer.updateContainer()
          ],
        ),
        _space,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Are You Politically Exposed",
              style: GoogleFonts.sourceSansPro(
                textStyle: TextStyle(
                  color: _personalDetailsController
                              .modaltest.value!.isPoliticallyExposed !=
                          1
                      ? Color(0xff22263D)
                      : Color(0xffC8C7CE),
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              height: 40,
              width: 78,
              decoration: BoxDecoration(
                  color: _personalDetailsController
                              .modaltest.value!.isPoliticallyExposed ==
                          1
                      ? Colors.green
                      : _personalDetailsController
                                      .modaltest.value!.mothersMaidenName !=
                                  "" &&
                              _personalDetailsController
                                      .modaltest.value!.mothersMaidenName !=
                                  null
                          ? Colors.red
                          : Color(0xffC8C7CD),
                  borderRadius: BorderRadius.circular(25)),
              child: Row(
                children: [
                  _personalDetailsController.modaltest.value!.isPoliticallyExposed ==
                          1
                      ? Container()
                      : Icon(
                          size: 30,
                          Icons.circle,
                          color: Colors.white,
                        ),
                  SizedBox(width: 3),
                  Text(
                    _personalDetailsController
                                .modaltest.value!.isPoliticallyExposed ==
                            1
                        ? "YES"
                        : "NO",
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 3),
                  _personalDetailsController.modaltest.value!.isPoliticallyExposed ==
                          1
                      ? Icon(
                          size: 30,
                          Icons.circle,
                          color: Colors.white,
                        )
                      : Container(),
                ],
              ),
            ),
          ],
        ),
        _space,
        _space1,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 250,
              child: Text(
                Strings.active_check,
                style: GoogleFonts.sourceSansPro(
                  textStyle: TextStyle(
                    color: _personalDetailsController
                                    .modaltest.value!.mothersMaidenName !=
                                "" &&
                            _personalDetailsController
                                    .modaltest.value!.mothersMaidenName !=
                                null
                        ? Color(0xff22263D)
                        : Color(0xffC8C7CE),
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              height: 40,
              width: 78,
              decoration: BoxDecoration(
                  color: _personalDetailsController
                              .modaltest.value!.wouldYouLikeToActivate ==
                          1
                      ? Colors.green
                      : _personalDetailsController
                                      .modaltest.value!.mothersMaidenName !=
                                  "" &&
                              _personalDetailsController
                                      .modaltest.value!.mothersMaidenName !=
                                  null
                          ? Colors.red
                          : Color(0xffC8C7CD),
                  borderRadius: BorderRadius.circular(25)),
              child: Row(
                children: [
                  _personalDetailsController
                              .modaltest.value!.wouldYouLikeToActivate ==
                          1
                      ? Container()
                      : Icon(
                          size: 30,
                          Icons.circle,
                          color: Colors.white,
                        ),
                  SizedBox(width: 3),
                  Text(
                    _personalDetailsController
                                .modaltest.value!.wouldYouLikeToActivate ==
                            1
                        ? "YES"
                        : "NO",
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 3),
                  _personalDetailsController
                              .modaltest.value!.wouldYouLikeToActivate ==
                          1
                      ? Icon(
                          size: 30,
                          Icons.circle,
                          color: Colors.white,
                        )
                      : Container(),
                ],
              ),
            ),
          ],
        ),
        _space,

        _space,
        DesableAppText(
          title: 'IPV',
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DesableTitleText(
                title: "IN-PERSON VERIFICATION",
              ),
              const SizedBox(
                width: 15,
              ),
              Container(
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: _personalDetailsController.modaltest.value!.inPersonVerification == 1
                        ? Colors.green
                        : Color(0xffC8C7CE)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.check_circle_outline,
                          size: 16, color: Colors.white),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        _personalDetailsController.modaltest.value!.inPersonVerification  == 1
                            ? "Verified"
                            : "Not-Verified",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        _space,
      ],
    );
  }

  Widget get _space => const SizedBox(height: 16);

  Widget get _space1 => const SizedBox(height: 5);
}

class DesableTitleText extends StatelessWidget {
  DesableTitleText({Key? key, required this.title}) : super(key: key);

  String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.sourceSansPro(
        textStyle: const TextStyle(
            color: Color(0xff22263D),
            letterSpacing: 2,
            fontWeight: FontWeight.w500,
            fontSize: 16),
      ),
    );
  }
}
