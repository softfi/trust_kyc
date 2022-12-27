import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/model/get_bank_detail_response_data.dart';
import 'package:trust_money/screens/kyc/bank_screen/ifsc_code.dart';
import 'package:trust_money/utils/images.dart';

import '../../../getx_controller/profile/personal_details_controller.dart';
import '../../../model/get_ifsc_code_response_data.dart';
import '../../../repositories/bank_detail_repository.dart';
import '../../../utils/colorsConstant.dart';
import 'bank_bottom_sheets.dart';

class BankAccounts extends StatefulWidget {
  const BankAccounts({
    Key? key,
    this.onClick,
  }) : super(key: key);
  final void Function()? onClick;

  @override
  State<BankAccounts> createState() => _BankAccountsState();
}

class _BankAccountsState extends State<BankAccounts> {
  PersonalDetailsController _personalDetailsController =
      Get.put(PersonalDetailsController());
  String enable = "Enable";
  bool inCheckCancelled = false;
  bool isDisable = false;
  bool enableGetBtn = false;
  bool showBankDetail = false;
  bool cardView = true;
  bool addBankView = false;
  bool isBankAdded = false;

  //bool bank_detail_list[index].isEnable = true;
  int savingIndex = 0;
  int jointIndex = 0;
  final ifscCode = TextEditingController();
  final bankAccountNo = TextEditingController();
  final confirmBankAcc = TextEditingController();
  List<BankDetailModel> bank_detail_list = [];
  GetIfscCdeModel? getIfscCdeModel;

  getbankDetail() async {
    var data = await BankDetailRepository().getBankDetails();
    setState(() {
      bank_detail_list = data;
      debugPrint("============143 $data");
    });
  }

  getIFSC(String ifsc) async {
    Get.dialog(const Center(
      child: CircularProgressIndicator(),
    ));
    getIfscCdeModel = await BankDetailRepository().getIFSCCode(ifsc);
    print("======>1122 $getIfscCdeModel");
    if (getIfscCdeModel != null) {
      Get.back();
      setState(() {
        showBankDetail = true;
      });
    }
  }

  checkValidation() async {
    if (ifscCode.text.isEmpty || ifscCode.text.toString().length < 10) {
      Fluttertoast.showToast(msg: 'Enter Your Valid IFSC Code');
      return;
    } else if (bankAccountNo.text.isEmpty ||
        bankAccountNo.text.toString().length < 10) {
      Fluttertoast.showToast(msg: 'Enter Your Valid Account Number');
      return;
    } else if (bankAccountNo.text.toString() !=
        confirmBankAcc.text.toString()) {
      BankBottomSheet().bankAccountNotMatchedBottomSheet(context);
    } else if (savingIndex == 0) {
      Fluttertoast.showToast(msg: 'Choose your account type1!');
    } else if (jointIndex == 0) {
      Fluttertoast.showToast(msg: 'Choose your account type2!');
    } else {
      Get.dialog(const Center(
        child: CircularProgressIndicator(),
      ));
      final addBankDetailModel = await BankDetailRepository().addbankDetails(
          ifscCode.text.toString(),
          bankAccountNo.text.toString(),
          savingIndex,
          jointIndex);
      if (addBankDetailModel != null) {
        Get.back();
        widget.onClick!();
      } else {
        BankBottomSheet().uploadCancelledChequeBottomSheet(context, inCheckCancelled);
      }
    }
  }

  deleteBankAccount(int bankDetailsId) async {
    Get.dialog(const Center(
      child: CircularProgressIndicator(),
    ));
    var res = await BankDetailRepository().deleteBankDetails(bankDetailsId);
    if (res != null) {
      Get.back();
      getbankDetail();
    }
  }

