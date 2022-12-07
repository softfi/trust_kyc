import 'dart:io';

import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../model/get_pan_response_data.dart';
import '../../model/get_personal_detail_response.dart';
import '../../repositories/profile_repository.dart';
import '../../utils/colorsConstant.dart';
import '../../utils/images.dart';
import '../../utils/sharedPreference.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';

class MyPersonalDetails extends StatefulWidget {
  const MyPersonalDetails({Key? key}) : super(key: key);

  @override
  State<MyPersonalDetails> createState() => _MyPersonalDetailsState();
}

class _MyPersonalDetailsState extends State<MyPersonalDetails> {
  bool potentially_exposed_status = false;
  int potentially_exposed_statusInt = 0;
  bool activate_future = false;
  int activate_futureInt = 0;
  bool isGoogleSign = true;
  bool isEmailVerified = false;
  bool isPanVerify = false;
  bool isChecked = false;
  bool isChecked1 = false;
  int isCheckedInt = 0;
  int isChecked1Int = 0;
  bool isButtonClick = false;
  var firstName = TextEditingController();
  var lastName = TextEditingController();
  var txtMob = TextEditingController();
  String? userfName, userlName, mobNo, mail;
  String dob = "DD/MM/YYYY";
  String dateOfBirth1 = "";
  DateTime currentStartDate = DateTime.now();
  GetPersonalDetailModel? personalData;
  PanStatusModel? panStatusModel;

  getPreferences() async {
    userfName = await HelperFunctions.getFirstName();
    userlName = await HelperFunctions.getLastName();
    mobNo = await HelperFunctions.getPhoneNumber();
    dateOfBirth1 = await HelperFunctions.getDOB();
    mail = await HelperFunctions.getEmailId();
    print("============Email $mobNo");
    firstName.text = userfName.toString();
    lastName.text = userlName.toString();
    setState(() {});
  }

