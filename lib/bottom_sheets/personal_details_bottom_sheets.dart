import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/utils/images.dart';
import '../utils/colorsConstant.dart';

class PersonalDetailBottomSheet {
  static updateGenderBottomSheet(BuildContext context, {
    required int genderIndex,
    required Function() onItemClick,
  }) async {
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
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (BuildContext context, State) {
          return Padding(
            padding: EdgeInsets.only(
                top: 0,
                right: 0,
                left: 0,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Wrap(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color: AppColors.primaryColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "What is Your Gender? ",
                        style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              State(() {
                                genderIndex = 1;
                              });
                            },
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x29000000),
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                  border:
                                  Border.all(width: 1, color: Colors.white),
                                  color: genderIndex == 1
                                      ? Colors.white
                                      : Color(0xff22263D)),
                              child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Text(
                                      "Male",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: TextStyle(
                                            color: genderIndex == 1
                                                ? Color(0xff22263D)
                                                : Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {
                              State(() {
                                genderIndex = 2;
                              });
                            },
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x29000000),
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                  border:
                                  Border.all(width: 1, color: Colors.white),
                                  color: genderIndex == 2
                                      ? Colors.white
                                      : Color(0xff22263D)),
                              child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Text(
                                      "Female",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: TextStyle(
                                            color: genderIndex == 2
                                                ? Color(0xff22263D)
                                                : Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {
                              State(() {
                                genderIndex = 3;
                              });
                            },
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x29000000),
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                  border:
                                  Border.all(width: 1, color: Colors.white),
                                  color: genderIndex == 3
                                      ? Colors.white
                                      : Color(0xff22263D)),
                              child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Text(
                                      "Trans",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: TextStyle(
                                            color: genderIndex == 3
                                                ? Color(0xff22263D)
                                                : Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 45,
                              width: MediaQuery.of(context).size.width / 2.4,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.white)),
                              child: Center(
                                child: Text(
                                  "Cancel",
                                  style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {
                              onItemClick;
                              print("sfdyfsuigydfgvdfg");
                             // Navigator.pop(context);
                            },
                            child: Container(
                              height: 45,
                              width: MediaQuery.of(context).size.width / 2.4,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.white)),
                              child: Center(
                                child: Text(
                                  "Update",
                                  style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }

/*  static updateMaritalBottomSheet() {
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
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (BuildContext context, State) {
          return Padding(
            padding: EdgeInsets.only(
                top: 0,
                right: 0,
                left: 0,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Wrap(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color: AppColors.primaryColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "What is Your marital status? ",
                        style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              State(() {
                                maritalIndex = 1;
                              });
                            },
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x29000000),
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                  border:
                                  Border.all(width: 1, color: Colors.white),
                                  color: maritalIndex == 1
                                      ? Colors.white
                                      : Color(0xff22263D)),
                              child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Text(
                                      "Single",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: TextStyle(
                                            color: maritalIndex == 1
                                                ? Color(0xff22263D)
                                                : Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {
                              State(() {
                                maritalIndex = 2;
                              });
                            },
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x29000000),
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                  border:
                                  Border.all(width: 1, color: Colors.white),
                                  color: maritalIndex == 2
                                      ? Colors.white
                                      : Color(0xff22263D)),
                              child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Text(
                                      "Married",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: TextStyle(
                                            color: maritalIndex == 2
                                                ? Color(0xff22263D)
                                                : Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {
                              State(() {
                                maritalIndex = 3;
                              });
                            },
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x29000000),
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                  border:
                                  Border.all(width: 1, color: Colors.white),
                                  color: maritalIndex == 3
                                      ? Colors.white
                                      : Color(0xff22263D)),
                              child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Text(
                                      "Others",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: TextStyle(
                                            color: maritalIndex == 3
                                                ? Color(0xff22263D)
                                                : Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 45,
                              width: MediaQuery.of(context).size.width / 2.4,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.white)),
                              child: Center(
                                child: Text(
                                  "Cancel",
                                  style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () async {
                              Navigator.pop(context);
                              var updateMarital = await ProfileRepository()
                                  .addPersonalDetails(
                                  firstName: getPersonalDetail!.firstname,
                                  lastName: getPersonalDetail!.lastname,
                                  addressLine1:
                                  getPersonalDetail?.addressLine1,
                                  addressLine2:
                                  getPersonalDetail?.addressLine2,
                                  addressLine3:
                                  getPersonalDetail?.addressLine3,
                                  addressZip: getPersonalDetail!.addressZip,
                                  maidenName:
                                  getPersonalDetail!.mothersMaidenName,
                                  professionID:
                                  getPersonalDetail!.occupation,
                                  proof: getPersonalDetail!.proofType,
                                  stateId: getPersonalDetail!.addressState,
                                  cityID: getPersonalDetail!.addressCity,
                                  genderIndex: getPersonalDetail!.gender,
                                  maritalIndex: maritalIndex,
                                  incomeIndex:
                                  getPersonalDetail!.annualIncome,
                                  experienceIndex:
                                  getPersonalDetail!.tradingExperience,
                                  dob: DateFormat('dd-MM-yyyy').format(
                                      DateTime.parse(getPersonalDetail!.dob
                                          .toString())),
                                  politicallyexposed: getPersonalDetail!
                                      .isPoliticallyExposed,
                                  wouldyouliketoActivate: getPersonalDetail!
                                      .wouldYouLikeToActivate,
                                  chekbox1: getPersonalDetail!
                                      .checkBoxShareDataWithCompany,
                                  chekbox2: getPersonalDetail!
                                      .checkBoxShareDataWithGovt,
                                  itrFiled: 0);
                              if (updateMarital != "") {
                                getPersonalDetails();
                                openConfirmBottomSheet();
                              } else {
                                Fluttertoast.showToast(
                                    msg: "something went wrong");
                              }
                            },
                            child: Container(
                              height: 45,
                              width: MediaQuery.of(context).size.width / 2.4,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.white)),
                              child: Center(
                                child: Text(
                                  "Update",
                                  style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }

  static updateAnnualBottomSheet() {
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
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (BuildContext context, State) {
          return Padding(
            padding: EdgeInsets.only(
                top: 0,
                right: 0,
                left: 0,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Wrap(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color: AppColors.primaryColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "What is Your annual income? ",
                        style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              State(() {
                                incomeIndex = 1;
                              });
                            },
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x29000000),
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                  border:
                                  Border.all(width: 1, color: Colors.white),
                                  color: incomeIndex == 1
                                      ? Colors.white
                                      : Color(0xff22263D)),
                              child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Text(
                                      "Below 1 Lakh",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: TextStyle(
                                            color: incomeIndex == 1
                                                ? Color(0xff22263D)
                                                : Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {
                              State(() {
                                incomeIndex = 2;
                              });
                            },
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x29000000),
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                  border:
                                  Border.all(width: 1, color: Colors.white),
                                  color: incomeIndex == 2
                                      ? Colors.white
                                      : Color(0xff22263D)),
                              child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Text(
                                      "1-5 Lakh",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: TextStyle(
                                            color: incomeIndex == 2
                                                ? Color(0xff22263D)
                                                : Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {
                              State(() {
                                incomeIndex = 3;
                              });
                            },
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x29000000),
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                  border:
                                  Border.all(width: 1, color: Colors.white),
                                  color: incomeIndex == 3
                                      ? Colors.white
                                      : Color(0xff22263D)),
                              child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Text(
                                      "5-10 Lakh",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: TextStyle(
                                            color: incomeIndex == 3
                                                ? Color(0xff22263D)
                                                : Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              State(() {
                                incomeIndex = 4;
                              });
                            },
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x29000000),
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                  border:
                                  Border.all(width: 1, color: Colors.white),
                                  color: incomeIndex == 4
                                      ? Colors.white
                                      : Color(0xff22263D)),
                              child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Text(
                                      "10-20 Lakh",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: TextStyle(
                                            color: incomeIndex == 4
                                                ? Color(0xff22263D)
                                                : Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {
                              State(() {
                                incomeIndex = 5;
                              });
                            },
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x29000000),
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                  border:
                                  Border.all(width: 1, color: Colors.white),
                                  color: incomeIndex == 5
                                      ? Colors.white
                                      : Color(0xff22263D)),
                              child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Text(
                                      "Above 25 Lakh",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: TextStyle(
                                            color: incomeIndex == 5
                                                ? Color(0xff22263D)
                                                : Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 45,
                              width: MediaQuery.of(context).size.width / 2.4,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.white)),
                              child: Center(
                                child: Text(
                                  "Cancel",
                                  style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () async {
                              Navigator.pop(context);
                              var updateIncocme = await ProfileRepository()
                                  .addPersonalDetails(
                                  firstName: getPersonalDetail!.firstname,
                                  lastName: getPersonalDetail!.lastname,
                                  addressLine1:
                                  getPersonalDetail!.addressLine1,
                                  addressLine2:
                                  getPersonalDetail!.addressLine2,
                                  addressLine3:
                                  getPersonalDetail?.addressLine3,
                                  addressZip: getPersonalDetail!.addressZip,
                                  maidenName:
                                  getPersonalDetail!.mothersMaidenName,
                                  professionID:
                                  getPersonalDetail!.occupation,
                                  proof: getPersonalDetail!.proofType,
                                  stateId: getPersonalDetail!.addressState,
                                  cityID: getPersonalDetail!.addressCity,
                                  genderIndex: getPersonalDetail!.gender,
                                  maritalIndex:
                                  getPersonalDetail!.marriedStatus,
                                  incomeIndex: incomeIndex,
                                  experienceIndex:
                                  getPersonalDetail!.tradingExperience,
                                  dob: DateFormat('dd-MM-yyyy').format(
                                      DateTime.parse(getPersonalDetail!.dob
                                          .toString())),
                                  politicallyexposed: getPersonalDetail!
                                      .isPoliticallyExposed,
                                  wouldyouliketoActivate: getPersonalDetail!
                                      .wouldYouLikeToActivate,
                                  chekbox1: getPersonalDetail!
                                      .checkBoxShareDataWithCompany,
                                  chekbox2: getPersonalDetail!
                                      .checkBoxShareDataWithGovt,
                                  itrFiled: 0);
                              if (updateIncocme != "") {
                                getPersonalDetails();
                                openConfirmBottomSheet();
                              } else {
                                Fluttertoast.showToast(
                                    msg: "something went wrong");
                              }
                            },
                            child: Container(
                              height: 45,
                              width: MediaQuery.of(context).size.width / 2.4,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.white)),
                              child: Center(
                                child: Text(
                                  "Update",
                                  style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }

  static updateAddressBottomSheet() {
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
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (BuildContext context, State) {
          return Padding(
            padding: EdgeInsets.only(
                top: 0,
                right: 0,
                left: 0,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Wrap(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 1.5,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color: AppColors.primaryColor,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Update Address Details ",
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text("Address Proof ",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            )),
                        _space1,
                        Container(
                            height: 45,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border:
                                Border.all(width: 1.1, color: Colors.white),
                                color: Colors.white),
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14.0),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2(
                                    hint: const Text(
                                      "Select Address Proof",
                                      style:
                                      TextStyle(color: AppColors.textColor),
                                    ),
                                    items: address_data.map((item) {
                                      return DropdownMenuItem(
                                          value: item.addressProof.toString(),
                                          child: Text(
                                            item.addressProof,
                                            style: const TextStyle(
                                              fontSize: 17.0,
                                            ),
                                          ));
                                    }).toList(),
                                    onChanged: (String? newVal) {
                                      State(() {
                                        addressProof = newVal;
                                        print(addressProof.toString());
                                      });
                                    },
                                    value: addressProof,
                                  ),
                                ))),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                            "Enter your address details exactly as per your document otherwise your application will get rejected",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                  color: Color(0xffFFC440),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                            )),
                        _space,
                        Text(
                          "Add New Address",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ),
                        ),
                        _space1,
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  width: 1, color: AppColors.textColor),
                              color: Colors.white),
                          child: TextField(
                            controller: addressLine1,
                            autofocus: false,
                            style: ConstStyle.sourceSans5,
                            decoration: const InputDecoration(
                              hintText: "ADDRESS LINE 1",
                              hintStyle: TextStyle(color: Color(0xff22263D)),
                              border: InputBorder.none,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.only(
                                  left: 14.0, bottom: 7.0, top: 6.0),
                            ),
                          ),
                        ),
                        _space,
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(width: 1, color: Colors.white),
                              color: Colors.white),
                          child: TextField(
                            controller: addressLine2,
                            autofocus: false,
                            style: ConstStyle.sourceSans5,
                            decoration: const InputDecoration(
                              hintText: "ADDRESS LINE 2",
                              hintStyle: TextStyle(color: Color(0xff22263D)),
                              border: InputBorder.none,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.only(
                                  left: 14.0, bottom: 7.0, top: 6.0),
                            ),
                          ),
                        ),
                        _space,
                        Text(
                          "Pin Code",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ),
                        ),
                        _space1,
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(width: 1, color: Colors.white),
                              color: Colors.white),
                          child: TextField(
                            controller: addressZip,
                            autofocus: false,
                            style: ConstStyle.sourceSans5,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(6),
                            ],
                            decoration: const InputDecoration(
                              hintText: "Enter 6 digit zip code",
                              hintStyle: TextStyle(color: Color(0xff22263D)),
                              border: InputBorder.none,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.only(
                                  left: 14.0, bottom: 7.0, top: 6.0),
                            ),
                          ),
                        ),
                        _space,
                        Text(
                          "Select State",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ),
                        ),
                        _space1,
                        Container(
                            height: 45,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border:
                                Border.all(width: 1.1, color: Colors.white),
                                color: Colors.white),
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14.0),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2(
                                    hint: const Text(
                                      "Select State",
                                      style:
                                      TextStyle(color: Color(0xff22263D)),
                                    ),
                                    items: state_data.map((item) {
                                      return DropdownMenuItem(
                                          value: item.stateId.toString(),
                                          child: Text(
                                            item.stateName,
                                            //Names that the api dropdown contains
                                            style: const TextStyle(
                                              fontSize: 17.0,
                                            ),
                                          ) //Id that has to be passed that the dropdo  //e.g   India (Name)    and   its   ID (55fgf5f6frf56f) somethimg like that....
                                      );
                                    }).toList(),
                                    onChanged: (String? newVal) {
                                      State(() {
                                        stateid = newVal;
                                        getCityList(stateid!);
                                      });
                                    },
                                    value: stateid,
                                  ),
                                ))),
                        _space,
                        Text(
                          "Select City",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ),
                        ),
                        _space1,
                        Container(
                            height: 45,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border:
                                Border.all(width: 1.1, color: Colors.white),
                                color: Colors.white),
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14.0),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2(
                                    hint: const Text("Select City",
                                        style: TextStyle(
                                            color: Color(0xff22263D))),
                                    items: city_data.map((item) {
                                      return DropdownMenuItem(
                                          value: item.cityName.toString(),
                                          child: Container(
                                            width: 200,
                                            child: Text(
                                              item.cityName,
                                              overflow: TextOverflow.ellipsis,
                                              //Names that the api dropdown contains
                                              style: const TextStyle(
                                                fontSize: 17.0,
                                              ),
                                            ),
                                          ));
                                    }).toList(),
                                    onChanged: (String? newVal) {
                                      State(() {
                                        cityid = newVal;
                                        print(cityid.toString());
                                      });
                                    },
                                    value: cityid,
                                  ),
                                ))),
                        _space,
                        Center(
                          child: Container(
                            height: 290,
                            width: MediaQuery.of(context).size.width / 1.12,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    width: 0.5, color: Color(0xff707070))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 45,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    ),
                                    color: Color(0xffE1E0E7),
                                    border: Border.all(
                                        width: 0.5, color: Color(0xff707070)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "$addressProof Frontside Preview",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: const TextStyle(
                                            color: Color(0xff22263D),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),
                                ),
                                _space,
                                Stack(
                                  children: [
                                    Center(
                                      child: Container(
                                        height: 160,
                                        width: 300,
                                        child: frontImage != null
                                            ? Image.file(
                                          frontImage!,
                                          fit: BoxFit.cover,
                                        )
                                            : InkWell(
                                          onTap: () async {
                                            final pickedFile =
                                            await _picker.getImage(
                                                source: ImageSource
                                                    .camera,
                                                imageQuality: 50);
                                            if (pickedFile != null) {
                                              State(() {
                                                frontImage =
                                                    File(pickedFile.path);
                                                isFrontImageClick = true;
                                              });
                                            }
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Center(
                                                child: SvgPicture.asset(
                                                  ConstantImage.upload,
                                                  height: 50,
                                                ),
                                              ),
                                              Center(
                                                child: Text(
                                                  "Upload Your $addressProof Frontside ",
                                                  style: GoogleFonts
                                                      .sourceSansPro(
                                                    textStyle:
                                                    const TextStyle(
                                                        color: Color(
                                                            0xff22263D),
                                                        fontWeight:
                                                        FontWeight
                                                            .w500,
                                                        fontSize: 15),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: -5,
                                      child: InkWell(
                                        onTap: () async {
                                          final pickedFile =
                                          await _picker.getImage(
                                              source: ImageSource.camera);
                                          if (pickedFile != null) {
                                            State(() {
                                              frontImage =
                                                  File(pickedFile.path);
                                            });
                                          }
                                        },
                                        child: Visibility(
                                          visible: isFrontImageClick,
                                          child: Container(
                                            height: 20,
                                            width: 80,
                                            color: AppColors.primaryColor,
                                            child: Center(
                                                child: Text(
                                                  "Replace",
                                                  style: ConstStyle.quickStandSmall,
                                                )),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                _space,
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: RichText(
                                    text: const TextSpan(children: [
                                      TextSpan(
                                          text: "upload your ",
                                          style: TextStyle(
                                              fontStyle: FontStyle.italic,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff22263D))),
                                      TextSpan(
                                          text: "JPG, JPEG ",
                                          style: TextStyle(
                                              fontStyle: FontStyle.italic,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xffFF405A))),
                                      TextSpan(
                                          text: "or ",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff22263D))),
                                      TextSpan(
                                          text: "PNG ",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xffFF405A))),
                                      TextSpan(
                                          text: "in less than ",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff22263D))),
                                      TextSpan(
                                          text: "10 MB ",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xffFF405A))),
                                    ]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Container(
                            height: 290,
                            width: MediaQuery.of(context).size.width / 1.12,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    width: 0.5, color: Color(0xff707070))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 45,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    ),
                                    color: Color(0xffE1E0E7),
                                    border: Border.all(
                                        width: 0.5, color: Color(0xff707070)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "$addressProof Backside Preview",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: const TextStyle(
                                            color: Color(0xff22263D),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),
                                ),
                                _space,
                                Stack(
                                  children: [
                                    Center(
                                      child: Container(
                                        height: 160,
                                        width: 300,
                                        child: backImage != null
                                            ? Image.file(
                                          backImage!,
                                          fit: BoxFit.cover,
                                        )
                                            : InkWell(
                                          onTap: () async {
                                            final pickedFile =
                                            await _picker.getImage(
                                                source: ImageSource
                                                    .camera,
                                                imageQuality: 50);
                                            if (pickedFile != null) {
                                              State(() {
                                                backImage = File(
                                                  pickedFile.path,
                                                );
                                                isBackImageClick = true;
                                              });
                                            }
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Center(
                                                child: SvgPicture.asset(
                                                  ConstantImage.upload,
                                                  height: 50,
                                                ),
                                              ),
                                              Center(
                                                child: Text(
                                                  "Upload Your $addressProof Backside ",
                                                  style: GoogleFonts
                                                      .sourceSansPro(
                                                    textStyle:
                                                    const TextStyle(
                                                        color: Color(
                                                            0xff22263D),
                                                        fontWeight:
                                                        FontWeight
                                                            .w500,
                                                        fontSize: 15),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: -5,
                                      child: InkWell(
                                        onTap: () async {
                                          final pickedFile =
                                          await _picker.getImage(
                                              source: ImageSource.camera);
                                          if (pickedFile != null) {
                                            State(() {
                                              backImage = File(pickedFile.path);
                                            });
                                          }
                                        },
                                        child: Visibility(
                                          visible: isBackImageClick,
                                          child: Container(
                                            height: 20,
                                            width: 80,
                                            color: AppColors.primaryColor,
                                            child: Center(
                                                child: Text(
                                                  "Replace",
                                                  style: ConstStyle.quickStandSmall,
                                                )),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                _space,
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: RichText(
                                    text: const TextSpan(children: [
                                      TextSpan(
                                          text: "upload your ",
                                          style: TextStyle(
                                              fontStyle: FontStyle.italic,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff22263D))),
                                      TextSpan(
                                          text: "JPG, JPEG ",
                                          style: TextStyle(
                                              fontStyle: FontStyle.italic,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xffFF405A))),
                                      TextSpan(
                                          text: "or ",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff22263D))),
                                      TextSpan(
                                          text: "PNG ",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xffFF405A))),
                                      TextSpan(
                                          text: "in less than ",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff22263D))),
                                      TextSpan(
                                          text: "10 MB ",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xffFF405A))),
                                    ]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 55,
                          color: Color(0xffE1E0E7),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "TIP: Scan or take a photo of your passport on the white-coloured background to avoid rejection",
                              style: ConstStyle.sourceSansPro,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 45,
                                width: MediaQuery.of(context).size.width / 2.4,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.white)),
                                child: Center(
                                  child: Text(
                                    "Cancel",
                                    style: GoogleFonts.quicksand(
                                      textStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: () async {
                                if (addressProof == null) {
                                  Fluttertoast.showToast(
                                      msg: 'Select Address Proof');
                                } else if (addressLine1.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: "Enter Address Line1 ");
                                } else if (addressLine2.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: 'Enter Address Line2 ');
                                } else if (addressZip.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: 'Enter Your Pin Code');
                                } else if (stateid == null) {
                                  Fluttertoast.showToast(
                                      msg: 'Select Your State');
                                } else if (cityid == null) {
                                  Fluttertoast.showToast(
                                      msg: 'Select Your City');
                                } else {
                                  Navigator.pop(context);
                                  var updatemaidenName =
                                  await ProfileRepository().addPersonalDetails(
                                      firstName:
                                      getPersonalDetail!.firstname,
                                      lastName: getPersonalDetail!.lastname,
                                      addressLine1:
                                      addressLine1.text.toString(),
                                      addressLine2:
                                      addressLine2.text.toString(),
                                      addressLine3:
                                      getPersonalDetail?.addressLine3,
                                      addressZip:
                                      addressZip.text.toString(),
                                      maidenName: getPersonalDetail!
                                          .mothersMaidenName,
                                      professionID:
                                      getPersonalDetail!.occupation,
                                      proof: addressProof.toString(),
                                      stateId: stateid.toString(),
                                      cityID: cityid.toString(),
                                      genderIndex:
                                      getPersonalDetail!.gender,
                                      maritalIndex:
                                      getPersonalDetail!.marriedStatus,
                                      incomeIndex:
                                      getPersonalDetail!.annualIncome,
                                      experienceIndex: getPersonalDetail!
                                          .tradingExperience,
                                      dob: DateFormat('dd-MM-yyyy').format(
                                          DateTime.parse(getPersonalDetail!
                                              .dob
                                              .toString())),
                                      politicallyexposed: getPersonalDetail!
                                          .isPoliticallyExposed,
                                      wouldyouliketoActivate:
                                      getPersonalDetail!
                                          .wouldYouLikeToActivate,
                                      chekbox1: getPersonalDetail!
                                          .checkBoxShareDataWithCompany,
                                      chekbox2: getPersonalDetail!
                                          .checkBoxShareDataWithGovt,
                                      itrFiled: 0);
                                  print("===9856 $updatemaidenName");
                                  if (updatemaidenName != "") {
                                    getPersonalDetails();
                                    openConfirmBottomSheet();
                                    setState(() {
                                      isAddressUpdated = true;
                                    });
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: "something went wrong");
                                  }
                                }
                              },
                              child: Container(
                                height: 45,
                                width: MediaQuery.of(context).size.width / 2.4,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.white)),
                                child: Center(
                                  child: Text(
                                    "Update",
                                    style: GoogleFonts.quicksand(
                                      textStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }

  static updateExperienceBottomSheet() {
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
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (BuildContext context, State) {
          return Padding(
            padding: EdgeInsets.only(
                top: 0,
                right: 0,
                left: 0,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Wrap(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color: AppColors.primaryColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "What is Your trading expirience? ",
                        style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              State(() {
                                experienceIndex = 1;
                              });
                            },
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x29000000),
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                  border:
                                  Border.all(width: 1, color: Colors.white),
                                  color: experienceIndex == 1
                                      ? Colors.white
                                      : Color(0xff22263D)),
                              child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Text(
                                      "Less than 1 Year",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: TextStyle(
                                            color: experienceIndex == 1
                                                ? Color(0xff22263D)
                                                : Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {
                              State(() {
                                experienceIndex = 2;
                              });
                            },
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x29000000),
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                  border:
                                  Border.all(width: 1, color: Colors.white),
                                  color: experienceIndex == 2
                                      ? Colors.white
                                      : Color(0xff22263D)),
                              child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Text(
                                      "1-2 Years",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: TextStyle(
                                            color: experienceIndex == 2
                                                ? Color(0xff22263D)
                                                : Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {
                              State(() {
                                experienceIndex = 3;
                              });
                            },
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x29000000),
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                  border:
                                  Border.all(width: 1, color: Colors.white),
                                  color: experienceIndex == 3
                                      ? Colors.white
                                      : Color(0xff22263D)),
                              child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Text(
                                      "2-5 Years",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: TextStyle(
                                            color: experienceIndex == 3
                                                ? Color(0xff22263D)
                                                : Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              State(() {
                                experienceIndex = 4;
                              });
                            },
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x29000000),
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                  border:
                                  Border.all(width: 1, color: Colors.white),
                                  color: experienceIndex == 4
                                      ? Colors.white
                                      : Color(0xff22263D)),
                              child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Text(
                                      "5-10 Years",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: TextStyle(
                                            color: experienceIndex == 4
                                                ? Color(0xff22263D)
                                                : Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {
                              State(() {
                                experienceIndex = 5;
                              });
                            },
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x29000000),
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                  border:
                                  Border.all(width: 1, color: Colors.white),
                                  color: experienceIndex == 5
                                      ? Colors.white
                                      : Color(0xff22263D)),
                              child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Text(
                                      "10-20 Years",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: TextStyle(
                                            color: experienceIndex == 5
                                                ? Color(0xff22263D)
                                                : Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {
                              State(() {
                                experienceIndex = 6;
                              });
                            },
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x29000000),
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                  border:
                                  Border.all(width: 1, color: Colors.white),
                                  color: experienceIndex == 6
                                      ? Colors.white
                                      : Color(0xff22263D)),
                              child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Text(
                                      "20-25 Years",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: TextStyle(
                                            color: experienceIndex == 6
                                                ? Color(0xff22263D)
                                                : Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              State(() {
                                experienceIndex = 7;
                              });
                            },
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x29000000),
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                  border:
                                  Border.all(width: 1, color: Colors.white),
                                  color: experienceIndex == 7
                                      ? Colors.white
                                      : Color(0xff22263D)),
                              child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Text(
                                      "Above 25 Years",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: TextStyle(
                                            color: experienceIndex == 7
                                                ? Color(0xff22263D)
                                                : Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 45,
                              width: MediaQuery.of(context).size.width / 2.4,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.white)),
                              child: Center(
                                child: Text(
                                  "Cancel",
                                  style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () async {
                              Navigator.pop(context);
                              var updateExperience = await ProfileRepository()
                                  .addPersonalDetails(
                                  firstName: getPersonalDetail!.firstname,
                                  lastName: getPersonalDetail!.lastname,
                                  addressLine1:
                                  getPersonalDetail!.addressLine1,
                                  addressLine2:
                                  getPersonalDetail!.addressLine2,
                                  addressLine3:
                                  getPersonalDetail?.addressLine3,
                                  addressZip: getPersonalDetail!.addressZip,
                                  maidenName:
                                  getPersonalDetail!.mothersMaidenName,
                                  professionID:
                                  getPersonalDetail!.occupation,
                                  proof: getPersonalDetail!.proofType,
                                  stateId: getPersonalDetail!.addressState,
                                  cityID: getPersonalDetail!.addressCity,
                                  genderIndex: getPersonalDetail!.gender,
                                  maritalIndex:
                                  getPersonalDetail!.marriedStatus,
                                  incomeIndex:
                                  getPersonalDetail!.annualIncome,
                                  experienceIndex: experienceIndex,
                                  dob: DateFormat('dd-MM-yyyy').format(
                                      DateTime.parse(getPersonalDetail!.dob
                                          .toString())),
                                  politicallyexposed: getPersonalDetail!
                                      .isPoliticallyExposed,
                                  wouldyouliketoActivate: getPersonalDetail!
                                      .wouldYouLikeToActivate,
                                  chekbox1: getPersonalDetail!
                                      .checkBoxShareDataWithCompany,
                                  chekbox2: getPersonalDetail!
                                      .checkBoxShareDataWithGovt,
                                  itrFiled: 0);
                              if (updateExperience != "") {
                                getPersonalDetails();
                                openConfirmBottomSheet();
                              } else {
                                Fluttertoast.showToast(
                                    msg: "something went wrong");
                              }
                            },
                            child: Container(
                              height: 45,
                              width: MediaQuery.of(context).size.width / 2.4,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.white)),
                              child: Center(
                                child: Text(
                                  "Update",
                                  style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }

  static updateMaidenNameBottomSheet() {
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
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (BuildContext context, State) {
          return Padding(
            padding: EdgeInsets.only(
                top: 0,
                right: 0,
                left: 0,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Wrap(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color: AppColors.primaryColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Mother's Maiden Name? ",
                        style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Form(
                        autovalidateMode: AutovalidateMode.always,
                        key: _formKey,
                        child: TextFormField(
                          controller: maidenName,
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.words,
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
                                color: Color(0xffC8C7CE), letterSpacing: 3),
                            hintText: "Enter maiden name",
                            contentPadding:
                            EdgeInsets.only(left: 14.0, top: 0.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 45,
                              width: MediaQuery.of(context).size.width / 2.4,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.white)),
                              child: Center(
                                child: Text(
                                  "Cancel",
                                  style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () async {
                              if (maidenName.text.isNotEmpty) {
                                Navigator.pop(context);
                                var updatemaidenName = await ProfileRepository()
                                    .addPersonalDetails(
                                    firstName: getPersonalDetail!.firstname,
                                    lastName: getPersonalDetail!.lastname,
                                    addressLine1:
                                    getPersonalDetail!.addressLine1,
                                    addressLine2:
                                    getPersonalDetail!.addressLine2,
                                    addressLine3:
                                    getPersonalDetail?.addressLine3,
                                    addressZip:
                                    getPersonalDetail!.addressZip,
                                    maidenName: maidenName.text.toString(),
                                    professionID:
                                    getPersonalDetail!.occupation,
                                    proof: getPersonalDetail!.proofType,
                                    stateId:
                                    getPersonalDetail!.addressState,
                                    cityID: getPersonalDetail!.addressCity,
                                    genderIndex: getPersonalDetail!.gender,
                                    maritalIndex:
                                    getPersonalDetail!.marriedStatus,
                                    incomeIndex:
                                    getPersonalDetail!.annualIncome,
                                    experienceIndex: getPersonalDetail!
                                        .tradingExperience,
                                    dob: DateFormat('dd-MM-yyyy').format(
                                        DateTime.parse(getPersonalDetail!
                                            .dob
                                            .toString())),
                                    politicallyexposed: getPersonalDetail!
                                        .isPoliticallyExposed,
                                    wouldyouliketoActivate:
                                    getPersonalDetail!
                                        .wouldYouLikeToActivate,
                                    chekbox1: getPersonalDetail!
                                        .checkBoxShareDataWithCompany,
                                    chekbox2: getPersonalDetail!
                                        .checkBoxShareDataWithGovt,
                                    itrFiled: 0);
                                print("===9856 $updatemaidenName");
                                if (updatemaidenName != "") {
                                  getPersonalDetails();
                                  openConfirmBottomSheet();
                                } else {
                                  Fluttertoast.showToast(
                                      msg: "something went wrong");
                                }
                              }
                            },
                            child: Container(
                              height: 45,
                              width: MediaQuery.of(context).size.width / 2.4,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.white)),
                              child: Center(
                                child: Text(
                                  "Update",
                                  style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }*/

  static openConfirmBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isDismissible: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(35),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (context) {
          Future.delayed(Duration(seconds: 5), () {
            Navigator.pop(context);
          });
          return BottomSheet(
            builder: (BuildContext context) {
              return StatefulBuilder(builder: (BuildContext context, State) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.27,
                  decoration: const BoxDecoration(
                    color: AppColors.textColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 35,
                      ),
                      Image.asset(
                        ConstantImage.update,
                        width: 75,
                        height: 75,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Center(
                        child: Text(
                          "Your personal detail updated \nsuccessfully.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 18),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                );
              });
            },
            onClosing: () {},
          );
        });
  }
}