  @override
  void initState() {
    getbankDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Column(
        children: [
          Visibility(visible: cardView, child: cardDetail()),
          Visibility(visible: addBankView, child: bankDetail()),
        ],
      ),
    );
  }

  Widget cardDetail() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xffF7F7FA),
                border: Border.all(width: 1.2, color: const Color(0xffbcbcbc))),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
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
                              "Bank Details",
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
                              width: 133,
                              color: const Color(0xFF23263B),
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              addBankView = true;
                              cardView = false;
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
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "You can add more back account once your KYC is completed",
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
                    itemCount:
                        bank_detail_list == null ? 0 : bank_detail_list.length,
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
                                    colors: bank_detail_list[index].isEnable
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
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10)),
                                ),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 20.0),
                                              child: Image.asset(
                                                "assets/images/elefant.png",
                                                height: 45,
                                                width: 55,
                                                color: bank_detail_list[index]
                                                        .isEnable
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
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                            topRight:
                                                                Radius.circular(
                                                                    8),
                                                            topLeft:
                                                                Radius.circular(
                                                                    8)),
                                                    color: bank_detail_list[
                                                                index]
                                                            .isEnable
                                                        ? Color(0xffffc440)
                                                        : Color(0xffB3B3B5)),
                                                child: Center(
                                                    child: Text(
                                                  "PRIMARY",
                                                  style:
                                                      GoogleFonts.sourceSansPro(
                                                    textStyle: TextStyle(
                                                      color: bank_detail_list[
                                                                  index]
                                                              .isEnable
                                                          ? AppColors.textColor
                                                          : Color(0xffE1E0E6),
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.30,
                                                child: Text(
                                                    bank_detail_list[index]
                                                        .bankName,
                                                    style: GoogleFonts
                                                        .sourceSansPro(
                                                      textStyle: TextStyle(
                                                          color: bank_detail_list[
                                                                      index]
                                                                  .isEnable
                                                              ? AppColors
                                                                  .textColor
                                                              : Color(
                                                                  0xff8F919D),
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 15,
                                                          letterSpacing: 0.75),
                                                    )),
                                              ),
                                              Container(
                                                height: 16,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  5),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  5)),
                                                  color: bank_detail_list[index]
                                                          .isEnable
                                                      ? AppColors.textColor
                                                      : Color(0xffB3B3B5),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 8.0),
                                                  child: Center(
                                                      child: Text(
                                                    bank_detail_list[index]
                                                                .accountType1 ==
                                                            1
                                                        ? "Saving A/C"
                                                        : "Current A/C",
                                                    style: TextStyle(
                                                      fontSize: 8,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: bank_detail_list[
                                                                  index]
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
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.40,
                                            child: Text(
                                              bank_detail_list[index]
                                                  .accountNumber,
                                              style: GoogleFonts.sourceSansPro(
                                                textStyle: TextStyle(
                                                    color:
                                                        bank_detail_list[index]
                                                                .isEnable
                                                            ? AppColors
                                                                .textColor
                                                            : Color(0xff8F919D),
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 19,
                                                    letterSpacing: 2),
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
                                    colors: bank_detail_list[index].isEnable
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
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          if (enable == "Enable") {
                                            setState(() {
                                              enable = "Disable";
                                            });
                                          } else {
                                            setState(() {
                                              enable = "Enable";
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
                                              color: bank_detail_list[index]
                                                      .isEnable
                                                  ? Colors.transparent
                                                  : const Color(0xffFF405A),
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              border: Border.all(
                                                  width: 2,
                                                  color: bank_detail_list[index]
                                                          .isEnable
                                                      ? const Color(0xff22263D)
                                                      : const Color(
                                                          0xffFF405A))),
                                          child: Row(
                                            children: [
                                              bank_detail_list[index].isEnable
                                                  ? Container()
                                                  : Icon(
                                                      size: 20,
                                                      Icons.circle,
                                                      color: Colors.white,
                                                    ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              bank_detail_list[index].isEnable
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
                                          BankBottomSheet()
                                              .confirmationBottomSheet(
                                                  onClick: () {
                                            debugPrint(
                                                "========================");
                                            deleteBankAccount(
                                                bank_detail_list[index]
                                                    .bankDetailsId);
                                          });
                                        },
                                        child: Image.asset(
                                          "assets/images/delete.png",
                                          scale: 3.5,
                                          color:
                                              bank_detail_list[index].isEnable
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
                  _space,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget bankDetail() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color(0xffFCFCFD).withOpacity(0.35),
            border: Border.all(width: 1.2, color: Color(0xffbcbcbc))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Bank Details",
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
              _space,
              Text(
                "Hey ${_personalDetailsController.modaltest.value!.panName}, Enter Your Bank Details",
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                      color: Color(0xff22263D),
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
              ),
              Text(
                "We will deposit ₹1 in your bank account to verify it",
                style: GoogleFonts.sourceSansPro(
                  textStyle: const TextStyle(
                      color: Color(0xff22263D),
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              ),
              _space,
              Text(
                "IFSC Code ",
                style: GoogleFonts.sourceSansPro(
                  textStyle: const TextStyle(
                      color: Color(0xff22263D),
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
              ),
              _space1,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width / 1.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border:
                          Border.all(width: 1.1, color: AppColors.borderColor),
                    ),
                    child: TextField(
                      controller: ifscCode,
                      autofocus: false,
                      textCapitalization: TextCapitalization.characters,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(11),
                      ],
                      onChanged: (text) {
                        setState(() {
                          if (ifscCode.text.length < 11) {
                            enableGetBtn = false;
                            showBankDetail = false;
                          } else {
                            enableGetBtn = true;
                          }
                        });
                      },
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                            color: Color(0xff22263D),
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            letterSpacing: 4),
                      ),
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        hintText: "Enter IFSC code",
                        hintStyle: TextStyle(color: Color(0xffC8C7CE)),
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        contentPadding:
                            EdgeInsets.only(left: 14.0, bottom: 8.0, top: 5),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      if (enableGetBtn) {
                        getIFSC(ifscCode.text.toString());
                      }
                    },
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                          color: enableGetBtn
                              ? AppColors.textColor
                              : Color(0xffE3E2E5),
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Center(
                            child: Text("Get",
                                style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white)))),
                      ),
                    ),
                  )
                ],
              ),
              _space1,
              _space1,
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "Click here",
                    style: const TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Color(0xffFF405A)),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchIFSC()));
                      },
                  ),
                  const TextSpan(
                      text: "  for help with the IFSC code.",
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Color(0xff22263D))),
                ]),
              ),
              _space,
              Visibility(
                visible: showBankDetail,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              width: 1, color: const Color(0xffE1E0E6))),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              getIfscCdeModel != null
                                  ? getIfscCdeModel!.bank.toString()
                                  : "",
                              style: GoogleFonts.sourceSansPro(
                                textStyle: const TextStyle(
                                    color: Color(0xff22263d),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    letterSpacing: 1),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "IFSC Code",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: const TextStyle(
                                            color: Color(0xff90929E),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      getIfscCdeModel != null
                                          ? getIfscCdeModel!.ifsc.toString()
                                          : "",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: const TextStyle(
                                            color: Color(0xff22263D),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 120,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Branch",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: const TextStyle(
                                            color: Color(0xff90929E),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      getIfscCdeModel != null
                                          ? getIfscCdeModel!.branch.toString()
                                          : "",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: const TextStyle(
                                            color: Color(0xff22263D),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13),
                                      ),
                                    ),
                                    _space,
                                  ],
                                )
                              ],
                            ),
                            _space,
                            Text(
                              "Address",
                              style: GoogleFonts.sourceSansPro(
                                textStyle: const TextStyle(
                                    color: Color(0xff90929E),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              getIfscCdeModel != null
                                  ? getIfscCdeModel!.address.toString()
                                  : "",
                              style: GoogleFonts.sourceSansPro(
                                textStyle: const TextStyle(
                                    color: Color(0xff22263D),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    _space,
                  ],
                ),
              ),
              Text(
                "Bank Account Number ",
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1.1, color: AppColors.borderColor),
                ),
                child: TextField(
                  controller: bankAccountNo,
                  obscureText: true,
                  autofocus: false,
                  onChanged: (text) {
                    setState(() {
                      if (bankAccountNo.text.length < 8) {
                        isDisable = false;
                      } else {
                        isDisable = true;
                      }
                    });
                  },
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(16),
                  ],
                  style: GoogleFonts.sourceSansPro(
                    textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        letterSpacing: 4),
                  ),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "Enter 16 Digit Account Number",
                    hintStyle: TextStyle(color: Color(0xffC8C7CE)),
                    border: InputBorder.none,
                    fillColor: Colors.white,
                    labelStyle:
                        TextStyle(color: AppColors.textColor, letterSpacing: 4),
                    contentPadding:
                        EdgeInsets.only(left: 14.0, bottom: 8.0, top: 5),
                  ),
                ),
              ),
              _space,
              Text(
                "Re-enter Bank Account Number ",
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1.1, color: AppColors.borderColor),
                ),
                child: TextField(
                  controller: confirmBankAcc,
                  autofocus: false,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(16),
                  ],
                  style: GoogleFonts.sourceSansPro(
                    textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        letterSpacing: 4),
                  ),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "Enter 16 Digit Re-Account number",
                    hintStyle: TextStyle(color: Color(0xffC8C7CE)),
                    labelStyle:
                        TextStyle(color: AppColors.textColor, letterSpacing: 4),
                    border: InputBorder.none,
                    fillColor: Colors.white,
                    contentPadding:
                        EdgeInsets.only(left: 14.0, bottom: 8.0, top: 5),
                  ),
                ),
              ),
              _space,
              Text(
                "Account Type? ",
                style: GoogleFonts.sourceSansPro(
                  textStyle: const TextStyle(
                      color: Color(0xff22263D),
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
              ),
              _space,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        savingIndex = 1;
                      });
                    },
                    child: Container(
                      height: 34,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x29000000),
                              blurRadius: 6.0,
                            ),
                          ],
                          border: Border.all(
                              width: 1,
                              color: savingIndex == 1
                                  ? Color(0xff22263D)
                                  : Color(0xff22263D)),
                          color: savingIndex == 1
                              ? Color(0xff22263D)
                              : Colors.white),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          "Savings",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: TextStyle(
                                color: savingIndex == 1
                                    ? Colors.white
                                    : Color(0xff22263D),
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
                      setState(() {
                        savingIndex = 2;
                      });
                    },
                    child: Container(
                      height: 34,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x29000000),
                              blurRadius: 6.0,
                            ),
                          ],
                          border: Border.all(
                              width: 1,
                              color: savingIndex == 2
                                  ? Color(0xff22263D)
                                  : Color(0xff22263D)),
                          color: savingIndex == 2
                              ? Color(0xff22263D)
                              : Colors.white),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          "Current",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: TextStyle(
                                color: savingIndex == 2
                                    ? Colors.white
                                    : Color(0xff22263D),
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          ),
                        ),
                      )),
                    ),
                  ),
                ],
              ),
              _space,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        jointIndex = 1;
                      });
                    },
                    child: Container(
                      height: 34,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x29000000),
                              blurRadius: 6.0,
                            ),
                          ],
                          border: Border.all(
                              width: 1,
                              color: jointIndex == 1
                                  ? Color(0xff000000)
                                  : Color(0xff22263D)),
                          color: jointIndex == 1
                              ? Color(0xff22263D)
                              : Colors.white),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Text(
                          "Single",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: TextStyle(
                                color: jointIndex == 1
                                    ? Colors.white
                                    : Color(0xff22263D),
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
                      setState(() {
                        jointIndex = 2;
                      });
                    },
                    child: Container(
                      height: 34,
                      decoration: BoxDecoration(
                          boxShadow: [
                            const BoxShadow(
                              color: Color(0x29000000),
                              blurRadius: 6.0,
                            ),
                          ],
                          border: Border.all(
                              width: 1,
                              color: jointIndex == 2
                                  ? Color(0xff000000)
                                  : Color(0xff22263D)),
                          color: jointIndex == 2
                              ? Color(0xff22263D)
                              : Colors.white),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Text(
                          "Joint",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: TextStyle(
                                color: jointIndex == 2
                                    ? Colors.white
                                    : Color(0xff22263D),
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          ),
                        ),
                      )),
                    ),
                  ),
                ],
              ),
              _space,
              Visibility(
                visible: inCheckCancelled,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cancelled Signed Cheque ",
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
                          border: Border.all(
                              width: 1.1, color: AppColors.borderColor),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 14.0, top: 12),
                          child: Text(
                            "Cancelled signed Cheque.jpg",
                            style: TextStyle(
                                color: Color(0xff22263D),
                                fontWeight: FontWeight.w400,
                                fontSize: 15),
                          ),
                        )),
                  ],
                ),
              ),
              _space,
              _space,
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: InkWell(
                  onTap: () async {
                    if (ifscCode.text.isNotEmpty &&
                        bankAccountNo.text.isNotEmpty) {
                      checkValidation();
                      setState(() {
                        isBankAdded = true;
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
                            color: isBankAdded == false
                                ? isDisable
                                    ? AppColors.textColor
                                    : const Color(0xffE1E0E6)
                                : const Color(0xffFF405A)),
                        color: isBankAdded == false
                            ? Colors.white
                            : Color(0xffFF405A)),
                    child: Center(
                        child: Text(
                      "Submit",
                      style: GoogleFonts.quicksand(
                        textStyle: TextStyle(
                            color: isBankAdded == false
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
              _space,
            ],
          ),
        ),
      ),
    );
  }

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
                              "Do you want to $enable this?",
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
                                    bank_detail_list[index].isEnable =
                                        !bank_detail_list[index].isEnable;
                                    print(
                                        "bank_detail_list[index].isEnable $bank_detail_list[index].isEnable");
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

  Widget get _space => const SizedBox(height: 20);

  Widget get _space1 => const SizedBox(height: 3);

  Future<bool> _onBackPressed() async {
    if (addBankView) {
      setState(() {
        cardView = true;
        addBankView = false;
      });
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}