  getPersonalDetails() async {
    var res1 = await ProfileRepository().getProfileDetails();
    print("============987 $res1");
    if (res1 != null) {
      personalData = res1;
      if (personalData!.isEmailVerified == 1) {
        isGoogleSign = false;
        isEmailVerified = true;
        getPANCard(personalData!.panNumber);
        setState(() {});
      }
    }
  }

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? pickedStartDate = await showDatePicker(
        context: context,
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData(primarySwatch: Colors.blue),
            child: child ?? Text(""),
          );
        },
        initialDate: currentStartDate,
        firstDate: DateTime(1900),
        lastDate: DateTime.now());
    final today = DateTime.now();
    final fiftyDaysAgo = today.subtract(const Duration(days: 6480));
    print("=======87856 ${DateFormat('dd-MM-yyyy').format(fiftyDaysAgo)}");
    final date2 = DateFormat('dd-MM-yyyy').format(fiftyDaysAgo);
    if (pickedStartDate != null && pickedStartDate != currentStartDate) {
      setState(() {
        // you can change the format here
        currentStartDate = pickedStartDate;
        dob = DateFormat('dd-MM-yyyy').format(pickedStartDate);

        if (dob != date2) {
          //Fluttertoast.showToast(msg: "Your Age should be minimum 18 years!");
        }
        print("dob " + dob.toString());
        HelperFunctions.saveDOB(dob.toString());
      });
    }
  }

  getPANCard(String pNumber) async {
    panStatusModel = await ProfileRepository().getPanCard(pNumber);
    if (panStatusModel != null) {
      print(
          "============PANIPV ${panStatusModel?.personVideoVerificationStatus}");
    }
  }

  @override
  void initState() {
    getPreferences();
    getPersonalDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [editPersonalDetails()],
      ),
    );
  }

  Widget get _space => const SizedBox(height: 20);

  Widget get _space1 => const SizedBox(height: 3);

  Widget editPersonalDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color(0xffF7F7FA).withOpacity(0.35),
            border: Border.all(width: 1.2, color: const Color(0xffbcbcbc))),
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 15.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
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
                ],
              ),
              const Divider(
                thickness: 1,
                indent: 5,
                endIndent: 5,
              ),
              _space,
              Visibility(
                visible: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        "First Name* ",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
                              color: Color(0xff22263D),
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        ),
                      ),
                    ),
                    _space1,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              width: 1, color: AppColors.borderColor),
                          color: Colors.white,
                        ),
                        child: TextField(
                          controller: firstName,
                          autofocus: false,
                          onChanged: (value) {
                            setState(() async {
                              await HelperFunctions.saveFirstName("$value");
                              print("jkwhfegf $value ");
                            });
                          },
                          style: ConstStyle.sourceSans5,
                          textCapitalization: TextCapitalization.words,
                          decoration: const InputDecoration(
                            hintText: "Enter First Name",
                            hintStyle: TextStyle(color: Color(0xffC8C7CE)),
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.only(
                                left: 14.0, bottom: 7.0, top: 6.0),
                          ),
                        ),
                      ),
                    ),
                    _space,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child:
                          Text("Last Name* ", style: ConstStyle.sourceSansPro),
                    ),
                    _space1,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              width: 1, color: AppColors.borderColor),
                          color: Colors.white,
                        ),
                        child: TextField(
                          controller: lastName,
                          autofocus: false,
                          onChanged: (value) {
                            setState(() async {
                              await HelperFunctions.saveLastName("$value");
                              print("jkwhfegf $value ");
                            });
                          },
                          style: ConstStyle.sourceSans5,
                          textCapitalization: TextCapitalization.words,
                          decoration: const InputDecoration(
                            hintText: "Enter Last Name",
                            hintStyle: TextStyle(color: Color(0xffC8C7CE)),
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.only(
                                left: 14.0, bottom: 7.0, top: 6.0),
                          ),
                        ),
                      ),
                    ),
                    _space,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text("Mobile Number* ",
                          style: ConstStyle.sourceSansPro),
                    ),
                    _space1,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                width: 1.1, color: AppColors.borderColor),
                            color: Color(0xffF7F7FA)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    "assets/images/india.png",
                                    scale: 4,
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    "+91 $mobNo",
                                    style: ConstStyle.sourceSansmob,
                                  ),
                                ],
                              ),
                              Image.asset(
                                "assets/images/done1.png",
                                color: Colors.green,
                                scale: 6,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    _space,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text("Date of Birth - Should be as per Aadhaar ",
                          style: ConstStyle.sourceSansPro),
                    ),
                    _space1,
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _selectStartDate(context);
                            });
                          },
                          child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    width: 1.1, color: AppColors.borderColor),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(personalData!=null?
                                      personalData!.dob != null
                                          ? DateFormat('dd-MM-yyyy').format(
                                              DateTime.parse(
                                                  personalData!.dob.toString()))
                                          : dob.toString():dob.toString()??"",
                                      style: ConstStyle.sourceSans5,
                                    ),
                                    Image.asset(
                                      "assets/images/calender.png",
                                      width: 25,
                                      height: 25,
                                    ),
                                  ],
                                ),
                              )),
                        )),
                    _space,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Are You Politically Exposed",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                  color: Color(0xff22263D),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            ),
                          ),
                          CustomSwitch(
                            activeColor: Colors.green,
                            value: potentially_exposed_status,
                            onChanged: (value) {
                              setState(() {
                                potentially_exposed_status = value;
                                if (value == true) {
                                  potentially_exposed_statusInt = 1;
                                  closeApplicationBottomSheet();
                                } else {
                                  potentially_exposed_statusInt = 0;
                                }
                                print("VALUE : $potentially_exposed_status");
                                print("VALUE : $value");
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    _space,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: Text(
                              Strings.active_check,
                              style: GoogleFonts.sourceSansPro(
                                textStyle: TextStyle(
                                    color: Color(0xff22263D),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                            ),
                          ),
                          CustomSwitch(
                            activeColor: Colors.green,
                            value: activate_future,
                            onChanged: (value) {
                              setState(() {
                                activate_future = value;
                                if (value == true) {
                                  activate_futureInt = 1;
                                } else {
                                  activate_futureInt = 0;
                                }
                                print("VALUE : $activate_futureInt");
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    _space,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          // color of tick Mark
                          activeColor: AppColors.primaryColor,
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                              if (value == true) {
                                isCheckedInt = 1;
                              } else {
                                isCheckedInt = 0;
                              }
                              print("VALUE : $isCheckedInt");
                            });
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 1.3,
                            child: const Text(
                                "I understand and agree to allow Trust Money to share my data with its group companies.",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff22263D))),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          // color of tick Mark
                          activeColor: AppColors.primaryColor,
                          value: isChecked1,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked1 = value!;
                              if (value == true) {
                                isChecked1Int = 1;
                              } else {
                                isChecked1Int = 0;
                              }
                              print("VALUE : $isChecked1Int");
                            });
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 1.3,
                            child: const Text(
                                "I understand and agree to allow Trust Money to share my data with companies mandated by the Govt.",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff22263D))),
                          ),
                        ),
                      ],
                    ),
                    _space,
                    _space1,
                    InkWell(
                      onTap: () {
                        if (isChecked == true && isChecked1 == true) {
                          if (dob != "DD/MM/YYYY" ||
                              personalData!.dob != null) {
                            getPreferences();
                            setState(() {
                              // isEditStep1 = false;
                              // isEditStep2 = true;
                              // isButtonClick = true;
                            });
                          } else {
                            Fluttertoast.showToast(
                                msg: "Choose your date of birth!");
                          }
                        } else {}
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                        ),
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
                                    ? (isChecked && isChecked1)
                                        ? AppColors.textColor
                                        : Color(0xffE1E0E6)
                                    : Color(0xffFF405A)),
                            color: isButtonClick == false
                                ? Colors.white
                                : Color(0xffFF405A),
                          ),
                          child: Center(
                              child: Text(
                            "Continue",
                            style: TextStyle(
                                color: isButtonClick == false
                                    ? (isChecked && isChecked1)
                                        ? AppColors.textColor
                                        : Color(0xffE1E0E6)
                                    : Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text('Save & Complete Later',
                          style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                  color: AppColors.textColor,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void closeApplicationBottomSheet() {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        var height = MediaQuery.of(context).size.height;
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: height * 0.04,
                          ),
                          Image.asset(
                            ConstantImage.profileError,
                            width: 75,
                            height: 75,
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Center(
                            child: Text(
                              "We apologise for the inconvenience.As per our policy, we are unable to proceed further, kindly call our customer service for further details.",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.04,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    exit(0);
                                  },
                                  child: Container(
                                    height: 45,
                                    width: 160,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1.5, color: Colors.white)),
                                    child: Center(
                                        child: Text(
                                      "Close Application",
                                      style: GoogleFonts.quicksand(
                                          textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500)),
                                    )),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {});
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    height: 45,
                                    width: 160,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1.5, color: Colors.white)),
                                    child: Center(
                                        child: Text(
                                      "Close Option",
                                      style: GoogleFonts.quicksand(
                                          textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500)),
                                    )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          );
        });
      },
    );
  }
}
