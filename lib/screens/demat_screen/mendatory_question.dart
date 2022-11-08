import 'dart:io';

import 'package:custom_switch/custom_switch.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trust_money/model/born_dropdown_response_data.dart';
import 'package:trust_money/model/wealth_dropdown_response_data.dart';
import 'package:trust_money/utils/colorsConstant.dart';
import 'package:trust_money/utils/images.dart';
import 'package:trust_money/utils/sharedPreference.dart';
import 'package:trust_money/utils/styles.dart';

import '../../repositories/demat_repository.dart';

class MandatoryQuestion extends StatefulWidget {
  final void Function()? onClick1;
  const MandatoryQuestion({Key? key,required this.onClick1}) : super(key: key);

  @override
  State<MandatoryQuestion> createState() => _MandatoryQuestionState();
}

class _MandatoryQuestionState extends State<MandatoryQuestion> {
  bool citizen_OfThe_USA = false;
  int citizen_OfThe_USAInt = 0;
  bool Country_Residency = true;
  int Country_ResidencyInt = 0;
  bool isMandatory = true;
  bool isAware = false;
  int isAwareInt = 0;
  bool aceeptTerm = false;
  int aceeptTermInt = 0;
  bool awareButtonClick = false;
  String? wealthID;
  String? bornID;
  List<WealthModel> wealth_list = [];
  List<BornModel> born_list = [];
  String? userfName;
  bool isUpload = false;
  bool isReplace = false;
  bool isSignatureUpdate = false;
  File? signatureImage;
  bool _isLoaderVisible = false;

  final _picker = ImagePicker();

  getPreferences() async {
    userfName = await HelperFunctions.getPanName();
    print("object $userfName");
    setState(() {});
  }

  wealthList() async {
    var data1 = await DematDetailRepository().wealthDropdown();
    setState(() {
      if (data1 != "") {
        wealth_list = data1;
        print("======>13 $data1");
      }
    });
  }

  bornList() async {
    var data1 = await DematDetailRepository().bornDropdown();
    setState(() {
      if (data1 != "") {
        born_list = data1;
        print("======>13 $data1");
      }
    });
  }

