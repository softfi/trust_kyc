import 'dart:io';
import 'package:custom_switch/custom_switch.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trust_money/model/get_demate_account_response_data.dart';
import 'package:trust_money/model/get_digilocker_response_data.dart';
import 'package:trust_money/screens/animated_screens/existing_demat_animation.dart';
import 'package:trust_money/screens/animated_screens/new_demat_animation.dart';
import 'package:trust_money/screens/home/webview.dart';
import '../../model/address_proof_response_data.dart';
import '../../model/born_dropdown_response_data.dart';
import '../../model/city_responsse_data.dart';
import '../../model/get_demat_response_data.dart';
import '../../model/nominee_identify_dropdown_response_data.dart';
import '../../model/profession_response_data.dart';
import '../../model/relationship_dropdown_response_data.dart';
import '../../model/state_response_data.dart';
import '../../model/wealth_dropdown_response_data.dart';
import '../../repositories/demat_repository.dart';
import '../../repositories/profile_repository.dart';
import '../../utils/colorsConstant.dart';
import '../../utils/images.dart';
import '../../utils/styles.dart';
import '../../utils/sharedPreference.dart';

class DematDetails extends StatefulWidget {
  DematDetails({Key? key, required this.addNewDematAccounts}) : super(key: key);
  bool addNewDematAccounts;

  @override
  State<DematDetails> createState() => _DematDetailsState();
}

class _DematDetailsState extends State<DematDetails> {
  bool existingDematAccountDetails = false;
  bool dematDetails = false;
  bool isNewDemat = false;
  bool isMandatory = true;
  bool isSignInDemat = false;
  bool isToggle = true;
  bool isNomineeAdd = false;
  bool isAddressAdd = false;
  bool isAddNominee = false;
  bool isReplace = false;
  bool isAware = false;
  int isAwareInt = 0;
  bool isnomineeAdded = false;
  bool isUpload = false;
  bool aceeptTerm = false;
  int aceeptTermInt = 0;
  bool awareButtonClick = false;
  bool isSignatureUpdate = false;
  bool isExistingDematFill = false;
  bool isidentitySelected = false;
  bool citizen_OfThe_USA = false;
  bool loader = false;
  bool isDisable = false;
  int citizen_OfThe_USAInt = 0;
  bool Country_Residency = true;
  int Country_ResidencyInt = 0;
  bool Add_A_Nominee = false;
  int Add_A_NomineeInt = 0;
  List<GetStateModel> state_data = [];
  List<GetCityModel> city_data = [];
  List<AddressProofModel> address_data = [];
  List<ProfessionModel> profession_data = [];
  List<RelationShipModel> relation_list = [];
  List<NomineeIdentyModel> nomineeproof_list = [];
  List<WealthModel> wealth_list = [];
  List<BornModel> born_list = [];
  List<DematDetailModel> dematList = [];
  String? alternatenomineeStatedId;
  String? alternatenomineeCity;
  String? relationID;
  String? nomineeProofID;
  String? wealthID;
  String? nsdlItemsvalue;
  String? bornID;
  int nomineeID = 0;
  File? signatureImage;
  String dob = "DD-MM-YYYY";
  final _picker = ImagePicker();
  String mrsValue = 'Mrs.';
  DateTime currentStartDate = DateTime.now();
  String? userfName;
  var nominieefirstName = TextEditingController();
  var nominieemiddleName = TextEditingController();
  var nominieelastName = TextEditingController();
  var nominieecurrentAddress1 = TextEditingController();
  var alternateAddress1 = TextEditingController();
  var alternateAddress2 = TextEditingController();
  var alternatenominieePinCode = TextEditingController();
  var nomineeMobileNumber = TextEditingController();
  var nomineeIdentificationNumber = TextEditingController();
  var dp_id = TextEditingController();
  var benificiary_id = TextEditingController();
  var dp_name = TextEditingController();
  DigiLockerDetailModel? digiLockerDetailModel;

  // List of items in our dropdown menu
  var items = [
    'Mrs.',
    'Mis.',
  ];
  var nsdlItems = [
    'NSDL',
    'CSDL',
  ];

