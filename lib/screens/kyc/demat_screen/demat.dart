import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/model/all_demat_response_data.dart';
import 'package:trust_money/model/get_demate_account_response_data.dart';
import 'package:trust_money/repositories/demat_repository.dart';
import 'package:trust_money/screens/animated_screens/existing_demat_animation.dart';
import 'package:trust_money/screens/kyc/demat_screen/demat_bottom_sheets.dart';
import 'package:trust_money/screens/kyc/demat_screen/e_sign_pdf.dart';
import 'package:trust_money/screens/kyc/demat_screen/mendatory_question.dart';
import 'package:trust_money/screens/kyc/demat_screen/nominee.dart';
import 'package:trust_money/utils/colorsConstant.dart';
import 'package:trust_money/utils/images.dart';
import 'package:trust_money/utils/sharedPreference.dart';
import 'package:trust_money/utils/styles.dart';

import '../../../api/apiClient.dart';
import '../../../getx_controller/profile/personal_details_controller.dart';
import '../../Congratulations/demat_success_congratulations.dart';
import '../profile/personal_detals/app_textfield.dart';
import 'existing_demat/download_demat_form/demat_form_view.dart';

class DematAccount extends StatefulWidget {
  DematAccount({Key? key}) : super(key: key);

  @override
  State<DematAccount> createState() => _DematAccountState();
}

class _DematAccountState extends State<DematAccount> {
  PersonalDetailsController _personalDetailsController =
      Get.put(PersonalDetailsController());
  bool existingDematAccountDetails = false;
  bool addNewDematAccounts = false;
  bool dematDetails = true;
  bool isNewDemat = false;
  bool isMandatory = true;
  bool isSignInDemat = false;
  bool formShow = false;
  bool isAddNominee = false;
  bool isExistingDematFill = false;
  bool isDisable = false;
  List<DematDetailModel> dematList = [];
  String Enble = "Enable";
  var dp_id = TextEditingController();
  var benificiary_id = TextEditingController();
  var dp_name = TextEditingController();
  AllDematAccountModel? alldematList;
  String? nsdlItemsvalue;
  int nsdlItemsvalueInt = 1;
  String customerID = "";

  var nsdlItems = [
    'NSDL',
    'CSDL',
  ];

  getDematDetails() async {
    var res1 = await DematDetailRepository().getAllDematDetails();
    print("printdetmatres $res1");
    customerID = await HelperFunctions.getCustomerID();
    setState(() {
      alldematList = res1;
      addNewDematAccounts = false;
      dematDetails = true;
    });
  }

  checkValidation() async {
    if (nsdlItemsvalue == null) {
      Fluttertoast.showToast(msg: 'Select Your Depository');
      return;
    } else if (dp_id.text.isEmpty || dp_id.text.toString().length < 6) {
      Fluttertoast.showToast(msg: "Enter Your DP ID");
      return;
    } else if (dp_id.text.toString() != benificiary_id.text.toString()) {
      DPIDNotMatchedBottomSheet();
    } else if (dp_name.text.isEmpty) {
      Fluttertoast.showToast(msg: "Enter Your DP Name");
      return;
    } else {
        var response = await APiProvider().addExistingDemat(
          nsdlItemsvalueInt,
          customerID,
          dp_id.text.toString(),
          benificiary_id.text.toString(),
          dp_name.text.toString(),
        );
        debugPrint("Nominasdata $response");
        if (response != null) {
          // await HelperFunctions.saveuserkyccompleted(true);
          setState(() {
            existingDematAccountDetails = false;
            formShow = true;
          });
         // Get.to(const DematAccountComplete());
        }
      // final adddematDetailModel = await DematDetailRepository().addExistingDemat(
      //   nsdlItemsvalueInt,
      //   customerID,
      //   dp_id.text.toString(),
      //   benificiary_id.text.toString(),
      //   dp_name.text.toString(),
      // );
      // if (adddematDetailModel != null) {
      //   Get.back();
      //   Get.to(() => const ExistingDematAnimation());
      //   await HelperFunctions.saveuserkyccompleted(true);
      //   setState(() {existingDematAccountDetails = false;});
      // } else {
      //   Get.back();
      // }
    }
  }

