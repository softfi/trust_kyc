import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyContainer {
  static verifiedContainer() {
    return Container(
      height: 30,
      width: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7), color: Colors.green),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.check_circle_outline,
            size: 16,
            color: Colors.white,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            "Verified",
            style: GoogleFonts.sourceSansPro(
              textStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  static updateContainer() {
    return Container(
      height: 30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Color(0xff00C6D8)),
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
    );
  }

 /* void hintBottomSheet() {
    Get.bottomSheet(
        Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
                              getPersonalDetail!.addressLine3,
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
                              dob: dateOfBirth1,
                              // dob: DateFormat('dd-MM-yyyy').format(
                              //     DateTime.parse(getPersonalDetail!.dob
                              //         .toString())),
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
        enableDrag: false,
        backgroundColor: AppColors.textColor,
        isDismissible: false,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30))));
  }*/

}