  geteDigiLocker() async {
    var res1 = await ProfileRepository().getdigiLocker();
    print("============927 ${res1!.aadharNumber}");
    if (res1 != null) {
      digiLockerDetailModel = res1;
      setState(() {});
    }
  }

  getPreferences() async {
    userfName = await HelperFunctions.getPanName();
    setState(() {});
  }

  getDematDetails() async {
    var res1 = await DematDetailRepository().getDematDetails();
    print("printdetmatres $res1");
    setState(() {
      if (res1 != null) {
        dematList = res1;
        widget.addNewDematAccounts = false;
        dematDetails = true;
        loader = true;
      }else{
        widget.addNewDematAccounts = true;
        dematDetails = false;
      }
    });
  }

  checkValidation() async {
    if (nsdlItemsvalue == null) {
      Fluttertoast.showToast(msg: 'Select Your Depository');
      return;
    } else if (dp_id.text.isEmpty ||
        dp_id.text.toString().length < 10) {
      Fluttertoast.showToast(msg: "Enter Your DP ID");
      return;
    } else if (benificiary_id.text.isEmpty ||
        dp_id.text.toString().length < 10) {
      Fluttertoast.showToast(msg: "Enter Your Beneficiary ID");
      return;
    }else if (dp_id.text.toString() != benificiary_id.text.toString()) {
      DPIDNotMatchedBottomSheet();
    } else if (dp_name.text.isEmpty) {
      Fluttertoast.showToast(msg: "Enter Your DP Name");
      return;
    } else {
      final adddematDetailModel = await DematDetailRepository().existingDemat(
        nsdlItemsvalue!,
        dp_id.text.toString(),
        benificiary_id.text.toString(),
        dp_name.text.toString(),
      );
      if (adddematDetailModel != " ") {
        await HelperFunctions.saveuserkyccompleted(true);
        setState(() {
          existingDematAccountDetails = false;
          Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ExistingDematAnimation()));
        });
       // onBankAddedBottomSheet();
      }
    }
  }

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? pickedStartDate = await showDatePicker(
        context: context,
        initialDate: currentStartDate,
        firstDate: DateTime(1900),
        lastDate: DateTime.now());
    if (pickedStartDate != null && pickedStartDate != currentStartDate) {
      setState(() {
        currentStartDate = pickedStartDate;
        dob = '${currentStartDate.day}-${currentStartDate.month}-${currentStartDate.year}'
                .toString();
      });
    }
  }

  getStateList() async {
    var data = await ProfileRepository().getState();
    setState(() {
      state_data = data;
      print("=======>11 $data");
    });
  }

  getCityList(String stateid) async {
    var data1 = await ProfileRepository().getCity(stateid);
    setState(() {
      city_data = data1;
      print("======>12 $data1");
    });
  }

  addressProofList() async {
    var data1 = await ProfileRepository().addressProof();
    setState(() {
      address_data = data1;
      print("======>13 $data1");
    });
  }

  relationshipList() async {
    var data1 = await DematDetailRepository().relationShip();
    setState(() {
      if (data1 != "") {
        relation_list = data1;
        print("======>13 $data1");
      }
    });
  }

  nomineeProofList() async {
    var data1 = await DematDetailRepository().nomineeProof();
    setState(() {
      if (data1 != "") {
        nomineeproof_list = data1;
        print("======>13 $data1");
      }
    });
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
    geteDigiLocker();
    getDematDetails();
    getStateList();
    bornList();
    wealthList();
    nomineeProofList();
    addressProofList();
    relationshipList();
    print("==========2435 ${widget.addNewDematAccounts}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Visibility(visible: dematDetails, child: loader?dematDetail():const Center(
                    heightFactor: 18,
                    child: CircularProgressIndicator(color: Color(0xff00C6D8)))),
        Visibility(
            visible: widget.addNewDematAccounts, child: addNewDematAccount()),
        Visibility(
            visible: existingDematAccountDetails,
            child: existingDematAccountDetail()),
        Visibility(visible: isNewDemat, child: NewDematWidget()),
      ],
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
                          widget.addNewDematAccounts = true;
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
             /* ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount:
                dematList == null ? 0 : dematList.length,
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
                                                borderRadius:
                                                BorderRadius.only(
                                                    topRight: Radius
                                                        .circular(8),
                                                    topLeft:
                                                    Radius.circular(
                                                        8)),
                                                color: Color(0xffffc440)),
                                            child: Center(
                                                child: Text(
                                                  "PRIMARY",
                                                  style:
                                                  ConstStyle.sourceSansPro,
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
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width*0.30,
                                            child: Text("TRUST KYC",
                                              // overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.sourceSansPro(
                                                textStyle: const TextStyle(
                                                  color: Color(0xff22263D),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 16,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(5),
                                                  bottomRight: Radius.circular(5)),
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
                                        width: MediaQuery.of(context).size.width*0.40,
                                        child: Text(
                                          "$userfName",
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
                                        width: MediaQuery.of(context).size.width*0.40,
                                        child: Text(
                                          dematList!= null
                                              ? dematList[index].dpAccountNumber
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
                                  Color(0xffFDF2F3),
                                  Color(0xffF6B4BA),
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              ),
                              borderRadius: BorderRadius.only(
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
                                      setState(() {
                                        enableDisableBottomSheet();
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 3),
                                      height: 25,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: isToggle
                                              ? Colors.transparent
                                              : const Color(0xffFF405A),
                                          borderRadius:
                                          BorderRadius.circular(25),
                                          border: Border.all(
                                              width: 2,
                                              color: isToggle
                                                  ? const Color(0xff22263D)
                                                  : const Color(
                                                  0xffFF405A))),
                                      child: Row(
                                        children: [
                                          isToggle
                                              ? Container()
                                              : Icon(
                                            size: 20,
                                            Icons.circle,
                                            color: Colors.white,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          isToggle
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
                                      // var res = await BankDetailRepository()
                                      //     .deleteBankDetails(
                                      //     bank_detail_list[index]
                                      //         .bankDetailsId);
                                      // if (res != "") {
                                      //   getbankDetail();
                                      // }
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
              ),*/
              /*  SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.70,
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: Image.asset(
                                        "assets/images/arrow.png",
                                        width: 55),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      height: 20,
                                      width: 80,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(8),
                                              topLeft: Radius.circular(8)),
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
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width*0.30,
                                      child: Text(
                                        dematList!= null
                                            ? dematList[0].bornPlace
                                            : " ",
                                        // overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.sourceSansPro(
                                          textStyle: const TextStyle(
                                            color: Color(0xff22263D),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 16,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            bottomRight: Radius.circular(5)),
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
                                  width: MediaQuery.of(context).size.width*0.40,
                                  child: Text(
                                    "$userfName",
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
                                  width: MediaQuery.of(context).size.width*0.40,
                                  child: Text(
                                    dematList!= null
                                        ? dematList[0].emailId
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
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  enableDisableBottomSheet();
                                  // isToggle = !isToggle;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 3),
                                height: 25,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: isToggle
                                        ? Colors.transparent
                                        : const Color(0xffFF405A),
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                        width: 2,
                                        color: isToggle
                                            ? Color(0xff22263D)
                                            : Color(0xffFF405A))),
                                child: Row(
                                  children: [
                                    isToggle
                                        ? Container()
                                        : Icon(
                                            size: 20,
                                            Icons.circle,
                                            color: Colors.white,
                                          ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    isToggle
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
                                var res = await DematDetailRepository()
                                    .deleteDematDetails();
                                if (res != "") {
                                  getDematDetails();
                                  setState((){
                                    existingDematAccountDetails = false;
                                    dematDetails = false;
                                    isNewDemat = false;
                                    widget.addNewDematAccounts = true;
                                  });
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
              ),*/

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
                "Hey $userfName, Enter Your Demat Account Information",
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
                          widget.addNewDematAccounts = false;
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
                          widget.addNewDematAccounts = false;
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
                "Hey $userfName, Enter Your Demat Account Information",
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
                            });
                          },
                          value: nsdlItemsvalue,
                        ),
                      ))),
              _space1,
              _space,
              Text(
                "DP-ID* ",
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
                  color: Colors.white,
                ),
                child: TextField(
                  controller: dp_id,
                  autofocus: false,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(16),
                  ],
                  style: GoogleFonts.sourceSansPro(
                    textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.w500,
                        fontSize: 19,
                        letterSpacing: 3),
                  ),
                  decoration: const InputDecoration(
                    hintText: "Enter DP-ID",
                    hintStyle:
                        TextStyle(color: Color(0xffC8C7CE), letterSpacing: 3),
                    border: InputBorder.none,
                    fillColor: Colors.white,
                    contentPadding:
                        EdgeInsets.only(left: 14.0, bottom: 7.0, top: 5.0),
                  ),
                ),
              ),
              _space,
              Text(
                "Re-enter DP-Id*  ",
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
                  color: Colors.white,
                ),
                child: TextField(
                  controller: benificiary_id,
                  autofocus: false,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(16),
                  ],
                  style: GoogleFonts.sourceSansPro(
                    textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.w500,
                        fontSize: 19,
                        letterSpacing: 3),
                  ),
                  decoration: const InputDecoration(
                    hintText: "Re-enter DP-ID",
                    hintStyle:
                        TextStyle(color: Color(0xffC8C7CE), letterSpacing: 3),
                    border: InputBorder.none,
                    fillColor: Colors.white,
                    contentPadding:
                        EdgeInsets.only(left: 14.0, bottom: 7.0, top: 5.0),
                  ),
                ),
              ),
              _space,
              Text(
                "DP-Name*  ",
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

  Widget NewDematWidget() {
    return Padding(
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
                  dematDetails = false;
                  widget.addNewDematAccounts = true;
                  existingDematAccountDetails = false;
                  isNewDemat = false;
                  isMandatory = false;
                  isSignInDemat = false;
                  isNomineeAdd = false;
                  isAddressAdd = false;
                  isAddNominee = false;
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
            Visibility(
              visible: isMandatory,
              child: Column(
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
                      "SBI Requires the following details to open your Demat account",
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
                                    value:
                                        item.primarySourceOfWealthName.toString(),
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
                            aceeptTerm = value! ;
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
            ),
            Visibility(
              visible: isUpload,
              child: Column(
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
                                                          ImageSource.camera);
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
                        if (isSignatureUpdate == true) {
                          if (signatureImage != null) {
                            var res = await DematDetailRepository().uploadSignature(file: signatureImage!);
                            if (res != "") {
                              var addDematDetailModel = await DematDetailRepository().adddematDetails(
                                  Bornregion: bornID!,
                                  USAcitizen: citizen_OfThe_USAInt,
                                  taxResidency: Country_ResidencyInt,
                                  wealth: wealthID!,
                                  check_box_terms_selected: aceeptTermInt,
                                  check_box_account_statement_electronic: isAwareInt);
                              if(addDematDetailModel !=""){
                                await HelperFunctions.saveuserkyccompleted(true);
                                uploadSignatureBottomSheet();
                              }

                            }
                          } else {
                            Fluttertoast.showToast(
                                msg: "Select signature image first");
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
            ),
            Visibility(
              visible: isAddNominee,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _space,
                    Text(
                      "Add Nominee",
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: Color(0xff22263D),
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                    ),
                    Text(
                      "You can add up to 3 nominees for your account. You can also add them later in your profile once your account is open",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                            color: Color(0xff22263D),
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                    ),
                    _space,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Do You Want To Add A Nominee?",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                  color: Color(0xff22263D),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15),
                            )),
                        CustomSwitch(
                          activeColor: Colors.green,
                          value: Add_A_Nominee,
                          onChanged: (value) {
                            setState(() {
                              Add_A_Nominee = value;
                              if (isNomineeAdd == true) {
                                isNomineeAdd = false;
                              } else {
                                isNomineeAdd = true;
                                if (value == true) {
                                  Add_A_NomineeInt = 1;
                                } else {
                                  Add_A_NomineeInt = 0;
                                }
                                print("VALUE : $Add_A_NomineeInt");
                              }
                            });
                          },
                        ),
                      ],
                    ),
                    _space,
                    Visibility(
                      visible: isNomineeAdd,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Title",
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
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14.0),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2(
                                    value: mrsValue,
                                    // Down Arrow Icon
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    // Array list of items
                                    items: items.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        mrsValue = newValue!;
                                      });
                                    },
                                  ),
                                ),
                              )),
                          _space,
                          Text(
                            "Full Name",
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
                              border: Border.all(
                                  width: 1, color: AppColors.textColor),
                            ),
                            child: TextField(
                              controller: nominieefirstName,
                              autofocus: false,
                              textCapitalization: TextCapitalization.words,
                              style: ConstStyle.sourceSans5,
                              decoration: const InputDecoration(
                                hintText: "Full Name",
                                hintStyle:
                                    const TextStyle(color: Color(0xffC8C7CE)),
                                border: InputBorder.none,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.only(
                                    left: 14.0, bottom: 7.0, top: 6.0),
                              ),
                            ),
                          ),
                        /*  _space,
                          Text(
                            "Middle Name",
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
                              border: Border.all(
                                  width: 1, color: AppColors.textColor),
                            ),
                            child: TextField(
                              controller: nominieemiddleName,
                              autofocus: false,
                              style: ConstStyle.sourceSans5,
                              decoration: const InputDecoration(
                                hintText: "Middle Name",
                                hintStyle:
                                    const TextStyle(color: Color(0xffC8C7CE)),
                                border: InputBorder.none,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.only(
                                    left: 14.0, bottom: 7.0, top: 6.0),
                              ),
                            ),
                          ),
                          _space,
                          Text(
                            "Last Name",
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
                              border: Border.all(
                                  width: 1, color: AppColors.textColor),
                            ),
                            child: TextField(
                              controller: nominieelastName,
                              autofocus: false,
                              style: ConstStyle.sourceSans5,
                              decoration: const InputDecoration(
                                hintText: "Last Name",
                                hintStyle:
                                    const TextStyle(color: Color(0xffC8C7CE)),
                                border: InputBorder.none,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.only(
                                    left: 14.0, bottom: 7.0, top: 6.0),
                              ),
                            ),
                          ),*/
                          _space,
                          Text(
                            "Relationship with Application",
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
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14.0),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton2(
                                      hint: const Text("Select Relationship",
                                          style: TextStyle(
                                            color: Color(0xffC8C7CE),
                                          )),
                                      items: relation_list.map((item) {
                                        return DropdownMenuItem(
                                            value: item
                                                .relationshipWithApplicationName
                                                .toString(),
                                            child: Text(
                                              item.relationshipWithApplicationName,
                                              //Names that the api dropdown contains
                                              style: const TextStyle(
                                                fontSize: 17.0,
                                              ),
                                            ));
                                      }).toList(),
                                      onChanged: (String? newVal) {
                                        setState(() {
                                          relationID = newVal;
                                          print(relationID.toString());
                                        });
                                      },
                                      value: relationID,
                                    ),
                                  ))),
                          _space,
                          Text(
                            "Nominee Identification",
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
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14.0),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton2(
                                      hint: const Text(
                                          "Select Nominee Identification",
                                          style: TextStyle(
                                            color: Color(0xffC8C7CE),
                                          )),
                                      items: nomineeproof_list.map((item) {
                                        return DropdownMenuItem(
                                            value: item.nomineeIdentificationId.toString(),
                                            child: Text(
                                              item.addressProof.toString(),
                                              //Names that the api dropdown contains
                                              style: const TextStyle(
                                                fontSize: 17.0,
                                              ),
                                            ));
                                      }).toList(),
                                      onChanged: (String? newVal) {
                                        setState(() {
                                        //   nomineeproof_list.map((item){
                                        //   nomineeProofID =  newVal;
                                        //   nomineeID = item.nomineeIdentificationId;
                                        //   print(nomineeProofID.toString());
                                        //   print(nomineeID.toString());
                                        //   isidentitySelected = true;
                                        // }).toList();
                                          nomineeProofID = newVal;
                                          print(nomineeProofID.toString());
                                          print(newVal.toString());
                                          isidentitySelected = true;
                                        });
                                      },
                                      value: nomineeProofID,
                                    ),
                                  ))),
                          _space,
                          Visibility(
                            visible: isidentitySelected,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  nomineeProofID.toString(),
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
                                    border: Border.all(
                                        width: 1, color: AppColors.textColor),
                                  ),
                                  child: TextField(
                                    controller: nomineeIdentificationNumber,
                                    autofocus: false,
                                    style: ConstStyle.sourceSans5,
                                    textCapitalization: TextCapitalization.characters,
                                    decoration: InputDecoration(
                                      hintText: "Enter $nomineeProofID",
                                      hintStyle:
                                          TextStyle(color: Color(0xffC8C7CE)),
                                      border: InputBorder.none,
                                      fillColor: Colors.white,
                                      contentPadding: EdgeInsets.only(
                                          left: 14.0, bottom: 7.0, top: 6.0),
                                    ),
                                  ),
                                ),
                                _space,
                              ],
                            ),
                          ),
                          Text(
                            "Mobile Number",
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
                              border: Border.all(
                                  width: 1, color: AppColors.textColor),
                            ),
                            child: TextField(
                              controller: nomineeMobileNumber,
                              autofocus: false,
                              style: ConstStyle.sourceSans5,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10),
                              ],
                              decoration: const InputDecoration(
                                hintText: "Nominee mobile number",
                                hintStyle: TextStyle(color: Color(0xffC8C7CE)),
                                border: InputBorder.none,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.only(
                                    left: 14.0, bottom: 7.0, top: 6.0),
                              ),
                            ),
                          ),
                          _space,
                          Text(
                            "Date of Birth",
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
                              border: Border.all(
                                  width: 1, color: AppColors.textColor),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    dob.toString(),
                                    style: ConstStyle.sourceSans5,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _selectStartDate(context);
                                      });
                                    },
                                    child: Image.asset(
                                      "assets/images/calender.png",
                                      width: 25,
                                      height: 25,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          _space,
                          Text(
                            "Address (Same as the Applicant)",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: TextStyle(
                                  color: Color(0xff22263D),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            ),
                          ),
                          _space1,
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.2, color: Color(0xffC8C7CD)),
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xffF7F7FA)),
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                       digiLockerDetailModel != null
                                      ? "${digiLockerDetailModel!.location}, ${digiLockerDetailModel!.villageTownCity}, ${digiLockerDetailModel!.district}, ${digiLockerDetailModel!.state}, ${digiLockerDetailModel!.country}, ${digiLockerDetailModel!.pincode}":"",
                                  textAlign: TextAlign.start,
                                  style: ConstStyle.sourceSans1),
                            ),
                          ),
                          _space,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (isAddressAdd == false) {
                                      isAddressAdd = true;
                                    } else {
                                      isAddressAdd = false;
                                    }
                                  });
                                },
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: isAddressAdd
                                        ? Color(0xff22263D)
                                        : Color(0xffC8C7CE),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Got a different Address",
                                style: GoogleFonts.sourceSansPro(
                                  textStyle: TextStyle(
                                      color: Color(0xff22263D),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                          _space,
                          Visibility(
                            visible: isAddressAdd == false ? false : true,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Add new Address",
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
                                    border: Border.all(
                                        width: 1, color: AppColors.textColor),
                                  ),
                                  child: TextField(
                                    controller: alternateAddress1,
                                    autofocus: false,
                                    style: ConstStyle.sourceSans5,
                                    decoration: const InputDecoration(
                                      hintText: "ADDRESS LINE 1",
                                      hintStyle:
                                          TextStyle(color: Color(0xffC8C7CE)),
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
                                    border: Border.all(
                                        width: 1, color: AppColors.textColor),
                                  ),
                                  child: TextField(
                                    controller: alternateAddress2,
                                    autofocus: false,
                                    style: ConstStyle.sourceSans5,
                                    decoration: const InputDecoration(
                                      hintText: "ADDRESS LINE 2",
                                      hintStyle:
                                          TextStyle(color: Color(0xffC8C7CE)),
                                      border: InputBorder.none,
                                      fillColor: Colors.white,
                                      contentPadding: EdgeInsets.only(
                                          left: 14.0, bottom: 7.0, top: 6.0),
                                    ),
                                  ),
                                ),
                                _space,
                                Text(
                                  "Pincode",
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
                                    border: Border.all(
                                        width: 1, color: AppColors.textColor),
                                  ),
                                  child: TextField(
                                    controller: alternatenominieePinCode,
                                    autofocus: false,
                                    style: ConstStyle.sourceSans5,
                                    decoration: const InputDecoration(
                                      hintText: "Enter Pin Code",
                                      hintStyle:
                                          TextStyle(color: Color(0xffC8C7CE)),
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
                                          width: 1.1,
                                          color: AppColors.borderColor),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 14.0),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton2(
                                          hint: Text(
                                            "Select State",
                                            style: TextStyle(
                                                color: Color(0xffC8C7CE)),
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
                                            setState(() {
                                              alternatenomineeStatedId = newVal;
                                              getCityList(
                                                  alternatenomineeStatedId!);
                                            });
                                          },
                                          value: alternatenomineeStatedId,
                                        ),
                                      ),
                                    )),
                                _space,
                                Text(
                                  "Select City",
                                  style: GoogleFonts.sourceSansPro(
                                    textStyle: TextStyle(
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
                                          width: 1.1,
                                          color: AppColors.borderColor),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 14.0),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton2(
                                          hint: Text("Select City",
                                              style: TextStyle(
                                                  color: Color(0xffC8C7CE))),
                                          items: city_data.map((item) {
                                            return DropdownMenuItem(
                                                value: item.cityName.toString(),
                                                child: Container(
                                                  width: 200,
                                                  child: Text(
                                                    item.cityName,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    //Names that the api dropdown contains
                                                    style: const TextStyle(
                                                      fontSize: 17.0,
                                                    ),
                                                  ),
                                                ));
                                          }).toList(),
                                          onChanged: (String? newVal) {
                                            setState(() {
                                              alternatenomineeCity = newVal;
                                              print(alternatenomineeCity
                                                  .toString());
                                            });
                                          },
                                          value: alternatenomineeCity,
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: InkWell(
                        onTap: () async {
                          var resData = await DematDetailRepository().addNominee(
                            title: mrsValue,
                            firstname: nominieefirstName.text.toString(),
                            relationshipwithApplication: relationID!,
                            nominieeIdentify: int.parse(nomineeProofID!),
                            nominieeIdentificationNumber: nomineeIdentificationNumber.text.toString(),
                            mobilenumber: nomineeMobileNumber.text.toString(),
                            dob: dob.toString(),
                            currentaddressLine1: "${digiLockerDetailModel!.houseNo}, ${digiLockerDetailModel!.location}",
                            currentaddressLine2: digiLockerDetailModel!.villageTownCity,
                            currentaddressLine3: digiLockerDetailModel!.country,
                            currentCity: digiLockerDetailModel!.district,
                            currentState: digiLockerDetailModel!.state,
                            currentZip: digiLockerDetailModel!.pincode,
                            addressLine1: alternateAddress1.text.toString(),
                            addressLine2: alternateAddress2.text.toString(),
                            addreszipCode: alternatenominieePinCode.text.toString(),
                            alternateaddressState: alternatenomineeStatedId.toString(),
                            alternateaddressCity: alternatenomineeCity.toString(),
                          );
                          if(resData !=""){
                            setState(() {
                              isMandatory = false;
                              isUpload = false;
                              isSignInDemat = true;
                              isAddNominee = false;
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
                                color: isnomineeAdded == false
                                    ? (relationID != null &&
                                            nomineeProofID != null)
                                        ? AppColors.textColor
                                        : Color(0xffE1E0E6)
                                    : Color(0xffFF405A)),
                            color: isnomineeAdded == false
                                ? Colors.white
                                : Color(0xffFF405A),
                          ),
                          child: Center(
                              child: Text(
                            "Continue",
                            style: GoogleFonts.quicksand(
                              textStyle: TextStyle(
                                  color: isnomineeAdded == false
                                      ? (relationID != null &&
                                              nomineeProofID != null)
                                          ? AppColors.textColor
                                          : Color(0xffE1E0E6)
                                      : Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            ),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: isSignInDemat,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _space,
                    Text(
                      "E-Sign Your Application",
                      style: GoogleFonts.quicksand(
                        textStyle: TextStyle(
                            color: Color(0xff22263D),
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                    ),
                    Text(
                      "As per mandate every applicant needs to E-sign the application as per SEBI guidelines",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: TextStyle(
                            color: Color(0xff22263D),
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                    ),
                    _space,
                    RichText(
                      text: const TextSpan(children: [
                        TextSpan(
                            text: "if your mobile number and ",
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Color(0xff22263D))),
                        TextSpan(
                            text: "AADHAAR ",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Color(0xffFF405A))),
                        TextSpan(
                            text: "are ",
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Color(0xff22263D))),
                        TextSpan(
                            text: "Linked,",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Color(0xffFF405A))),
                        TextSpan(
                            text: "you will receive an ",
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Color(0xff22263D))),
                        TextSpan(
                            text: "OTP ",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Color(0xffFF405A))),
                        TextSpan(
                            text: "on your mobile number",
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Color(0xff22263D))),
                      ]),
                    ),
                    _space,
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return MyWebView(
                                url: "https://trust-api.trustmony.com/api/v1/esign_pdf",
                              );
                            }));
                      },
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(color: AppColors.btnColor),
                        child: Center(
                            child: Text(
                          "e-sign with Aadhaar OTP",
                          style: GoogleFonts.quicksand(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500)),
                        )),
                      ),
                    ),
                    _space,
                    Text(
                      "Mobile and Aadhaar not linked.?",
                      style: GoogleFonts.quicksand(
                        textStyle: TextStyle(
                            color: Color(0xff22263D),
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                    _space,
                    Text(
                      "Not sure whether you have your mobie number linked to your Aadhaar ? Click on the link below to check ",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: TextStyle(
                            color: Color(0xff22263D),
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                    ),
                    _space,
                    _space1,
                    Text(
                      "https://myaadhaar.uidai.gov.in/verify-email-mobile",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                            color: Color(0xffFF405A),
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 6,
                    ),
                   /* Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Continue()));
                        },
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2, color: AppColors.textColor)),
                          child: Center(
                              child: Text(
                            "Submit",
                            style: ConstStyle.quickStandBtn,
                          )),
                        ),
                      ),
                    ),*/
                  ],
                ),
              ),
            ),
            _space,
          ],
        ),
      ),
    );
  }

  Widget get _space => const SizedBox(height: 20);

  Widget get _space1 => const SizedBox(height: 3);

  //all bottom sheets

  void onBankAddedBottomSheet() {
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
                  onTap: () async {
                    await HelperFunctions.saveuserkyccompleted(true);
                    setState(() {
                      existingDematAccountDetails = false;
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ExistingDematAnimation()));
                    });
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
                          height: 30,
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
                            "Congratulations! $userfName \n Demat Account Added Successfully",
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
                decoration: BoxDecoration(
                  color: AppColors.textColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Signature Examples",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.quicksand(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.14,
                      height: 180,
                      child: Image.asset(ConstantImage.sign1,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.14,
                      height: 180,
                      child:  Image.asset(ConstantImage.sign2,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
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
                                textStyle: TextStyle(
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
                  onTap: () {
                    setState(() {
                      Navigator.pop(context);
                      isUpload = false;
                      isMandatory = false;
                      isAddNominee = true;
                    });
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

  void enableDisableBottomSheet() {
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
                  builder: (BuildContext context, StateSetter setate) {
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
                          SizedBox(
                            height: 5,
                          ),
                          Center(
                            child: Text(
                              "Do you want to Enable this?",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.quicksand(
                                textStyle: TextStyle(
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
                                  setate(() {
                                    Navigator.pop(context);
                                    isToggle = !isToggle;
                                    print("isToggle $isToggle");
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
}