  @override
  void initState() {
    getPreferences();
    wealthList();
    bornList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(visible: isMandatory, child: mandatoryWidget()),
        Visibility(visible: isUpload, child: uploadImageWidget()),
      ],
    );
  }

  Widget mandatoryWidget(){
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color(0xffFFCFCFD).withOpacity(0.35),
            border: Border.all(width: 1.2, color: const Color(0xffbcbcbc))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                //Navigator.pop(context);
                setState(() {
                  // dematDetails = false;
                  // addNewDematAccounts = true;
                  // existingDematAccountDetails = false;
                  // isNewDemat = false;
                  // isMandatory = false;
                  // isSignInDemat = false;
                  // isAddNominee = false;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 25,
                    width: 70,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5)),
                        color: AppColors.textColor),
                    child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.highlight_remove,
                              color: Colors.white,
                              size: 14,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Close",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ],
                        )),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Text(
                        "Open Demat Account",
                        style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              color: Color(0xff22263D),
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          "STEP 1 of 4",
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _space,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    "Mandatory Questions",
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          color: Color(0xff22263D),
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    "Sebi Requires the following details to open your Demat account",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                          color: Color(0xff22263D),
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  ),
                ),
                _space,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    "Where were you born? ",
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
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            width: 1.1, color: AppColors.borderColor),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            hint: const Text(
                              "Select Region",
                              style: TextStyle(color: Color(0xffC8C7CE)),
                            ),
                            items: born_list.map((item) {
                              return DropdownMenuItem(
                                  value: item.countryName.toString(),
                                  child: Text(
                                    item.countryName,
                                    //Names that the api dropdown contains
                                    style: const TextStyle(
                                      fontSize: 17.0,
                                    ),
                                  ));
                            }).toList(),
                            onChanged: (String? newVal) {
                              setState(() {
                                bornID = newVal;
                                print(bornID.toString());
                              });
                            },
                            value: bornID,
                          ),
                        ),
                      )),
                ),
                _space,
                _space1,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Are you a citizen of the U.S.A?",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                                color: Color(0xff22263D),
                                fontWeight: FontWeight.w400,
                                fontSize: 15),
                          )),
                      CustomSwitch(
                        activeColor: Colors.green,
                        value: citizen_OfThe_USA,
                        onChanged: (value) {
                          print("VALUE : $value");
                          setState(() {
                            citizen_OfThe_USA = value;
                            if (value == true) {
                              citizen_OfThe_USAInt = 1;
                            } else {
                              citizen_OfThe_USAInt = 0;
                            }
                            print("VALUE : $citizen_OfThe_USAInt");
                          });
                        },
                      )
                    ],
                  ),
                ),
                _space,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.5,
                        child:
                        Text("Is Your Country Of Tax Residency, India?",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                  color: Color(0xff22263D),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15),
                            )),
                      ),
                      CustomSwitch(
                        activeColor: Colors.green,
                        value: Country_Residency,
                        onChanged: (value) {
                          print("VALUE : $value");
                          setState(() {
                            Country_Residency = value;
                            if (value == true) {
                              Country_ResidencyInt = 1;
                            } else {
                              Country_ResidencyInt = 0;
                            }
                            print("VALUE : $Country_ResidencyInt");
                          });
                        },
                      ),
                    ],
                  ),
                ),
                _space,
                _space1,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    "Your primary source of wealth?",
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
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            width: 1.1, color: AppColors.borderColor),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            hint: const Text(
                              "Select Primary Wealth",
                              style: TextStyle(color: Color(0xffC8C7CE)),
                            ),
                            items: wealth_list.map((item) {
                              return DropdownMenuItem(
                                  value: item.primarySourceOfWealthName
                                      .toString(),
                                  child: Text(
                                    item.primarySourceOfWealthName != null
                                        ? item.primarySourceOfWealthName
                                        : "",
                                    style: const TextStyle(
                                      fontSize: 17.0,
                                    ),
                                  ));
                            }).toList(),
                            onChanged: (String? newVal) {
                              setState(() {
                                wealthID = newVal;
                                print(wealthID.toString());
                              });
                            },
                            value: wealthID,
                          ),
                        ),
                      )),
                ),
                const SizedBox(
                  height: 120,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Row(
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
                        value: isAware,
                        onChanged: (bool? value) {
                          setState(() {
                            isAware = value!;
                            isAwareInt = 1;
                            print("=======int $isAwareInt");
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.4,
                          child: RichText(
                            text: const TextSpan(children: [
                              TextSpan(
                                  text: "I am aware & agree that ",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff22263D))),
                              TextSpan(
                                  text: "My Account Statements ",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xffFF405A))),
                              TextSpan(
                                  text:
                                  "will be in electronic & I do not require a ",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff22263D),
                                      fontWeight: FontWeight.w400)),
                              TextSpan(
                                  text: "DIS ",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xffFF405A),
                                      fontWeight: FontWeight.w400)),
                              TextSpan(
                                  text: "slip.",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff22263D),
                                      fontWeight: FontWeight.w400))
                            ]),
                          ),
                        ),
                      ),
                    ],
                  ),
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
                      value: aceeptTerm,
                      onChanged: (bool? value) {
                        setState(() {
                          aceeptTerm = value!;
                          aceeptTermInt = 1;
                          print("=======aceeptTermInt $aceeptTermInt");
                        });
                      },
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: RichText(
                        text: const TextSpan(children: [
                          TextSpan(
                              text: "I accept the ",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff22263D))),
                          TextSpan(
                              text: "Terms & Conditions",
                              style: TextStyle(
                                  fontSize: 12,
                                  decoration: TextDecoration.underline,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffFF405A))),
                        ]),
                      ),
                    ),
                  ],
                ),
                _space,
                InkWell(
                  onTap: () {
                    if (bornID != null &&
                        wealthID != null &&
                        isAware == true &&
                        aceeptTerm == true) {

                      setState(() {
                         isMandatory = false;
                         isUpload = true;
                         awareButtonClick = true;
                      });
                    }
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
                            blurRadius: 3.0,
                          ),
                        ],
                        border: Border.all(
                            width: 2,
                            color: awareButtonClick == false
                                ? (bornID != null &&
                                wealthID != null &&
                                isAware &&
                                aceeptTerm)
                                ? AppColors.textColor
                                : Color(0xffE1E0E6)
                                : Color(0xffFF405A)),
                        color: awareButtonClick == false
                            ? Colors.white
                            : Color(0xffFF405A),
                      ),
                      child: Center(
                          child: Text(
                            "Continue",
                            style: TextStyle(
                                color: awareButtonClick == false
                                    ? (bornID != null &&
                                    wealthID != null &&
                                    isAware &&
                                    aceeptTerm)
                                    ? AppColors.textColor
                                    : Color(0xffE1E0E6)
                                    : Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )),
                    ),
                  ),
                ),
              ],
            ),
            _space,
          ],
        ),
      ),
    );
  }

  Widget uploadImageWidget(){
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color(0xffFFCFCFD).withOpacity(0.35),
            border: Border.all(width: 1.2, color: const Color(0xffbcbcbc))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  isUpload = false;
                  isMandatory = true;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 25,
                    width: 70,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5)),
                        color: AppColors.textColor),
                    child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.highlight_remove,
                              color: Colors.white,
                              size: 14,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Close",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ],
                        )),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Text(
                        "Open Demat Account",
                        style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              color: Color(0xff22263D),
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          "STEP 2 of 4",
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _space1,
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    "Signature Upload",
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          color: Color(0xff22263D),
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    "Let’s Upload your Signature",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                          color: Color(0xff22263D),
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  ),
                ),
                _space,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Center(
                    child: Container(
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
                                "Signature Preview",
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
                            height: 12,
                          ),
                          InkWell(
                            onTap: () {
                              signatureExampleBottomSheet();
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0),
                              child: RichText(
                                text: const TextSpan(children: [
                                  TextSpan(
                                      text:
                                      "Ensure that you sign on a blank paper in a Clearly ",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff22263D))),
                                  TextSpan(
                                      text: "see example ",
                                      style: TextStyle(
                                          decoration:
                                          TextDecoration.underline,
                                          fontSize: 12,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xffFF405A))),
                                ]),
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
                                  child: signatureImage != null
                                      ? Image.file(
                                    signatureImage!,
                                    fit: BoxFit.cover,
                                  )
                                      : InkWell(
                                    onTap: () async {
                                      final pickedFile =
                                      await _picker.getImage(
                                          source:
                                          ImageSource.camera,
                                          imageQuality: 70);
                                      if (pickedFile != null) {
                                        setState(() {
                                          signatureImage =
                                              File(pickedFile.path);
                                          isReplace = true;
                                          isSignatureUpdate = true;
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
                                            "Upload Your Signature ",
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
                                    final pickedFile = await _picker.getImage(
                                        source: ImageSource.camera);
                                    if (pickedFile != null) {
                                      setState(() {
                                        signatureImage =
                                            File(pickedFile.path);
                                      });
                                    }
                                  },
                                  child: Visibility(
                                    visible: isReplace,
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
                                horizontal: 12.0, vertical: 10),
                            child: RichText(
                              text: const TextSpan(children: [
                                TextSpan(
                                    text: "upload your Signature ",
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
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 15),
                  child: InkWell(
                    onTap: () async {
                      EasyLoading.show(status: 'loading...');
                      if (isSignatureUpdate == true) {
                        if (signatureImage != null) {
                          var res = await DematDetailRepository()
                              .uploadSignature(file: signatureImage!);
                          if (res != "") {
                            var addDematDetailModel =
                            await DematDetailRepository().addNewDematAccount(
                                Bornregion: bornID!,
                                USAcitizen: citizen_OfThe_USAInt,
                                taxResidency: Country_ResidencyInt,
                                wealth: wealthID!,
                                check_box_terms_selected:
                                aceeptTermInt,
                                check_box_account_statement_electronic:
                                isAwareInt);
                            if (addDematDetailModel != "") {
                              EasyLoading.dismiss();
                              await HelperFunctions.saveuserkyccompleted(true);
                              uploadSignatureBottomSheet();
                            }
                          }
                        } else {
                          Fluttertoast.showToast(msg: "Select signature image first");
                        }
                      }
                    },
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x29000000),
                              blurRadius: 3.0,
                            ),
                          ],
                          border: Border.all(
                              width: 2,
                              color: isSignatureUpdate
                                  ? AppColors.textColor
                                  : Color(0xffE1E0E6)),
                          color: Colors.white),
                      child: Center(
                          child: Text(
                            "Continue",
                            style: GoogleFonts.quicksand(
                              textStyle: TextStyle(
                                  color: isSignatureUpdate
                                      ? AppColors.textColor
                                      : Color(0xffE1E0E6),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            ),
                          )),
                    ),
                  ),
                ),
              ],
            ),
            _space,
          ],
        ),
      ),
    );
  }

  void signatureExampleBottomSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(40),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (context) {
          return Wrap(
            children: <Widget>[
              Container(
                //height: MediaQuery.of(context).size.height * 0.70,
                decoration: const BoxDecoration(
                  color: AppColors.textColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Signature Examples",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.14,
                      height: 180,
                      child: Image.asset(
                        ConstantImage.sign1,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.14,
                      height: 180,
                      child: Image.asset(
                        ConstantImage.sign2,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20, bottom: 30),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                              border:
                              Border.all(width: 1.5, color: Colors.white)),
                          child: Center(
                              child: Text(
                                "Close",
                                style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500)),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }

  void uploadSignatureBottomSheet() {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(35),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (context) {
          return BottomSheet(
            builder: (BuildContext context) {
              return StatefulBuilder(builder: (BuildContext context, State) {
                return GestureDetector(
                  onTap: ()  {
                    setState(() {
                      isUpload = false;
                      isMandatory = false;
                    });
                    widget.onClick1!();
                    Navigator.pop(context);

                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => NewDematAnimation()));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.30,
                    decoration: const BoxDecoration(
                      color: AppColors.textColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35.0),
                        topRight: Radius.circular(35.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        Image.asset(
                          ConstantImage.profile,
                          width: 75,
                          height: 75,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Center(
                          child: Text(
                            "Congratulations! $userfName Signature Uploaded Successfully",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
            },
            onClosing: () {},
          );
        });
  }

  Widget get _space => const SizedBox(height: 20);

  Widget get _space1 => const SizedBox(height: 3);
}