  deleteDematAccount(int dematID) async {
    var response = await APiProvider().deletExistingDematAccount(dematID);
    if (response != null) {
      getDematDetails();
    }
  }

  @override
  void initState() {
    getDematDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Column(
        children: [
          Visibility(visible: dematDetails, child: dematDetail()),
          Visibility(visible: addNewDematAccounts, child: addNewDematAccount()),
          Visibility(
              visible: existingDematAccountDetails,
              child: existingDematAccountDetail()),
          Visibility(
              visible: isNewDemat,
              child: MandatoryQuestion(
                onClick1: () {
                  setState(() {
                    isSignInDemat = false;
                    isAddNominee = true;
                    print("====46564 $isAddNominee");
                    isNewDemat = false;
                  });
                },
              )),
          Visibility(
              visible: isAddNominee,
              child: Nominee(
                onClick1: () {
                  setState(() {
                    isSignInDemat = true;
                    isAddNominee = false;
                    isNewDemat = false;
                  });
                },
              )),
          Visibility(visible: isSignInDemat, child: const ESignPDF()),
          Visibility(visible: formShow, child:  FormView(onClick1: () {
            setState((){
              isSignInDemat = true;
              formShow = false;
            });
          },)),
        ],
      ),
    );
  }

  Widget dematDetail() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color(0xffF7F7FA).withOpacity(0.35),
            border: Border.all(width: 1.2, color: Color(0xffbcbcbc))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Demat Details",
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: Color(0xff22263D),
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          height: 3,
                          width: 150,
                          color: Color(0xFF23263B),
                        )
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          addNewDematAccounts = true;
                          dematDetails = false;
                        });
                      },
                      child: Container(
                        height: 35,
                        width: 142,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.textColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.add,
                              size: 16,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Add New Account",
                              style: GoogleFonts.sourceSansPro(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              _space,
              Text(
                "You can add up to 3 demat accounts",
                style: GoogleFonts.sourceSansPro(
                  textStyle: const TextStyle(
                      color: Color(0xff22263D),
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              ),
              _space,
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: alldematList?.existDemat == null
                    ? 0
                    : alldematList!.existDemat.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: SizedBox(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.73,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: alldematList!.existDemat[index].isEnable
                                    ? [
                                        Color(0xffFBF2F3),
                                        Color(0xffF8C1C6),
                                      ]
                                    : [
                                        Color(0xffE3E2E5),
                                        Color(0xffC8C7CE),
                                      ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                            ),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20.0),
                                          child: Image.asset(
                                            "assets/images/arrow.png",
                                            height: 45,
                                            width: 55,
                                            color: alldematList!
                                                    .existDemat[index].isEnable
                                                ? AppColors.textColor
                                                : Color(0xff8F919D),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                            height: 20,
                                            width: 80,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(8),
                                                    topLeft:
                                                        Radius.circular(8)),
                                                color: alldematList!
                                                        .existDemat[index]
                                                        .isEnable
                                                    ? Color(0xffffc440)
                                                    : Color(0xffB3B3B5)),
                                            child: Center(
                                                child: Text(
                                              "PRIMARY",
                                              style: GoogleFonts.sourceSansPro(
                                                textStyle: TextStyle(
                                                  color: alldematList!
                                                          .existDemat[index]
                                                          .isEnable
                                                      ? AppColors.textColor
                                                      : Color(0xffE1E0E6),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.30,
                                            child: Text(
                                                alldematList!
                                                    .existDemat[index].dpName,
                                                style:
                                                    GoogleFonts.sourceSansPro(
                                                  textStyle: TextStyle(
                                                      color: alldematList!
                                                              .existDemat[index]
                                                              .isEnable
                                                          ? AppColors.textColor
                                                          : Color(0xff8F919D),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 15,
                                                      letterSpacing: 0.75),
                                                )),
                                          ),
                                          Container(
                                            height: 16,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(5),
                                                  bottomRight:
                                                      Radius.circular(5)),
                                              color: alldematList!
                                                      .existDemat[index]
                                                      .isEnable
                                                  ? AppColors.textColor
                                                  : Color(0xffB3B3B5),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                              child: Center(
                                                  child: Text(
                                                alldematList!.existDemat[index]
                                                    .depository,
                                                style: TextStyle(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w500,
                                                  color: alldematList!
                                                          .existDemat[index]
                                                          .isEnable
                                                      ? Colors.white
                                                      : Color(0xffE1E0E6),
                                                ),
                                              )),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.40,
                                        child: Text(
                                          "Trust KYC",
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.sourceSansPro(
                                            textStyle: TextStyle(
                                              color: alldematList!
                                                      .existDemat[index]
                                                      .isEnable
                                                  ? AppColors.textColor
                                                  : Color(0xff8F919D),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 17,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.40,
                                        child: Text(
                                          alldematList != null
                                              ? alldematList!
                                                  .existDemat[index].dpId
                                              : " ",
                                          style: GoogleFonts.sourceSansPro(
                                            textStyle: TextStyle(
                                              color: alldematList!
                                                      .existDemat[index]
                                                      .isEnable
                                                  ? AppColors.textColor
                                                  : Color(0xff8F919D),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ]),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.16,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: alldematList!.existDemat[index].isEnable
                                    ? [
                                        Color(0xffFBF2F3),
                                        Color(0xffF8C1C6),
                                      ]
                                    : [
                                        Color(0xffE3E2E5),
                                        Color(0xffC8C7CE),
                                      ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              ),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      if (Enble == "Enable") {
                                        setState(() {
                                          Enble = "Disable";
                                        });
                                      } else {
                                        setState(() {
                                          Enble = "Enable";
                                        });
                                      }
                                      enableDisableBottomSheet(index);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 3),
                                      height: 25,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: alldematList!
                                                  .existDemat[index].isEnable
                                              ? Colors.transparent
                                              : const Color(0xffFF405A),
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          border: Border.all(
                                              width: 2,
                                              color: alldematList!
                                                      .existDemat[index]
                                                      .isEnable
                                                  ? const Color(0xff22263D)
                                                  : const Color(0xffFF405A))),
                                      child: Row(
                                        children: [
                                          alldematList!
                                                  .existDemat[index].isEnable
                                              ? Container()
                                              : Icon(
                                                  size: 20,
                                                  Icons.circle,
                                                  color: Colors.white,
                                                ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          alldematList!
                                                  .existDemat[index].isEnable
                                              ? Icon(
                                                  size: 20,
                                                  Icons.circle,
                                                  color: Color(0xff22263D),
                                                )
                                              : Container(),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Divider(
                                    thickness: 1,
                                    color: AppColors.textColor,
                                    endIndent: 15,
                                    indent: 15,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      DematBottomSheet()
                                          .confirmationBottomSheet(onClick: () {
                                        deleteDematAccount(alldematList!
                                                .existDemat[index]
                                                .existDematId ?? "");
                                      });
                                    },
                                    child: Image.asset(
                                      "assets/images/delete.png",
                                      scale: 3.5,
                                      color: alldematList!
                                              .existDemat[index].isEnable
                                          ? AppColors.textColor
                                          : Color(0xff8F919D),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: alldematList?.newDemat == null
                    ? 0
                    : alldematList!.newDemat.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: SizedBox(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.73,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xffFFFCF4),
                                  Color(0xffFCEAC4),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                            ),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20.0),
                                          child: Image.asset(
                                              "assets/images/arrow.png",
                                              height: 45,
                                              width: 55),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                            height: 20,
                                            width: 80,
                                            decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(8),
                                                    topLeft:
                                                        Radius.circular(8)),
                                                color: Color(0xffffc440)),
                                            child: Center(
                                                child: Text(
                                              "PRIMARY",
                                              style: ConstStyle.sourceSansPro,
                                            )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.30,
                                            child: Text(
                                              alldematList!.newDemat[index]
                                                  .primarySource,
                                              style: ConstStyle.sourceSansbname,
                                            ),
                                          ),
                                          Container(
                                            height: 16,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(5),
                                                  bottomRight:
                                                      Radius.circular(5)),
                                              color: AppColors.textColor,
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8.0),
                                              child: Center(
                                                  child: Text(
                                                "NSDL",
                                                style: TextStyle(
                                                    fontSize: 8,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white),
                                              )),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.40,
                                        child: Text(
                                          "Trust KYC",
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.sourceSansPro(
                                            textStyle: const TextStyle(
                                              color: Color(0xff22263D),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 17,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.40,
                                        child: Text(
                                          alldematList != null
                                              ? alldematList!.newDemat[index]
                                                  .dpAccountNumber
                                              : " ",
                                          style: GoogleFonts.sourceSansPro(
                                            textStyle: const TextStyle(
                                              color: Color(0xff22263D),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ]),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.16,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xffFEFBF3),
                                  Color(0xffFCE6B8),
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              ),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      if (Enble == "Enable") {
                                        setState(() {
                                          Enble = "Disable";
                                        });
                                      } else {
                                        setState(() {
                                          Enble = "Enable";
                                        });
                                      }
                                      enableDisableNewBottomSheet(index);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 3),
                                      height: 25,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: alldematList!
                                                  .newDemat[index].isEnable
                                              ? Colors.transparent
                                              : const Color(0xffFF405A),
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          border: Border.all(
                                              width: 2,
                                              color: alldematList!
                                                      .newDemat[index].isEnable
                                                  ? const Color(0xff22263D)
                                                  : const Color(0xffFF405A))),
                                      child: Row(
                                        children: [
                                          alldematList!.newDemat[index].isEnable
                                              ? Container()
                                              : Icon(
                                                  size: 20,
                                                  Icons.circle,
                                                  color: Colors.white,
                                                ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          alldematList!.newDemat[index].isEnable
                                              ? Icon(
                                                  size: 20,
                                                  Icons.circle,
                                                  color: Color(0xff22263D),
                                                )
                                              : Container(),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Divider(
                                    thickness: 1,
                                    color: AppColors.textColor,
                                    endIndent: 15,
                                    indent: 15,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      var response = await APiProvider().deletNewDematAccount(alldematList!.newDemat[index].newDematId ?? "");
                                      if (response != null) {
                                        getDematDetails();
                                      }
                                    },
                                    child: Image.asset(
                                      "assets/images/delete.png",
                                      scale: 3.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              _space,
            ],
          ),
        ),
      ),
    );
  }

  Widget addNewDematAccount() {
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color(0xffF7F7FA).withOpacity(0.35),
            border: Border.all(width: 1.2, color: Color(0xffbcbcbc))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Demat Details",
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                ),
              ),
              const Divider(
                thickness: 1,
                indent: 5,
                endIndent: 5,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Hey, Enter Your Demat Account Information",
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                      color: Color(0xff22263D),
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ),
              _space,
              _space,
              InkWell(
                onTap: () {
                  // onBankAddedBottomSheet();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          addNewDematAccounts = false;
                          dematDetails = false;
                          existingDematAccountDetails = true;
                        });
                      },
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                width: 1.5, color: Color(0xff23263B))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 15),
                          child: Center(
                              child: Text(
                            "Existing Demat",
                            style: ConstStyle.quickStandBtn,
                          )),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          addNewDematAccounts = false;
                          dematDetails = false;
                          existingDematAccountDetails = false;
                          isMandatory = true;
                          isNewDemat = true;
                        });
                      },
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                width: 1.5, color: Color(0xff23263B))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 15),
                          child: Center(
                              child: Text(
                            "Open New Demat",
                            style: ConstStyle.quickStandBtn,
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.45,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget existingDematAccountDetail() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color(0xffFFCFCFD).withOpacity(0.35),
            border: Border.all(width: 1.2, color: Color(0xffbcbcbc))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Existing Demat Account Details",
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                ),
              ),
              const Divider(
                thickness: 1,
                indent: 5,
                endIndent: 5,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Hey,${_personalDetailsController.modaltest.value != null ? _personalDetailsController.modaltest.value!.panName : ""} Enter Your Demat Account Information",
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                      color: Color(0xff22263D),
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Depository * ",
                style: GoogleFonts.sourceSansPro(
                  textStyle: const TextStyle(
                      color: Color(0xff22263D),
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
                        Border.all(width: 1.1, color: AppColors.borderColor),
                    color: Colors.white,
                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          hint: const Text("Select Depository",
                              style: TextStyle(
                                  color: Color(0xffC8C7CE), letterSpacing: 2)),
                          items: nsdlItems.map((item) {
                            return DropdownMenuItem(
                                value: item, child: Text(item));
                          }).toList(),
                          onChanged: (String? newVal) {
                            setState(() {
                              nsdlItemsvalue = newVal;
                              print(nsdlItemsvalue.toString());
                              if (nsdlItemsvalue == "NSDL") {
                                nsdlItemsvalueInt = 1;
                                print(nsdlItemsvalueInt.toString());
                              } else {
                                nsdlItemsvalueInt = 2;
                                print(nsdlItemsvalueInt.toString());
                              }
                            });
                          },
                          value: nsdlItemsvalue,
                        ),
                      ))),
              _space1,
              _space,
              AppText(
                title: 'DP-ID* ',
              ),
              _space1,
              AppTextField(
                textCapitalization: TextCapitalization.none,
                hint: 'Enter DP-ID ',
                controller: dp_id,
                lengthFormater: LengthLimitingTextInputFormatter(16),
                textInputType: TextInputType.number,
              ),
              _space,
              AppText(
                title: 'Re-enter DP-Id*  ',
              ),
              _space1,
              AppTextField(
                textCapitalization: TextCapitalization.none,
                hint: 'Re-enter DP-ID',
                controller: benificiary_id,
                lengthFormater: LengthLimitingTextInputFormatter(16),
                textInputType: TextInputType.number,
              ),
              _space,
              AppText(
                title: 'DP-Name*',
              ),
              _space1,
              Container(
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1.1, color: AppColors.borderColor),
                  color: Colors.white,
                ),
                child: TextField(
                  controller: dp_name,
                  autofocus: false,
                  onChanged: (text) {
                    setState(() {
                      if (dp_name.text.length < 3) {
                        isDisable = false;
                      } else {
                        isDisable = true;
                      }
                    });
                  },
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                  style: GoogleFonts.sourceSansPro(
                    textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.w500,
                        fontSize: 19,
                        letterSpacing: 2),
                  ),
                  decoration: const InputDecoration(
                    hintText: "Enter DP-Name",
                    hintStyle: TextStyle(color: Color(0xffC8C7CE)),
                    border: InputBorder.none,
                    fillColor: Colors.white,
                    contentPadding:
                        EdgeInsets.only(left: 14.0, bottom: 7.0, top: 5.0),
                  ),
                ),
              ),
              _space1,
              _space,
              _space,
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: InkWell(
                  onTap: () async {
                    if (nsdlItemsvalue != null &&
                        dp_id.text.isNotEmpty &&
                        benificiary_id.text.isNotEmpty &&
                        dp_name.text.isNotEmpty) {
                      checkValidation();
                      setState(() {
                        isExistingDematFill = true;
                      });
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
                          color: isExistingDematFill == false
                              ? isDisable
                                  ? AppColors.textColor
                                  : const Color(0xffE1E0E6)
                              : const Color(0xffFF405A)),
                      color: isExistingDematFill == false
                          ? Colors.white
                          : Color(0xffFF405A),
                    ),
                    child: Center(
                        child: Text(
                      "Add Demat Account",
                      style: GoogleFonts.quicksand(
                        textStyle: TextStyle(
                            color: isExistingDematFill == false
                                ? isDisable
                                    ? AppColors.textColor
                                    : const Color(0xffE1E0E6)
                                : Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                    )),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget get _space => const SizedBox(height: 20);

  Widget get _space1 => const SizedBox(height: 3);

  void enableDisableBottomSheet(int index) {
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
          return BottomSheet(
            builder: (BuildContext context) {
              return StatefulBuilder(
                  builder: (BuildContext context, StateSetter State) {
                return Wrap(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
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
                            ConstantImage.error,
                            width: 75,
                            height: 75,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              "Are you sure?",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Center(
                            child: Text(
                              "Do you want to $Enble this?",
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 45,
                                  width:
                                      MediaQuery.of(context).size.width / 2.4,
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
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                  setState(() {
                                    alldematList!.existDemat[index].isEnable =
                                        !alldematList!
                                            .existDemat[index].isEnable;
                                    print(
                                        "bank_detail_list[index].isEnable ${alldematList!.existDemat[index].isEnable}");
                                  });
                                },
                                child: Container(
                                  height: 45,
                                  width:
                                      MediaQuery.of(context).size.width / 2.4,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.white),
                                      color: Colors.white),
                                  child: Center(
                                    child: Text(
                                      "Yes",
                                      style: GoogleFonts.quicksand(
                                        textStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.textColor),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              });
            },
            onClosing: () {},
          );
        });
  }

  void enableDisableNewBottomSheet(int index) {
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
          return BottomSheet(
            builder: (BuildContext context) {
              return StatefulBuilder(
                  builder: (BuildContext context, StateSetter State) {
                return Wrap(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
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
                            ConstantImage.error,
                            width: 75,
                            height: 75,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              "Are you sure?",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Center(
                            child: Text(
                              "Do you want to $Enble this?",
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 45,
                                  width:
                                      MediaQuery.of(context).size.width / 2.4,
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
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                  setState(() {
                                    alldematList!.newDemat[index].isEnable =
                                        !alldematList!.newDemat[index].isEnable;
                                  });
                                },
                                child: Container(
                                  height: 45,
                                  width:
                                      MediaQuery.of(context).size.width / 2.4,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.white),
                                      color: Colors.white),
                                  child: Center(
                                    child: Text(
                                      "Yes",
                                      style: GoogleFonts.quicksand(
                                        textStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.textColor),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              });
            },
            onClosing: () {},
          );
        });
  }

  void DPIDNotMatchedBottomSheet() {
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
                        ConstantImage.error,
                        width: 75,
                        height: 75,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          "Your DP-ID does not match. \nPlease try again.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
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

  Future<bool> _onBackPressed() async {
    if (addNewDematAccounts) {
      setState(() {
        dematDetails = true;
        addNewDematAccounts = false;
        existingDematAccountDetails = false;
        isNewDemat = false;
      });
      return Future.value(false);
    } else if (existingDematAccountDetails) {
      setState(() {
        dematDetails = false;
        addNewDematAccounts = true;
        existingDematAccountDetails = false;
        isNewDemat = false;
      });
      return Future.value(false);
    } else if (isNewDemat) {
      setState(() {
        dematDetails = false;
        addNewDematAccounts = true;
        existingDematAccountDetails = false;
        isNewDemat = false;
      });
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}
