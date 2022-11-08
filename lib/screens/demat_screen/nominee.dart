import 'package:custom_switch/custom_switch.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/model/get_digilocker_response_data.dart';
import 'package:trust_money/repositories/nominee_repository.dart';
import 'package:trust_money/repositories/profile_repository.dart';
import 'package:trust_money/utils/colorsConstant.dart';
import 'package:trust_money/utils/styles.dart';
import '../../model/address_proof_response_data.dart';
import '../../model/city_responsse_data.dart';
import '../../model/nominee_identify_dropdown_response_data.dart';
import '../../model/profession_response_data.dart';
import '../../model/relationship_dropdown_response_data.dart';
import '../../model/state_response_data.dart';

class Nominee extends StatefulWidget {
  final void Function()? onClick1;
  const Nominee({Key? key, required this.onClick1}) : super(key: key);

  @override
  State<Nominee> createState() => _NomineeState();
}

class _NomineeState extends State<Nominee> {
  bool Add_A_Nominee = false;
  int Add_A_NomineeInt = 0;
  List<GetStateModel> state_data = [];
  List<GetCityModel> city_data = [];
  List<AddressProofModel> address_data = [];
  List<ProfessionModel> profession_data = [];
  List<RelationShipModel> relation_list = [];
  List<NomineeIdentyModel> nomineeproof_list = [];
  String? alternatenomineeStatedId;
  String? alternatenomineeCity;
  String? relationID;
  String? nomineeProofID;
  int nomineeID = 0;
  String mrsValue = 'Mrs.';
  bool isAddNominee = true;
  bool isnomineeAdded = false;
  bool isNomineeAdd = false;
  bool isAddressAdd = false;
  bool isidentitySelected = false;
  String dob = "DD-MM-YYYY";
  DateTime currentStartDate = DateTime.now();
  var nominieefirstName = TextEditingController();
  var nominieemiddleName = TextEditingController();
  var nominieelastName = TextEditingController();
  var nominieecurrentAddress1 = TextEditingController();
  var alternateAddress1 = TextEditingController();
  var alternateAddress2 = TextEditingController();
  var alternatenominieePinCode = TextEditingController();
  var nomineeMobileNumber = TextEditingController();
  var nomineeIdentificationNumber = TextEditingController();
  DigiLockerDetailModel? digiLockerDetailModel;

  var items = [
    'Mrs.',
    'Mis.',
  ];
  geteDigiLocker() async {
    var res1 = await ProfileRepository().getdigiLocker();
    print("============927 ${res1!.aadharNumber}");
    if (res1 != null) {
      digiLockerDetailModel = res1;
      setState(() {});
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
        dob =
            '${currentStartDate.day}-${currentStartDate.month}-${currentStartDate.year}'
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
    var data1 = await NomineeRepository().relationShip();
    setState(() {
      if (data1 != "") {
        relation_list = data1;
        print("======>13 $data1");
      }
    });
  }

  nomineeProofList() async {
    var data1 = await NomineeRepository().nomineeProof();
    setState(() {
      if (data1 != "") {
        nomineeproof_list = data1;
        print("======>13 $data1");
      }
    });
  }

  @override
  void initState() {
    geteDigiLocker();
    getStateList();
    nomineeProofList();
    addressProofList();
    relationshipList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Visibility(visible: isAddNominee, child: nomineeWidget());
  }

  Widget nomineeWidget(){
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
                          "STEP 3 of 4",
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
            Padding(
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
                                          value: item.nomineeIdentificationId
                                              .toString(),
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
                                  textCapitalization:
                                  TextCapitalization.characters,
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
                                    ? "${digiLockerDetailModel!.location}, ${digiLockerDetailModel!.villageTownCity}, ${digiLockerDetailModel!.district}, ${digiLockerDetailModel!.state}, ${digiLockerDetailModel!.country}, ${digiLockerDetailModel!.pincode}"
                                    : "",
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
                        var resData =
                        await NomineeRepository().addNominee(
                          title: mrsValue,
                          firstname: nominieefirstName.text.toString(),
                          relationshipwithApplication: relationID!,
                          nominieeIdentify: int.parse(nomineeProofID!),
                          nominieeIdentificationNumber:
                          nomineeIdentificationNumber.text.toString(),
                          mobilenumber: nomineeMobileNumber.text.toString(),
                          dob: dob.toString(),
                          currentaddressLine1:
                          "${digiLockerDetailModel!.houseNo}, ${digiLockerDetailModel!.location}",
                          currentaddressLine2:
                          digiLockerDetailModel!.villageTownCity,
                          currentaddressLine3: digiLockerDetailModel!.country,
                          currentCity: digiLockerDetailModel!.district,
                          currentState: digiLockerDetailModel!.state,
                          currentZip: digiLockerDetailModel!.pincode,
                          addressLine1: alternateAddress1.text.toString(),
                          addressLine2: alternateAddress2.text.toString(),
                          addreszipCode:
                          alternatenominieePinCode.text.toString(),
                          alternateaddressState:
                          alternatenomineeStatedId.toString(),
                          alternateaddressCity:
                          alternatenomineeCity.toString(),
                        );
                        if (resData != "") {
                          widget.onClick1!();
                          // setState(() {
                          //   // isMandatory = false;
                          //   // isUpload = false;
                          //   // isSignInDemat = true;
                          //   // isAddNominee = false;
                          // });
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
            _space,
          ],
        ),
      ),
    );



  }

  Widget get _space => const SizedBox(height: 20);

  Widget get _space1 => const SizedBox(height: 3);
}
