import 'dart:convert';
import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';
import 'package:trust_money/model/get_demate_account_response_data.dart';
import 'package:trust_money/model/wealth_dropdown_response_data.dart';
import 'package:trust_money/repositories/demat_repository.dart';
import 'package:trust_money/repositories/login_repository.dart';
import 'package:trust_money/screens/home/continue.dart';
import 'package:trust_money/screens/home/google_sign_in.dart';
import 'package:trust_money/utils/colorsConstant.dart';
import 'package:trust_money/utils/images.dart';
import 'package:trust_money/utils/strings.dart';
import 'package:trust_money/utils/styles.dart';
import '../../api/url_constant.dart';
import '../../model/address_proof_response_data.dart';
import '../../model/born_dropdown_response_data.dart';
import '../../model/city_responsse_data.dart';
import '../../model/get_bank_detail_response_data.dart';
import '../../model/get_demat_response_data.dart';
import '../../model/get_personal_detail_response.dart';
import '../../model/nominee_identify_dropdown_response_data.dart';
import '../../model/profession_response_data.dart';
import '../../model/relationship_dropdown_response_data.dart';
import '../../model/sendOtpEmailModel.dart';
import '../../model/state_response_data.dart';
import '../../repositories/bank_detail_repository.dart';
import '../../repositories/profile_repository.dart';
import '../auths/sharedPreference.dart';
import 'digilocker_page.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool tabVisible = false;
  bool? userIsLoggedIn;
  bool isemailResendOTPf = false;
  bool isemailResendOTPt = true;
  bool isExistResendOtp = true;
  late Map resopnsmap;
  bool isResendOtp = false;
  bool isSwitched = false;
  bool isSwitched2 = false;
  bool isChecked = false;
  bool isChecked1 = false;
  bool isAware = false;
  bool aceeptTerm = false;
  bool profileprofilevisbileTab1 = true;
  bool profilevisbileTab2 = false;
  bool profilevisbileTab3 = false;
  bool bankDetails = false;
  bool dematDetails = false;
  bool inPersonVerifications = false;
  bool addNewDematAccounts = false;
  bool existingDematAccountDetails = false;
  bool isNewDemat = false;
  bool isMandatory = true;
  bool isUpload = false;
  bool isSignInDemat = false;
  bool isNomineeAdd = false;
  bool isAddressAdd = false;
  bool isAddPersonalDetails = false;
  bool isAddBankDetails = false;
  bool isAdddemat = false;
  bool isAddNominee = false;
  bool cardDetails = false;
  bool isEditStep1 = true;
  bool isEditStep2 = false;
  bool isButtonClick = false;
  bool isButtonClickMaiden = false;
  bool awareButtonClick = false;
  bool isEditStep12 = false;
  bool isScans = true;
  bool isPassportImage = false;
  bool tab1 = true;
  bool tab2 = false;
  bool tab3 = false;
  bool isEmailVerified = false;
  bool isAadhaarVerified = false;
  bool isPanVerify = false;
  bool isGoogleSign = true;
  bool isAdditional = false;
  bool isFrontImageClick = false;
  bool isBackImageClick = false;
  var textValue = 'OFF';
  bool potentially_exposed_status = false;
  int potentially_exposed_statusInt = 0;
  bool activate_future = false;
  int activate_futureInt = 0;
  bool citizen_OfThe_USA = false;
  int citizen_OfThe_USAInt = 0;
  bool Add_A_Nominee = false;
  int Add_A_NomineeInt = 0;
  bool Country_Residency = true;
  int Country_ResidencyInt = 0;
  int isCheckedInt = 0;
  int isChecked1Int = 0;
  bool barLine = true;
  bool isMaiden = false;
  bool inCheckCancelled = false;
  bool isPanSelected = false;
  bool isCapture = false;
  DateTime currentStartDate = DateTime.now();
  String dob = "DD-MM-YYYY";
  File? _image, backImage, frontImage,signatureImage;
  final _picker = ImagePicker();
  int genderIndex = 1;
  int maritalIndex = 1;
  int incomeIndex = 1;
  int experienceIndex = 1;
  int savingIndex = 1;
  int jointIndex = 1;
  String? token;
  String? firstName1, lastName1, mobNo, mail;
  GetPersonalDetailModel? getPersonalDetail;
  ExistingDematDetailModel? dematModel;
  bool isDetailsUpdate = false;
  List<GetStateModel> state_data = [];
  List<GetCityModel> city_data = [];
  List<AddressProofModel> address_data = [];
  List<ProfessionModel> profession_data = [];
  List<BankDetailModel> bank_detail_list = [];
  List<RelationShipModel> relation_list = [];
  List<NomineeIdentyModel> nomineeproof_list = [];
  List<WealthModel> wealth_list = [];
  List<BornModel> born_list = [];
  String? stateid;
  String? cityid;
  String? addressid;
  String? professionID;
  String? relationID;
  String? nomineeProofID;
  String? wealthID;
  String? bornID;
  SendOtpEmailModule? sendotptoemail;
  final email_id = TextEditingController();
  final otpdata = TextEditingController();
  final panNumber = TextEditingController();
  final addressLine1 = TextEditingController();
  final addressLine2 = TextEditingController();
  final addressZip = TextEditingController();
  final state = TextEditingController();
  final city = TextEditingController();
  final maidenName = TextEditingController();
  final ifscCode = TextEditingController();
  final bankAccountNo = TextEditingController();
  final confirmBankAcc = TextEditingController();
  var firstName = TextEditingController();
  var lastName = TextEditingController();
  var txtMob = TextEditingController();
  String mrsValue = 'Mrs.';
  String nsdlItemsvalue = 'NSDL';

  // List of items in our dropdown menu
  var items = [
    'Mrs.',
    'Mis.',
  ];

  var nsdlItems = [
    'NSDL',
    'CSDL',
  ];

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future logout() async {
    await GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();
  }

  getPersonalDetails() async {
    var res1 = await ProfileRepository().getProfileDetails();
    setState(() {
      if (res1 != null) {
        getPersonalDetail = res1;
        setState(() {
          isDetailsUpdate = true;
        });
      }
      print("scvgsdf $res1");
    });
    return getPersonalDetail;
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

  getDematDetails() async {
    var res1 = await DematDetailRepository().getExistingDematDetails();
    setState(() {
      if (res1 != null) {
        dematModel = res1;
      }
    });
  }

  addressProofList() async {
    var data1 = await ProfileRepository().addressProof();
    setState(() {
      address_data = data1;
      print("======>13 $data1");
    });
  }

  getOccupation() async {
    var data = await ProfileRepository().occupation();
    setState(() {
      profession_data = data;
      print("=======>100 $data");
    });
  }

  getbankDetail() async {
    var data = await BankDetailRepository().getBankDetails();
    setState(() {
      if(data!=null){
        bank_detail_list = data;
      }
      print("=======>11 $data");
    });
  }

  relationshipList() async {
    var data1 = await DematDetailRepository().relationShip();
    setState(() {
      if (data1 != null) {
        relation_list = data1;
        print("======>13 $data1");
      }
    });
  }

  nomineeProofList() async {
    var data1 = await DematDetailRepository().nomineeProof();
    setState(() {
      if (data1 != null) {
        nomineeproof_list = data1;
        print("======>13 $data1");
      }
    });
  }

  wealthList() async {
    var data1 = await DematDetailRepository().wealthDropdown();
    setState(() {
      if (data1 != null) {
        wealth_list = data1;
        print("======>13 $data1");
      }
    });
  }

  bornList() async {
    var data1 = await DematDetailRepository().bornDropdown();
    setState(() {
      if (data1 != null) {
        born_list = data1;
        print("======>13 $data1");
      }
    });
  }

  sendOtp_toEmail(String mobnumber, String emailid, bool boolvalue) async {
    var res1 =
        await LoginRepository().sentOtpToEmail(mobnumber, emailid, boolvalue);
    if (res1 != null) {
      sendotptoemail = res1;
      onOtpAddedBottomSheet();
      await HelperFunctions.saveEmail(email_id.text.toString());
    }
    return sendotptoemail;
  }

  void _verifyOTPEmail(String emailid, String otp) async {
    print('start working verify otp email');
    print(emailid);
    print(otp);
    print(isResendOtp);
    print(token);
    try {
      token = await HelperFunctions.getToken();
      Response response = await post(
        Uri.parse(VerifyOTPEmail),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'authorization': '$token'
        },
        body: jsonEncode(<String, dynamic>{"email_id": emailid, "otp": otp}),
      );
      print('//////////////////////////print resp/////////////////////////////////');
      print(response.toString());

      print('//////////////////////////print body/////////////////////////////////');
      print(response.body.toString());

      print('//////////////////////////print code/////////////////////////////////');
      print(response.statusCode.toString());

      print('//////////////////////////print request/////////////////////////////////');
      print(response.request.toString());

      setState(() {
        //loader = false;
      });

      JsonDecoder _decoder = new JsonDecoder();
      dynamic collectUseData = _decoder.convert(response.body);

      print("userinfois");
      print(collectUseData['hash_key'].toString());
      print(collectUseData['message'].toString());

      resopnsmap = json.decode(response.body);
      if (response.statusCode == 200) {
        print(response.statusCode.toString());
        Fluttertoast.showToast(msg: collectUseData['errors'].toString());
        Fluttertoast.showToast(msg: collectUseData['message'].toString());
        // onEmailVerifiedBottomSheet();
        setState(() {
          isEmailVerified = true;
          isGoogleSign = false;
        });
        // await HelperFunctions.saveuserFirstName(firstName.text.toString());
        // await HelperFunctions.saveuserLastName(lastName.text.toString());
        // await HelperFunctions.savePhoneNumber(phoneNumber.text.toString());

        await HelperFunctions.savehashkey(
            collectUseData['hash_key'].toString());
        // Navigator.push(context, MaterialPageRoute(builder: (context){
        //   return OtpVerification(fname,lame,mobno,collectUseData['hash_key'].toString()
        //   );
        // }));

      } else if (response.statusCode > 201) {
        if (collectUseData['errors'].toString() ==
            "mobile number already register please login") {
          Fluttertoast.showToast(
              msg: 'mobile number already register please login');
        }
        print("Registration failed");
        Fluttertoast.showToast(msg: collectUseData['errors'].toString());
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=> SignUpWidget() ));
      }
    } catch (e) {
      print(e.toString());
    }
    // Do something
  }

  void _resendOTPEmail(
      String mobnumber, String emailid, isemailResendOTPt) async {
    print('start working');
    print(mobnumber);
    print(emailid);
    print(isResendOtp);
    token = await HelperFunctions.getToken();
    print(token);
    try {

      Response response = await post(
        Uri.parse(SendOTPEmail),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'authorization': '$token'
        },
        body: jsonEncode(<String, dynamic>{
          "mobile_number": mobnumber,
          "email_id": emailid,
          "resend_otp": isemailResendOTPt
        }),
      );

      print(
          '//////////////////////////print resp/////////////////////////////////');
      print(response.toString());

      print(
          '//////////////////////////print body/////////////////////////////////');
      print(response.body.toString());

      print(
          '//////////////////////////print code/////////////////////////////////');
      print(response.statusCode.toString());

      print(
          '//////////////////////////print request/////////////////////////////////');
      print(response.request.toString());

      setState(() {
        //loader = false;
      });

      JsonDecoder _decoder = new JsonDecoder();
      dynamic collectUseData = _decoder.convert(response.body);

      print("userinfois");
      print(collectUseData['hash_key'].toString());
      print(collectUseData['message'].toString());

      resopnsmap = json.decode(response.body);
      if (response.statusCode == 200) {
        print(response.statusCode.toString());
        Fluttertoast.showToast(msg: collectUseData['errors'].toString());
        Fluttertoast.showToast(msg: collectUseData['message'].toString());
        // onOtpAddedBottomSheet();
        // await HelperFunctions.saveuserFirstName(firstName.text.toString());
        // await HelperFunctions.saveuserLastName(lastName.text.toString());
        // await HelperFunctions.savePhoneNumber(phoneNumber.text.toString());

        await HelperFunctions.savehashkey(
            collectUseData['hash_key'].toString());

        // Navigator.push(context, MaterialPageRoute(builder: (context){
        //   return OtpVerification(fname,lame,mobno,collectUseData['hash_key'].toString()
        //   );
        // }));

      } else if (response.statusCode > 201) {
        if (collectUseData['errors'].toString() ==
            "mobile number already register please login") {
          Fluttertoast.showToast(
              msg: 'mobile number already register please login');
        }
        print("Registration failed");
        Fluttertoast.showToast(msg: collectUseData['errors'].toString());
      }
    } catch (e) {
      print(e.toString());
    }
    // Do something
  }

  getKycStatus() async {
    await HelperFunctions.getUserKycCompleted().then((value) {
      if (value != null) {
        setState(() {
          isAddBankDetails = true;
          isAdddemat = true;
          tabVisible = true;
          profileprofilevisbileTab1 = true;
          existingDematAccountDetails = false;
          print("valuekyc:${value}");
        });
      } else {
        print("valuekycelse:${value}");
      }
    });
  }

  getLoggedInState() async {
    await HelperFunctions.getuserLoggedInSharedPreference().then((value) {
      setState(() {
        userIsLoggedIn = value;
        print("=========122:${value}");
      });
    });
    firstName1 = await HelperFunctions.getFirstName();
    firstName.text = firstName1!;
    lastName1 = await HelperFunctions.getLastName();
    lastName.text = lastName1!;
    mobNo = await HelperFunctions.getPhoneNumber();
    txtMob.text = mobNo!;
  }

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? pickedStartDate = await showDatePicker(
        context: context,
        initialDate: currentStartDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2090));
    if (pickedStartDate != null && pickedStartDate != currentStartDate) {
      setState(() {
        currentStartDate = pickedStartDate;
        dob =
            '${currentStartDate.day}-${currentStartDate.month}-${currentStartDate.year}'
                .toString();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getPersonalDetails();
    getLoggedInState();
    addressProofList();
    getOccupation();
    getDematDetails();
    getStateList();
    getbankDetail();
    nomineeProofList();
    wealthList();
    bornList();
    relationshipList();
    getKycStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [],
        elevation: 0.6,
        backgroundColor: const Color(0xff00C6D8),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text(
          "Profile",
          style: ConstStyle.quickStandSmall11,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RotatedBox(
                  quarterTurns: 9,
                  child: Material(
                    elevation: 0,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        color: Colors.redAccent,
                      ),
                      foregroundDecoration: const RotatedCornerDecoration(
                        color: Colors.white,
                        geometry: BadgeGeometry(
                            width: 25, height: 25, cornerRadius: 0),
                      ),
                      child: Container(),
                    ),
                  ),
                ),
                RotatedBox(
                  quarterTurns: 2,
                  child: Material(
                    elevation: 0,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        color: Colors.redAccent,
                      ),
                      foregroundDecoration: const RotatedCornerDecoration(
                        color: Colors.white,
                        geometry: BadgeGeometry(
                            width: 25, height: 25, cornerRadius: 0),
                      ),
                      child: Container(),
                    ),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: isAdddemat
                  ? barLine
                      ? false
                      : true
                  : true,
              child: Align(alignment: Alignment.center, child: orderTimeLine()),
            ),
            Visibility(
              visible: tabVisible,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        tab1 = true;
                        tab2 = false;
                        tab3 = false;
                        profileprofilevisbileTab1 = true;
                        bankDetails = false;
                        cardDetails = false;
                        dematDetails = false;
                        inPersonVerifications = false;
                        profilevisbileTab2 = false;
                        profilevisbileTab3 = false;
                        addNewDematAccounts = false;
                        existingDematAccountDetails = false;
                        isNewDemat = false;
                        isMandatory = false;
                        isUpload = false;
                        isSignInDemat = false;
                        isNomineeAdd = false;
                        isAddressAdd = false;
                        isAddNominee = false;
                      });
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.1, color: Colors.black54),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(255, 255, 255, 1),
                            tab3 == false
                                ? tab2 == true
                                    ? Color.fromRGBO(188, 188, 188, 1)
                                    : Color.fromRGBO(255, 255, 255, 1)
                                : Color.fromRGBO(188, 188, 188, 1),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Text(
                            "Personal Details",
                            style: GoogleFonts.quicksand(
                              textStyle: TextStyle(
                                  color: Color(0xff22263D),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 0.5,
                  ),
                  GestureDetector(
                    onTap: () {
                      getbankDetail();
                      setState(() {
                        tab1 = false;
                        tab2 = true;
                        tab3 = false;
                        bankDetails = false;
                        cardDetails = true;
                        dematDetails = false;
                        inPersonVerifications = false;
                        profileprofilevisbileTab1 = false;
                        inPersonVerifications = false;
                        profilevisbileTab2 = false;
                        profilevisbileTab3 = false;
                        addNewDematAccounts = false;
                        existingDematAccountDetails = false;
                        isNewDemat = false;
                        isMandatory = true;
                        isUpload = false;
                        isSignInDemat = false;
                        isNomineeAdd = false;
                        isAddressAdd = false;
                        isAddNominee = false;

                      });
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.1, color: Colors.black54),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(255, 255, 255, 1),
                            tab3 == false
                                ? tab1 == true
                                    ? Color.fromRGBO(188, 188, 188, 1)
                                    : Color.fromRGBO(255, 255, 255, 1)
                                : Color.fromRGBO(188, 188, 188, 1),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Text(
                            "Bank Details",
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  color: Color(0xff22263D),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 0.5,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        tab1 = false;
                        tab2 = false;
                        tab3 = true;
                        dematDetails = true;
                        cardDetails = false;
                        bankDetails = false;
                        profileprofilevisbileTab1 = false;
                        inPersonVerifications = false;
                        profilevisbileTab2 = false;
                        profilevisbileTab3 = false;
                        addNewDematAccounts = false;
                        existingDematAccountDetails = false;
                        isNewDemat = false;
                        isMandatory = true;
                        isUpload = false;
                        isSignInDemat = false;
                        isNomineeAdd = false;
                        isAddressAdd = false;
                        isAddNominee = false;
                      });
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.1, color: Colors.black54),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(255, 255, 255, 1),
                            tab2 == false
                                ? tab1 == true
                                    ? Color.fromRGBO(188, 188, 188, 1)
                                    : Color.fromRGBO(255, 255, 255, 1)
                                : Color.fromRGBO(188, 188, 188, 1),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Text(
                            "Demat Details",
                            style: GoogleFonts.quicksand(
                              textStyle: TextStyle(
                                  color: Color(0xff22263D),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
                visible: profileprofilevisbileTab1,
                child: isDetailsUpdate
                    ? updatedPersonalDetails()
                    : personalDetails()),
            Visibility(visible: profilevisbileTab2, child: editPersonalDetails(context)),
            Visibility(visible: profilevisbileTab3, child: editPersonalPic()),
            Visibility(visible: bankDetails, child: bankDetail()),
            Visibility(visible: cardDetails, child: cardDetail()),
            Visibility(visible: dematDetails, child: dematDetail()),
            Visibility(visible: inPersonVerifications, child: inPersonVerification()),
            Visibility(visible: addNewDematAccounts, child: addNewDematAccount()),
            Visibility(
                visible: existingDematAccountDetails,
                child: existingDematAccountDetail()),
            Visibility(visible: isNewDemat, child: NewDematWidget()),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RotatedBox(
                    quarterTurns: 2,
                    child: Material(
                      elevation: 0,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        foregroundDecoration: const RotatedCornerDecoration(
                          color: Colors.redAccent,
                          geometry: BadgeGeometry(
                              width: 25, height: 25, cornerRadius: 0),
                        ),
                        child: Container(),
                      ),
                    ),
                  ),
                  RotatedBox(
                    quarterTurns: 1,
                    child: Material(
                      elevation: 0,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        foregroundDecoration: const RotatedCornerDecoration(
                          color: Colors.redAccent,
                          geometry: BadgeGeometry(
                              width: 25, height: 25, cornerRadius: 0),
                        ),
                        child: Container(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget personalDetails() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xffF7F7FA).withOpacity(0.35),
                border: Border.all(width: 1.2, color: const Color(0xffbcbcbc))),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, bottom: 8, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        profileprofilevisbileTab1 = false;
                        profilevisbileTab2 = true;
                        profilevisbileTab3 = false;
                        bankDetails = false;
                        isAdditional = false;
                        isEditStep1 = true;
                        isEditStep2 = false;
                        isEditStep12 = false;
                        isAadhaarVerified = false;
                        dematDetails = false;
                        inPersonVerifications = false;
                        addNewDematAccounts = false;
                        existingDematAccountDetails = false;
                        isNewDemat = false;
                        isMandatory = false;
                        isUpload = false;
                        isSignInDemat = false;
                        isNomineeAdd = false;
                        isAddressAdd = false;
                        isAddNominee = false;
                        cardDetails = false;
                      });
                    },
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
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Image.asset(
                                "assets/images/edit.png",
                                scale: 0.7,
                                color: Colors.white,
                              ),
                            ),
                            const Text(
                              "Edit",
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
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Personal Details",
                      style: ConstStyle.quickMedium,
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    indent: 5,
                    endIndent: 5,
                  ),
                  _space,
                  Text("Full Name : ", style: ConstStyle.sourceSansPro),
                  Text('$firstName1 $lastName1', style: ConstStyle.sourceSans1),
                  _space,
                  Text("Mobile Number", style: ConstStyle.sourceSansPro),
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
                      Text("+91 $mobNo", style: ConstStyle.sourceSans1),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 30,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.green),
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
                      )
                    ],
                  ),
                  _space,
                  Text("Email ID : ", style: ConstStyle.sourceSansProDisable),
                  _space1,
                  Row(
                    children: [
                      Text("ABC@gmail.com",
                          style: ConstStyle.sourceSansDisable),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 30,
                        width: 110,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Color(0xffC8C7CE)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.cancel_outlined,
                              size: 16,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Not Verified",
                              style: GoogleFonts.sourceSansPro(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  _space,
                  Text("Date of Birth - Should be as per Aadhaar ",
                      style: ConstStyle.sourceSansProDisable),
                  _space1,
                  Text("DD/MM/YYYY  FORMAT",
                      style: ConstStyle.sourceSansDisable),
                  _space,
                  Text("PAN Number ", style: ConstStyle.sourceSansProDisable),
                  _space1,
                  Row(
                    children: [
                      Text("10 DIGIT PAN NUMBER",
                          style: ConstStyle.sourceSansDisable),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 30,
                        width: 110,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Color(0xffC8C7CE)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.cancel_outlined,
                              size: 16,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Not Verified",
                              style: GoogleFonts.sourceSansPro(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  _space,
                  Text("Aadhaar Number ",
                      style: ConstStyle.sourceSansProDisable),
                  _space1,
                  Row(
                    children: [
                      Text("12 DIGIT AADHAAR NUMBER",
                          style: ConstStyle.sourceSansDisable),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 30,
                        width: 110,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: const Color(0xffC8C7CE)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.cancel_outlined,
                              size: 16,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Not Verified",
                              style: GoogleFonts.sourceSansPro(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  _space,
                  Text("What is your gender? ",
                      style: ConstStyle.sourceSansProDisable),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 34,
                        width: 80,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: const Color(0xffC8C7CE)),
                            color: Colors.white),
                        child: Center(
                            child: Text(
                          "Male",
                          style: ConstStyle.sourceSansDisable,
                        )),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 34,
                        width: 80,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: const Color(0xffC8C7CE)),
                            color: Colors.white),
                        child: Center(
                            child: Text(
                          "Female",
                          style: ConstStyle.sourceSansDisable,
                        )),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 34,
                        width: 80,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: const Color(0xffC8C7CE)),
                            color: Colors.white),
                        child: Center(
                            child: Text(
                          "Trans.",
                          style: ConstStyle.sourceSansDisable,
                        )),
                      ),
                    ],
                  ),
                  _space,
                  Text("What is your marital status?",
                      style: ConstStyle.sourceSansProDisable),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 34,
                        width: 80,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: const Color(0xffC8C7CE)),
                            color: Colors.white),
                        child: Center(
                            child: Text(
                          "Single",
                          style: ConstStyle.sourceSansDisable,
                        )),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 34,
                        width: 80,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: Color(0xffC8C7CE)),
                            color: Colors.white),
                        child: Center(
                            child: Text(
                          "Married",
                          style: ConstStyle.sourceSansDisable,
                        )),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 34,
                        width: 80,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: const Color(0xffC8C7CE)),
                            color: Colors.white),
                        child: Center(
                            child: Text(
                          "Others",
                          style: ConstStyle.sourceSansDisable,
                        )),
                      ),
                    ],
                  ),
                  _space,
                  _space,
                  Text(
                    "What is your Occupation?  ",
                    style: ConstStyle.sourceSansProDisable,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "S E L E C T   O C C U P A T I O N",
                    style: ConstStyle.sourceSansDisable,
                  ),
                  _space,
                  Text(
                    "What is your Annual income? ",
                    style: ConstStyle.sourceSansProDisable,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 34,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: const Color(0xffC8C7CE)),
                            color: Colors.white),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("Below 1 Lakh",
                              style: ConstStyle.sourceSansDisable),
                        )),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 34,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: const Color(0xffC8C7CE)),
                            color: Colors.white),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("1-5 Lakh",
                              style: ConstStyle.sourceSansDisable),
                        )),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 34,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: const Color(0xffC8C7CE)),
                            color: Colors.white),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("5-10 Lakh",
                              style: ConstStyle.sourceSansDisable),
                        )),
                      ),
                    ],
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
                                width: 1, color: const Color(0xffC8C7CE)),
                            color: Colors.white),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("10-25 Lakh",
                              style: ConstStyle.sourceSansDisable),
                        )),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 34,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: const Color(0xffC8C7CE)),
                            color: Colors.white),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("Above 25 Lakh",
                              style: ConstStyle.sourceSansDisable),
                        )),
                      ),
                    ],
                  ),
                  _space,
                  Text(
                    "What is your trading experience? ",
                    style: ConstStyle.sourceSansProDisable,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 34,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: const Color(0xffC8C7CE)),
                            color: Colors.white),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("Less Than 1 Year",
                              style: ConstStyle.sourceSansDisable),
                        )),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 34,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: const Color(0xffC8C7CE)),
                            color: Colors.white),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("1-2 Years",
                              style: ConstStyle.sourceSansDisable),
                        )),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 34,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: const Color(0xffC8C7CE)),
                            color: Colors.white),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("2-5 Years",
                              style: ConstStyle.sourceSansDisable),
                        )),
                      ),
                    ],
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
                                width: 1, color: const Color(0xffC8C7CE)),
                            color: Colors.white),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("5-10 Years",
                              style: ConstStyle.sourceSansDisable),
                        )),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 34,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: const Color(0xffC8C7CE)),
                            color: Colors.white),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("10-20 Years",
                              style: ConstStyle.sourceSansDisable),
                        )),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 34,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: const Color(0xffC8C7CE)),
                            color: Colors.white),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("20-25 Years",
                              style: ConstStyle.sourceSansDisable),
                        )),
                      ),
                    ],
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
                                width: 1, color: const Color(0xffC8C7CE)),
                            color: Colors.white),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("Above 25 Years",
                              style: ConstStyle.sourceSansDisable),
                        )),
                      ),
                    ],
                  ),
                  _space,
                  Text(
                    "Mother's Maiden Name? ",
                    style: ConstStyle.sourceSansProDisable,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Maiden Name", style: ConstStyle.sourceSansDisable),
                  _space,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Are You Politically Exposed",
                        style: ConstStyle.sourceSansDisable,
                      ),
                      Stack(
                        fit: StackFit.loose,
                        children: [
                          const CustomSwitch(
                            activeColor: Color(0xffC8C7CE),
                            value: false,
                          ),
                          Container(
                              height: 40, width: 70, color: Colors.transparent),
                        ],
                      ),
                    ],
                  ),
                  _space,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: Text(
                          Strings.active_check,
                          style: ConstStyle.sourceSansDisable,
                        ),
                      ),
                      Stack(
                        fit: StackFit.loose,
                        children: [
                          const CustomSwitch(
                            activeColor: Color(0xffC8C7CE),
                            value: false,
                          ),
                          Container(
                              height: 40, width: 70, color: Colors.transparent),
                        ],
                      ),
                    ],
                  ),
                  _space,
                  Row(
                    children: [
                      Text(
                        "In-Person Verification",
                        style: ConstStyle.sourceSansDisable,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Container(
                        height: 30,
                        width: 110,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Color(0xffC8C7CE)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.cancel_outlined,
                              size: 16,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Not Verified",
                              style: GoogleFonts.sourceSansPro(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                              ),
                            ),
                          ],
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
          Card(
            child: Container(
              foregroundDecoration: const RotatedCornerDecoration(
                color: Colors.pinkAccent,
                geometry: BadgeGeometry(
                    width: 48,
                    height: 48,
                    alignment: BadgeAlignment.bottomLeft),
                textSpan: TextSpan(text: 'OK', style: TextStyle(fontSize: 12)),
                labelInsets: LabelInsets(baselineShift: 3, start: 1),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget updatedPersonalDetails() {
    var dateFormat = DateFormat("dd-MM-yyyy"); // you can change the format here
    //var dobDate = dateFormat.format(DateTime.parse(getPersonalDetail!.dob.toString()));
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xffF7F7FA).withOpacity(0.35),
                border: Border.all(width: 1.2, color: const Color(0xffbcbcbc))),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, bottom: 8, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        profileprofilevisbileTab1 = false;
                        profilevisbileTab2 = true;
                        profilevisbileTab3 = false;
                        bankDetails = false;
                        isAdditional = false;
                        isEditStep1 = true;
                        isEditStep2 = false;
                        isEditStep12 = false;
                        isAadhaarVerified = false;
                        dematDetails = false;
                        inPersonVerifications = false;
                        addNewDematAccounts = false;
                        existingDematAccountDetails = false;
                        isNewDemat = false;
                        isMandatory = false;
                        isUpload = false;
                        isSignInDemat = false;
                        isNomineeAdd = false;
                        isAddressAdd = false;
                        isAddNominee = false;
                        cardDetails = false;
                      });
                    },
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
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Image.asset(
                                "assets/images/edit.png",
                                scale: 0.7,
                                color: Colors.white,
                              ),
                            ),
                            const Text(
                              "Edit",
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
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Personal Details",
                      style: ConstStyle.quickMedium,
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    indent: 5,
                    endIndent: 5,
                  ),
                  _space,
                  Text("Full Name : ", style: ConstStyle.sourceSansPro),
                  Text('$firstName1 $lastName1', style: ConstStyle.sourceSans1),
                  _space,
                  Text("Mobile Number", style: ConstStyle.sourceSansPro),
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
                      Text("+91 $mobNo", style: ConstStyle.sourceSans1),
                      const SizedBox(
                        width: 30,
                      ),
                      Container(
                        height: 30,
                        width: 90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xff00E152)),
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
                      )
                    ],
                  ),
                  _space,
                  Text("Email ID : ", style: ConstStyle.sourceSansPro),
                  _space1,
                  Row(
                    children: [
                      Text(
                          getPersonalDetail!.emailId != null
                              ? getPersonalDetail!.emailId.toString()
                              : "abc@gmail.com",
                          style: ConstStyle.sourceSans1),
                      const SizedBox(
                        width: 30,
                      ),
                      Container(
                        height: 30,
                        width: 90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xff00E152)),
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
                      )
                    ],
                  ),
                  _space,
                  Text("Date of Birth - Should be as per Aadhaar ",
                      style: ConstStyle.sourceSansPro),
                  _space1,
                  Text("dobDate.toString()", style: ConstStyle.sourceSans1),
                  _space,
                  Text("PAN Number ", style: ConstStyle.sourceSansPro),
                  _space1,
                  Row(
                    children: [
                      Text(getPersonalDetail!.panNumber.toString(),
                          style: ConstStyle.sourceSans1),
                      const SizedBox(
                        width: 30,
                      ),
                      Container(
                        height: 30,
                        width: 90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xff00E152)),
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
                      )
                    ],
                  ),
                  _space,
                  Text("Aadhaar Number ", style: ConstStyle.sourceSansPro),
                  _space1,
                  Row(
                    children: [
                      Text(getPersonalDetail!.aadharNumber.toString(),
                          style: ConstStyle.sourceSans1),
                      const SizedBox(
                        width: 30,
                      ),
                      Container(
                        height: 30,
                        width: 90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xff00E152)),
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
                      )
                    ],
                  ),
                  _space,
                  Text("What is your gender? ",
                      style: ConstStyle.sourceSansPro),
                  _space1,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 34,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: getPersonalDetail!.gender == 1
                                    ? Color(0xff23263B)
                                    : Color(0xffC8C7CD)),
                            color: getPersonalDetail!.gender == 1
                                ? Color(0xff22263D)
                                : Colors.white),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            "Male",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: TextStyle(
                                  color: getPersonalDetail!.gender == 1
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
                                color: getPersonalDetail!.gender == 2
                                    ? Color(0xff23263B)
                                    : Color(0xffC8C7CD)),
                            color: getPersonalDetail!.gender == 2
                                ? Color(0xff22263D)
                                : Colors.white),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            "Female",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: TextStyle(
                                  color: getPersonalDetail!.gender == 2
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
                                color: getPersonalDetail!.gender == 3
                                    ? Color(0xff23263B)
                                    : Color(0xffC8C7CD)),
                            color: getPersonalDetail!.gender == 3
                                ? Color(0xff22263D)
                                : Colors.white),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            "Trans",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: TextStyle(
                                  color: getPersonalDetail!.gender == 3
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
                  _space,
                  Text("What is your marital status?",
                      style: ConstStyle.sourceSansPro),
                  _space1,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 34,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: getPersonalDetail!.marriedStatus == 1
                                    ? Color(0xff23263B)
                                    : Color(0xffC8C7CD)),
                            color: getPersonalDetail!.marriedStatus == 1
                                ? Color(0xff22263D)
                                : Colors.white),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            "Single",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: TextStyle(
                                  color: getPersonalDetail!.marriedStatus == 1
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
                                color: getPersonalDetail!.marriedStatus == 2
                                    ? Color(0xff23263B)
                                    : Color(0xffC8C7CD)),
                            color: getPersonalDetail!.marriedStatus == 2
                                ? Color(0xff22263D)
                                : Colors.white),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            "Married",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: TextStyle(
                                  color: getPersonalDetail!.marriedStatus == 2
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
                                color: getPersonalDetail!.marriedStatus == 3
                                    ? Color(0xff23263B)
                                    : Color(0xffC8C7CD)),
                            color: getPersonalDetail!.marriedStatus == 3
                                ? Color(0xff22263D)
                                : Colors.white),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            "Others",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: TextStyle(
                                  color: getPersonalDetail!.marriedStatus == 3
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
                  _space,
                  Text("Address (As per record in KRA)",
                      style: ConstStyle.sourceSansPro),
                  _space1,
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: 1.2, color: Color(0xffC8C7CD)),
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xffF7F7FA)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                          "${getPersonalDetail!.addressLine1}, ${getPersonalDetail!.addressLine2}, ${getPersonalDetail!.addressLine3}",
                          textAlign: TextAlign.start,
                          style: ConstStyle.sourceSans1),
                    ),
                  ),
                  _space,
                  Text(
                    "What is your Occupation?  ",
                    style: ConstStyle.sourceSansPro,
                  ),
                  _space1,
                  Text(
                    getPersonalDetail!.occupation.toString(),
                    style: ConstStyle.sourceSans1,
                  ),
                  _space,
                  Text(
                    "What is your Annual income? ",
                    style: ConstStyle.sourceSansPro,
                  ),
                  _space1,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 34,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: getPersonalDetail!.annualIncome == 1
                                    ? Color(0xff23263B)
                                    : Color(0xffC8C7CD)),
                            color: getPersonalDetail!.annualIncome == 1
                                ? Color(0xff22263D)
                                : Colors.white),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            "Below 1 Lakh",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: TextStyle(
                                  color: getPersonalDetail!.annualIncome == 1
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
                                color: getPersonalDetail!.annualIncome == 2
                                    ? Color(0xff23263B)
                                    : Color(0xffC8C7CD)),
                            color: getPersonalDetail!.annualIncome == 2
                                ? Color(0xff22263D)
                                : Colors.white),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            "1-5 Lakh",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: TextStyle(
                                  color: getPersonalDetail!.annualIncome == 2
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
                                color: getPersonalDetail!.annualIncome == 3
                                    ? Color(0xff23263B)
                                    : Color(0xffC8C7CD)),
                            color: getPersonalDetail!.annualIncome == 3
                                ? Color(0xff22263D)
                                : Colors.white),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            "5-10 Lakh",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: TextStyle(
                                  color: getPersonalDetail!.annualIncome == 3
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
                                color: getPersonalDetail!.annualIncome == 4
                                    ? Color(0xff23263B)
                                    : Color(0xffC8C7CD)),
                            color: getPersonalDetail!.annualIncome == 4
                                ? Color(0xff22263D)
                                : Colors.white),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            "10-20 Lakh",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: TextStyle(
                                  color: getPersonalDetail!.annualIncome == 4
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
                                color: getPersonalDetail!.annualIncome == 5
                                    ? Color(0xff23263B)
                                    : Color(0xffC8C7CD)),
                            color: getPersonalDetail!.annualIncome == 5
                                ? Color(0xff22263D)
                                : Colors.white),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            "Above 25 Lakh",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: TextStyle(
                                  color: getPersonalDetail!.annualIncome == 5
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
                  _space,
                  Text(
                    "What is your trading experience? ",
                    style: ConstStyle.sourceSansPro,
                  ),
                  _space1,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 34,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: getPersonalDetail!.tradingExperience == 1
                                    ? Color(0xff23263B)
                                    : Color(0xffC8C7CD)),
                            color: getPersonalDetail!.tradingExperience == 1
                                ? Color(0xff22263D)
                                : Colors.white),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            "Less than 1 Year",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: TextStyle(
                                  color:
                                      getPersonalDetail!.tradingExperience == 1
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
                                color: getPersonalDetail!.tradingExperience == 2
                                    ? Color(0xff23263B)
                                    : Color(0xffC8C7CD)),
                            color: getPersonalDetail!.tradingExperience == 2
                                ? Color(0xff22263D)
                                : Colors.white),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            "1-2 Years",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: TextStyle(
                                  color:
                                      getPersonalDetail!.tradingExperience == 2
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
                                color: getPersonalDetail!.tradingExperience == 3
                                    ? Color(0xff23263B)
                                    : Color(0xffC8C7CD)),
                            color: getPersonalDetail!.tradingExperience == 3
                                ? Color(0xff22263D)
                                : Colors.white),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            "2-5 Years",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: TextStyle(
                                  color:
                                      getPersonalDetail!.tradingExperience == 3
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
                                color: getPersonalDetail!.tradingExperience == 4
                                    ? Color(0xff23263B)
                                    : Color(0xffC8C7CD)),
                            color: getPersonalDetail!.tradingExperience == 4
                                ? Color(0xff22263D)
                                : Colors.white),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            "5-10 Years",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: TextStyle(
                                  color:
                                      getPersonalDetail!.tradingExperience == 4
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
                                color: getPersonalDetail!.tradingExperience == 5
                                    ? Color(0xff23263B)
                                    : Color(0xffC8C7CD)),
                            color: getPersonalDetail!.tradingExperience == 5
                                ? Color(0xff22263D)
                                : Colors.white),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            "10-20 Years",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: TextStyle(
                                  color:
                                      getPersonalDetail!.tradingExperience == 5
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
                                color: getPersonalDetail!.tradingExperience == 6
                                    ? Color(0xff23263B)
                                    : Color(0xffC8C7CD)),
                            color: getPersonalDetail!.tradingExperience == 6
                                ? Color(0xff22263D)
                                : Colors.white),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            "20-25 Years",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: TextStyle(
                                  color:
                                      getPersonalDetail!.tradingExperience == 6
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
                                color: getPersonalDetail!.tradingExperience == 7
                                    ? Color(0xff23263B)
                                    : Color(0xffC8C7CD)),
                            color: getPersonalDetail!.tradingExperience == 7
                                ? Color(0xff22263D)
                                : Colors.white),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            "Above 25 Years",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: TextStyle(
                                  color:
                                      getPersonalDetail!.tradingExperience == 7
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
                  _space,
                  Text(
                    "Mother's Maiden Name? ",
                    style: ConstStyle.sourceSansPro,
                  ),
                  _space1,
                  Text(getPersonalDetail!.mothersMaidenName.toString(),
                      style: ConstStyle.sourceSans1),
                  _space,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Are You Politically Exposed",
                        style: ConstStyle.sourceSans1,
                      ),
                      Stack(
                        fit: StackFit.loose,
                        children: [
                          CustomSwitch(
                            activeColor: Colors.green,
                            value: getPersonalDetail!.isPoliticallyExposed == 1
                                ? true
                                : false,
                          ),
                          Container(
                              height: 40, width: 70, color: Colors.transparent),
                        ],
                      ),
                    ],
                  ),
                  _space,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: Text(
                          Strings.active_check,
                          style: ConstStyle.sourceSans1,
                        ),
                      ),
                      Stack(
                        fit: StackFit.loose,
                        children: [
                          CustomSwitch(
                            activeColor: Colors.green,
                            value:
                                getPersonalDetail!.wouldYouLikeToActivate == 1
                                    ? true
                                    : false,
                          ),
                          Container(
                              height: 40, width: 70, color: Colors.transparent),
                        ],
                      ),
                    ],
                  ),
                  _space,
                  Row(
                    children: [
                      Text(
                        "In-Person Verification",
                        style: ConstStyle.sourceSans1,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: getPersonalDetail!.inPersonVerification == 1
                                ? Color(0xff00E152)
                                : Color(0xffC8C7CD)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            getPersonalDetail!.inPersonVerification == 1
                                ? const Icon(
                                    Icons.done,
                                    size: 16,
                                    color: Colors.white,
                                  )
                                : const Icon(
                                    Icons.cancel_outlined,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              getPersonalDetail!.inPersonVerification == 1
                                  ? "Verified"
                                  : "Not Verified",
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
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Container(
              foregroundDecoration: const RotatedCornerDecoration(
                color: Colors.pinkAccent,
                geometry: BadgeGeometry(
                    width: 48,
                    height: 48,
                    alignment: BadgeAlignment.bottomLeft),
                textSpan: TextSpan(text: 'OK', style: TextStyle(fontSize: 12)),
                labelInsets: LabelInsets(baselineShift: 3, start: 1),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget editPersonalDetails(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        8.0,
      ),
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    profileprofilevisbileTab1 = true;
                    profilevisbileTab2 = false;
                    profilevisbileTab3 = false;
                    bankDetails = false;
                    dematDetails = false;
                    inPersonVerifications = false;
                    addNewDematAccounts = false;
                    existingDematAccountDetails = false;
                    isNewDemat = false;
                    isMandatory = false;
                    isUpload = false;
                    isSignInDemat = false;
                    isNomineeAdd = false;
                    isAddressAdd = false;
                    isAddNominee = false;
                    cardDetails = false;
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
                visible: isEditStep1,
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
                                  SizedBox(
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
                        /*TextField(
                          controller: txtMob,
                          autofocus: false,
                          style: ConstStyle.sourceSansmob,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            prefixIcon: Image.asset(
                              "assets/images/india.png",
                              width: 5,
                              height: 5,
                              scale: 4,
                            ),
                            suffixIcon: Image.asset(
                              "assets/images/done1.png",
                              color: Colors.green,
                              scale: 6,
                            ),
                            hintText: "+91 9876656473",
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            contentPadding:
                                const EdgeInsets.only(bottom: 6.0, top: 5.0),
                          ),
                        ),*/
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
                      child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                width: 1.1, color: AppColors.borderColor),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 14.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          )),
                    ),
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
                                print("VALUE : $potentially_exposed_statusInt");
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
                          setState(() {
                            isEditStep1 = false;
                            isEditStep2 = true;
                            isButtonClick = true;
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
                      height: 20,
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: isEditStep2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: isGoogleSign,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hey $firstName1, Let’s Verify Your Email Id",
                              style: ConstStyle.quickMedium,
                            ),
                            _space,
                            _space,
                            _space1,
                            Text("Email ID* ", style: ConstStyle.sourceSansPro),
                            _space1,
                            InkWell(
                              onTap: () {
                                setState(() async{
                                  isGoogleSign = false;
                                  final user = await signInWithGoogle();
                                  await logout();
                                  print("${user.user!.email}");
                                  await HelperFunctions.saveEmail("${user.user!.email}");
                                  isEmailVerified = true;
                                  mail = await HelperFunctions.getEmailId();
                                });
                              },
                              child: Container(
                                  height: 55,
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0x29000000),
                                          blurRadius: 4.0,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        ConstantImage.google,
                                        scale: 8,
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        "Sign in with Google",
                                        style: ConstStyle.sourceSans,
                                      )
                                    ],
                                  )),
                            ),
                            _space,
                            Center(
                                child:
                                    Text("Or", style: ConstStyle.quickMedium)),
                            _space,
                            InkWell(
                              onTap: () {
                                onEmailAddedBottomSheet();
                              },
                              child: Container(
                                  height: 55,
                                  decoration: const BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      color: Color(0x29000000),
                                      blurRadius: 6.0,
                                    ),
                                  ], color: AppColors.primaryColor),
                                  child: Center(
                                    child: Text(
                                        "Would you like to use a different E-mail address",
                                        style: GoogleFonts.quicksand(
                                          textStyle: const TextStyle(
                                            color: Color(0xffFfffff),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                          ),
                                        )),
                                  )),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2, color: Color(0xffC8C7CE))),
                                child: Center(
                                    child: Text(
                                  "Continue",
                                  style: ConstStyle.sourceSansDisable,
                                )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: isEmailVerified,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hey $firstName1, Congratulations! \nYour Email is Verified",
                              style: ConstStyle.quickMedium,
                            ),
                            _space,
                            Text("Email ID* ", style: ConstStyle.sourceSansPro),
                            _space1,
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 12.0),
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      width: 1.1, color: AppColors.borderColor),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(width: 290,child: Text(mail.toString(),overflow: TextOverflow.ellipsis,style: ConstStyle.sourceSans5,)),
                                    Image.asset(
                                      "assets/images/done1.png",
                                      color: Colors.green,
                                      scale: 6,
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.30,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isEmailVerified = false;
                                  isPanVerify = true;
                                });
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 30),
                                child: Container(
                                  height: 45,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2,
                                          color: AppColors.textColor)),
                                  child: Center(
                                      child: Text(
                                    "Continue",
                                    style: ConstStyle.quickStandBtn,
                                  )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: isPanVerify,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hey $firstName1, Let’s Validate Your PAN ",
                              style: ConstStyle.quickMedium,
                            ),
                            _space,
                            Text("PAN Number* ",
                                style: ConstStyle.sourceSansPro),
                            _space1,
                            Container(
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    width: 1.1,
                                    color: isPanSelected
                                        ? AppColors.textColor
                                        : Color(0xffC8C7CE)),
                              ),
                              child: TextField(
                                controller: panNumber,
                                autofocus: false,
                                style: ConstStyle.sourceSansmob,
                                textCapitalization:
                                    TextCapitalization.characters,
                                onChanged: (text) {
                                  setState(() {
                                    if (panNumber.text.length < 10) {
                                      isPanSelected = false;
                                    } else {
                                      isPanSelected = true;
                                    }
                                  });
                                },
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(10),
                                ],
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    suffixIcon: InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (isPanSelected == true) {
                                            verifyPanNoBottomSheet();
                                          }
                                        });
                                      },
                                      child: Container(
                                        width: 80,
                                        color: isPanSelected
                                            ? AppColors.textColor
                                            : Color(0xffC8C7CE),
                                        child: Center(
                                          child: Text("Verify",
                                              style: GoogleFonts.quicksand(
                                                  textStyle: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500))),
                                        ),
                                      ),
                                    ),
                                    hintText: "10 Digit Pan Number",
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                        color: isPanSelected
                                            ? AppColors.textColor
                                            : Color(0xffC8C7CE),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                        letterSpacing: 4),
                                    fillColor: Colors.white,
                                    contentPadding: const EdgeInsets.only(
                                        left: 14.0, bottom: 7.0, top: 5.0)),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.37,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 30),
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2, color: Color(0xffC8C7CE))),
                                child: Center(
                                    child: Text(
                                  "Continue",
                                  style: ConstStyle.sourceSansDisable,
                                )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: isAadhaarVerified,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hey $firstName1, let's Authenticate \nYour AADHAAR",
                        style: ConstStyle.quickMedium,
                      ),
                      _space,
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Digilocker();
                          }));
                        },
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2, color: AppColors.textColor)),
                          child: Center(
                              child: Text(
                            "Authenticate Aadhaar",
                            style: ConstStyle.quickStandBtn,
                          )),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 2.2,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isEditStep12 = true;
                            isAadhaarVerified = false;
                            isEditStep1 = false;
                            isEditStep2 = false;
                          });
                        },
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2, color: AppColors.textColor)),
                          child: Center(
                              child: Text(
                            "Let's Continue",
                            style: ConstStyle.quickStandBtn,
                          )),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: isEditStep12,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hey $firstName1, Please Verify, We Fetched This Information From Pan And KRA Records, As Provided By You.",
                        style: ConstStyle.quickMedium,
                      ),
                      _space,
                      Text("Aadhaar Number ", style: ConstStyle.sourceSansPro),
                      _space1,
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              width: 1.1, color: AppColors.borderColor),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "2565 7654 6543",
                                style: ConstStyle.sourceSans5,
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
                      _space,
                      Text("Address (As per record in KRA) : ",
                          style: ConstStyle.sourceSansPro),
                      _space1,
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              width: 1.1, color: AppColors.borderColor),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 8),
                          child: Text(
                            Strings.address,
                            style: ConstStyle.sourceSans,
                          ),
                        ),
                      ),
                      _space,
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: isAddressAdd
                                    ? Color(0xff22263D)
                                    : Color(0xffC8C7CE),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "I wish to update my Address",
                              style: ConstStyle.sourceSans1,
                            ),
                          ],
                        ),
                      ),
                      _space,
                      Visibility(
                        visible: isAddressAdd == false ? false : true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Address Proof ",
                                style: ConstStyle.sourceSansPro),
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
                                        hint: Text("Select Address Proof"),
                                        items: address_data.map((item) {
                                          return DropdownMenuItem(
                                              value:
                                                  item.addressProof.toString(),
                                              child: Text(
                                                item.addressProof,
                                                style: const TextStyle(
                                                  fontSize: 17.0,
                                                ),
                                              ));
                                        }).toList(),
                                        onChanged: (String? newVal) {
                                          setState(() {
                                            addressid = newVal;
                                            print(addressid.toString());
                                          });
                                        },
                                        value: addressid,
                                      ),
                                    ))),
                            const SizedBox(
                              height: 7,
                            ),
                            Text(
                                "Enter your address details exactly as per your document otherwise your application will get rejected",
                                style: ConstStyle.sourceSansPro12),
                            _space,
                            Visibility(
                              visible: isScans,
                              child: InkWell(
                                onTap: () {
                                  uploadPassportBottomSheet();
                                },
                                child: Container(
                                  height: 45,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2,
                                          color: AppColors.textColor)),
                                  child: Center(
                                      child: Text(
                                    "Upload Passport Scans",
                                    style: ConstStyle.quickStandBtn,
                                  )),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: isPassportImage,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Passport Frontside Image",
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
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          width: 1, color: AppColors.textColor),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 14.0, top: 4),
                                          child: Text(
                                            "passportfrontside.jpg",
                                            style: TextStyle(
                                                color: Color(0xff22263D),
                                                fontWeight: FontWeight.w400,
                                                fontSize: 15),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            uploadPassportBottomSheet();
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 12.0),
                                            child: Image.asset(
                                              "assets/images/edit.png",
                                              scale: 4,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  _space,
                                  Text(
                                    "Passport Backside Image",
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
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 14.0, top: 4),
                                          child: Text(
                                            "passportbackside.jpg",
                                            style: TextStyle(
                                                color: Color(0xff22263D),
                                                fontWeight: FontWeight.w400,
                                                fontSize: 15),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            uploadPassportBottomSheet();
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 12.0),
                                            child: Image.asset(
                                              "assets/images/edit.png",
                                              scale: 4,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            _space,
                            Text(
                              "Add New Address",
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
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    width: 1, color: AppColors.textColor),
                              ),
                              child: TextField(
                                controller: addressLine1,
                                autofocus: false,
                                style: ConstStyle.sourceSans5,
                                decoration: InputDecoration(
                                  hintText: "ADDRESS LINE 1",
                                  hintStyle: ConstStyle.sourceSans5,
                                  border: InputBorder.none,
                                  fillColor: Colors.white,
                                  contentPadding: const EdgeInsets.only(
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
                                controller: addressLine2,
                                autofocus: false,
                                style: ConstStyle.sourceSans5,
                                decoration: InputDecoration(
                                  hintText: "ADDRESS LINE 2",
                                  hintStyle: ConstStyle.sourceSans5,
                                  border: InputBorder.none,
                                  fillColor: Colors.white,
                                  contentPadding: const EdgeInsets.only(
                                      left: 14.0, bottom: 7.0, top: 6.0),
                                ),
                              ),
                            ),
                            _space,
                            Text(
                              "Pin Code",
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
                                controller: addressZip,
                                autofocus: false,
                                style: ConstStyle.sourceSans5,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(6),
                                ],
                                decoration: InputDecoration(
                                  hintText: "Enter 6 digit zip code",
                                  hintStyle: ConstStyle.sourceSans5,
                                  border: InputBorder.none,
                                  fillColor: Colors.white,
                                  contentPadding: const EdgeInsets.only(
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
                                      width: 1.1, color: AppColors.borderColor),
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14.0),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2(
                                        hint: Text("Select State"),
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
                                        hint: Text("Select City"),
                                        items: city_data.map((item) {
                                          return DropdownMenuItem(
                                              value: item.cityId.toString(),
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
                                            cityid = newVal;
                                            print(cityid.toString());
                                          });
                                        },
                                        value: cityid,
                                      ),
                                    ))),
                          ],
                        ),
                      ),
                      _space,
                      _space,
                      InkWell(
                        onTap: () {
                          if (isAddressAdd == true) {
                            if (addressid == null) {
                              Fluttertoast.showToast(
                                  msg: 'Select Address Proof');
                            } else if (addressLine1.text.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: "Enter Address Line1 ");
                            } else if (addressLine2.text.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: 'Enter Address Line2 ');
                            } else if (addressZip.text.isEmpty) {
                              Fluttertoast.showToast(msg: 'Enter Your Pincode');
                            } else if (stateid == null) {
                              Fluttertoast.showToast(msg: 'Select Your State');
                            } else if (cityid == null) {
                              Fluttertoast.showToast(msg: 'Select Your City');
                            } else {
                              setState(() {
                                isEditStep12 = false;
                                isAadhaarVerified = false;
                                isEditStep1 = false;
                                isEditStep2 = false;
                                isAdditional = true;
                              });
                            }
                          } else {
                            setState(() {
                              isEditStep12 = false;
                              isAadhaarVerified = false;
                              isEditStep1 = false;
                              isEditStep2 = false;
                              isAdditional = true;
                            });
                          }
                        },
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2, color: AppColors.textColor)),
                          child: Center(
                              child: Text(
                            "Continue",
                            style: ConstStyle.quickStandBtn,
                          )),
                        ),
                      ),
                      _space,
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: isAdditional,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hey $firstName1, We Need Some Additional Information, It Won’t Take Long.",
                        style: ConstStyle.quickMedium,
                      ),
                      _space,
                      Text("What is your gender? ",
                          style: ConstStyle.sourceSansPro),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                genderIndex = 1;
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
                                      width: 1, color: Color(0xff23263B)),
                                  color: genderIndex == 1
                                      ? Color(0xff22263D)
                                      : Colors.white),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Text(
                                  "Male",
                                  style: GoogleFonts.sourceSansPro(
                                    textStyle: TextStyle(
                                        color: genderIndex == 1
                                            ? Colors.white
                                            : Color(0xff22263D),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  ),
                                ),
                              )),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                genderIndex = 2;
                              });
                            },
                            child: Container(
                              height: 34,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x29000000),
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                  border: Border.all(
                                      width: 1, color: Color(0xff23263B)),
                                  color: genderIndex == 2
                                      ? Color(0xff22263D)
                                      : Colors.white),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Text(
                                  "Female",
                                  style: GoogleFonts.sourceSansPro(
                                    textStyle: TextStyle(
                                        color: genderIndex == 2
                                            ? Colors.white
                                            : Color(0xff22263D),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  ),
                                ),
                              )),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                genderIndex = 3;
                              });
                            },
                            child: Container(
                              height: 34,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x29000000),
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                  border: Border.all(
                                      width: 1, color: Color(0xff23263B)),
                                  color: genderIndex == 3
                                      ? Color(0xff22263D)
                                      : Colors.white),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Text(
                                  "Trans",
                                  style: GoogleFonts.sourceSansPro(
                                    textStyle: TextStyle(
                                        color: genderIndex == 3
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
                      Text("What is your marital status? ",
                          style: ConstStyle.sourceSansPro),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                maritalIndex = 1;
                              });
                            },
                            child: Container(
                              height: 34,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x29000000),
                                    blurRadius: 6.0,
                                  ),
                                ],
                                border: Border.all(
                                    width: 1, color: Color(0xff23263B)),
                                color: maritalIndex == 1
                                    ? Color(0xff22263D)
                                    : Colors.white,
                              ),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Text(
                                  "Single",
                                  style: GoogleFonts.sourceSansPro(
                                    textStyle: TextStyle(
                                        color: maritalIndex == 1
                                            ? Colors.white
                                            : Color(0xff22263D),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  ),
                                ),
                              )),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                maritalIndex = 2;
                              });
                            },
                            child: Container(
                              height: 34,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x29000000),
                                    blurRadius: 6.0,
                                  ),
                                ],
                                border: Border.all(
                                    width: 1, color: Color(0xff23263B)),
                                color: maritalIndex == 2
                                    ? Color(0xff22263D)
                                    : Colors.white,
                              ),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Text(
                                  "Married",
                                  style: GoogleFonts.sourceSansPro(
                                    textStyle: TextStyle(
                                        color: maritalIndex == 2
                                            ? Colors.white
                                            : Color(0xff22263D),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  ),
                                ),
                              )),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                maritalIndex = 3;
                              });
                            },
                            child: Container(
                              height: 34,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x29000000),
                                    blurRadius: 6.0,
                                  ),
                                ],
                                border: Border.all(
                                    width: 1, color: Color(0xff23263B)),
                                color: maritalIndex == 3
                                    ? Color(0xff22263D)
                                    : Colors.white,
                              ),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Text(
                                  "Others",
                                  style: GoogleFonts.sourceSansPro(
                                    textStyle: TextStyle(
                                        color: maritalIndex == 3
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
                      Text("What is your Occupation? ",
                          style: ConstStyle.sourceSansPro),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                width: 1.1, color: AppColors.borderColor),
                          ),
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14.0),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  hint: Text("Select Occupation"),
                                  items: profession_data.map((item) {
                                    return DropdownMenuItem(
                                        value: item.id.toString(),
                                        child: Text(
                                          item.professionName,
                                          style: const TextStyle(
                                            fontSize: 17.0,
                                          ),
                                        ));
                                  }).toList(),
                                  onChanged: (String? newVal) {
                                    setState(() {
                                      professionID = newVal;
                                      print(professionID.toString());
                                    });
                                  },
                                  value: professionID,
                                ),
                              ))),
                      _space,
                      Text("What is your Annual income? ",
                          style: ConstStyle.sourceSansPro),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                incomeIndex = 1;
                              });
                            },
                            child: Container(
                              height: 34,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x29000000),
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                  border: Border.all(
                                      width: 1, color: Color(0xff23263B)),
                                  color: incomeIndex == 1
                                      ? Color(0xff22263D)
                                      : Colors.white),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Text(
                                  "Below 1 Lakh",
                                  style: GoogleFonts.sourceSansPro(
                                    textStyle: TextStyle(
                                        color: incomeIndex == 1
                                            ? Colors.white
                                            : Color(0xff22263D),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  ),
                                ),
                              )),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                incomeIndex = 2;
                              });
                            },
                            child: Container(
                              height: 34,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x29000000),
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                  border: Border.all(
                                      width: 1, color: Color(0xff23263B)),
                                  color: incomeIndex == 2
                                      ? Color(0xff22263D)
                                      : Colors.white),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Text(
                                  "1-5 Lakh",
                                  style: GoogleFonts.sourceSansPro(
                                    textStyle: TextStyle(
                                        color: incomeIndex == 2
                                            ? Colors.white
                                            : Color(0xff22263D),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  ),
                                ),
                              )),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                incomeIndex = 3;
                              });
                            },
                            child: Container(
                              height: 34,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x29000000),
                                    blurRadius: 6.0,
                                  ),
                                ],
                                border: Border.all(
                                    width: 1, color: Color(0xff23263B)),
                                color: incomeIndex == 3
                                    ? Color(0xff22263D)
                                    : Colors.white,
                              ),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Text(
                                  "5-10 Lakh",
                                  style: GoogleFonts.sourceSansPro(
                                    textStyle: TextStyle(
                                        color: incomeIndex == 3
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
                      _space1,
                      _space1,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                incomeIndex = 4;
                              });
                            },
                            child: Container(
                              height: 34,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x29000000),
                                    blurRadius: 6.0,
                                  ),
                                ],
                                border: Border.all(
                                    width: 1, color: Color(0xff23263B)),
                                color: incomeIndex == 4
                                    ? Color(0xff22263D)
                                    : Colors.white,
                              ),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Text(
                                  "10-25 Lakh",
                                  style: GoogleFonts.sourceSansPro(
                                    textStyle: TextStyle(
                                        color: incomeIndex == 4
                                            ? Colors.white
                                            : Color(0xff22263D),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  ),
                                ),
                              )),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                incomeIndex = 5;
                              });
                            },
                            child: Container(
                              height: 34,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x29000000),
                                    blurRadius: 6.0,
                                  ),
                                ],
                                border: Border.all(
                                    width: 1, color: Color(0xff23263B)),
                                color: incomeIndex == 5
                                    ? Color(0xff22263D)
                                    : Colors.white,
                              ),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Text(
                                  "Above 25 Lakh",
                                  style: GoogleFonts.sourceSansPro(
                                    textStyle: TextStyle(
                                        color: incomeIndex == 5
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
                      Text("What is your trading experience? ",
                          style: ConstStyle.sourceSansPro),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                experienceIndex = 1;
                              });
                            },
                            child: Container(
                              height: 34,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x29000000),
                                    blurRadius: 6.0,
                                  ),
                                ],
                                border: Border.all(
                                    width: 1, color: Color(0xff23263B)),
                                color: experienceIndex == 1
                                    ? Color(0xff22263D)
                                    : Colors.white,
                              ),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Text(
                                  "Less than 1 Year",
                                  style: GoogleFonts.sourceSansPro(
                                    textStyle: TextStyle(
                                        color: experienceIndex == 1
                                            ? Colors.white
                                            : Color(0xff22263D),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  ),
                                ),
                              )),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                experienceIndex = 2;
                              });
                            },
                            child: Container(
                              height: 34,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x29000000),
                                    blurRadius: 6.0,
                                  ),
                                ],
                                border: Border.all(
                                    width: 1, color: Color(0xff23263B)),
                                color: experienceIndex == 2
                                    ? Color(0xff22263D)
                                    : Colors.white,
                              ),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Text(
                                  "1-2 Years",
                                  style: GoogleFonts.sourceSansPro(
                                    textStyle: TextStyle(
                                        color: experienceIndex == 2
                                            ? Colors.white
                                            : Color(0xff22263D),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  ),
                                ),
                              )),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                experienceIndex = 3;
                              });
                            },
                            child: Container(
                              height: 34,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x29000000),
                                    blurRadius: 6.0,
                                  ),
                                ],
                                border: Border.all(
                                    width: 1, color: Color(0xff23263B)),
                                color: experienceIndex == 3
                                    ? Color(0xff22263D)
                                    : Colors.white,
                              ),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Text(
                                  "2-5 Years",
                                  style: GoogleFonts.sourceSansPro(
                                    textStyle: TextStyle(
                                        color: experienceIndex == 3
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
                      _space1,
                      _space1,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                experienceIndex = 4;
                              });
                            },
                            child: Container(
                              height: 34,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x29000000),
                                    blurRadius: 6.0,
                                  ),
                                ],
                                border: Border.all(
                                    width: 1, color: Color(0xff23263B)),
                                color: experienceIndex == 4
                                    ? Color(0xff22263D)
                                    : Colors.white,
                              ),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Text(
                                  "5-10 Years",
                                  style: GoogleFonts.sourceSansPro(
                                    textStyle: TextStyle(
                                        color: experienceIndex == 4
                                            ? Colors.white
                                            : Color(0xff22263D),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  ),
                                ),
                              )),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                experienceIndex = 5;
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
                                    width: 1, color: Color(0xff23263B)),
                                color: experienceIndex == 5
                                    ? Color(0xff22263D)
                                    : Colors.white,
                              ),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Text(
                                  "10-20 Years",
                                  style: GoogleFonts.sourceSansPro(
                                    textStyle: TextStyle(
                                        color: experienceIndex == 5
                                            ? Colors.white
                                            : Color(0xff22263D),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  ),
                                ),
                              )),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                experienceIndex = 6;
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
                                    width: 1, color: Color(0xff23263B)),
                                color: experienceIndex == 6
                                    ? Color(0xff22263D)
                                    : Colors.white,
                              ),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Text(
                                  "20-25 Years",
                                  style: GoogleFonts.sourceSansPro(
                                    textStyle: TextStyle(
                                        color: experienceIndex == 6
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
                      _space1,
                      _space1,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                experienceIndex = 7;
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
                                    width: 1, color: Color(0xff23263B)),
                                color: experienceIndex == 7
                                    ? Color(0xff22263D)
                                    : Colors.white,
                              ),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Text(
                                  "Above 25 Years",
                                  style: GoogleFonts.sourceSansPro(
                                    textStyle: TextStyle(
                                        color: experienceIndex == 7
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
                      Text("Mother's Maiden Name? ",
                          style: ConstStyle.sourceSansPro),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              width: 1.1, color: AppColors.borderColor),
                        ),
                        child: TextField(
                          controller: maidenName,
                          autofocus: false,
                          style: ConstStyle.sourceSans5,
                          keyboardType: TextInputType.text,
                          onChanged: (text) {
                            setState(() {
                              isMaiden = true;
                            });
                          },
                          decoration: const InputDecoration(
                            hintText: "Maiden Name",
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.only(
                                left: 14.0, bottom: 7.0, top: 5.0),
                          ),
                        ),
                      ),
                      _space,
                      _space,
                      _space1,
                      InkWell(
                        onTap: () {
                          if (isMaiden == true) {
                            if (professionID == null) {
                              Fluttertoast.showToast(
                                  msg: 'Select Your Occupation');
                            } else if (maidenName.text.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: 'Enter Your Maiden Name');
                            } else {
                              // ProfileRepository().addPersonalDetails(
                              //   firstName.text.toString(),
                              //   lastName.text.toString(),
                              //   panNumber.text.toString(),
                              //   addressLine1.text.toString(),
                              //   addressLine2.text.toString(),
                              //   addressZip.text.toString(),
                              //   maidenName.text.toString(),
                              //   genderIndex,
                              //   maritalIndex,
                              //   incomeIndex,
                              //   experienceIndex,
                              //   dob.toString(),
                              //   potentially_exposed_statusInt,
                              //   activate_futureInt,
                              //   isCheckedInt,
                              //   isChecked1Int,
                              // );
                              setState(() {

                                inPersonVerifications = true;
                                profileprofilevisbileTab1 = false;
                                profilevisbileTab2 = false;
                                profilevisbileTab3 = false;
                                bankDetails = false;
                                dematDetails = false;
                                addNewDematAccounts = false;
                                existingDematAccountDetails = false;
                                isNewDemat = false;
                                isMandatory = false;
                                isUpload = false;
                                isSignInDemat = false;
                                isNomineeAdd = false;
                                isAddressAdd = false;
                                isAddNominee = false;
                                cardDetails = false;
                                isButtonClickMaiden = true;
                              });
                            }
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                            bottom: 20.0,
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
                                  color: isButtonClickMaiden == false
                                      ? isMaiden
                                          ? AppColors.textColor
                                          : Color(0xffE1E0E6)
                                      : Color(0xffFF405A)),
                              color: isButtonClickMaiden == false
                                  ? Colors.white
                                  : Color(0xffFF405A),
                            ),
                            child: Center(
                                child: Text(
                              "Continue",
                              style: GoogleFonts.quicksand(
                                textStyle: TextStyle(
                                    color: isButtonClickMaiden == false
                                        ? isMaiden
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
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget editPersonalPic() {
    return Padding(
      padding: const EdgeInsets.all(
        8.0,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color(0xffF7F7FA),
            border: Border.all(width: 1.2, color: Color(0xffbcbcbc))),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    profileprofilevisbileTab1 = true;
                    profilevisbileTab2 = true;
                    profilevisbileTab3 = false;
                    bankDetails = false;
                    dematDetails = false;
                    inPersonVerifications = false;
                    addNewDematAccounts = false;
                    existingDematAccountDetails = false;
                    isNewDemat = false;
                    isMandatory = false;
                    isUpload = false;
                    isSignInDemat = false;
                    isNomineeAdd = false;
                    isAddressAdd = false;
                    isAddNominee = false;
                    cardDetails = false;
                  });
                },
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 25,
                    width: 80,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(5),
                            bottomLeft: Radius.circular(5)),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      children: [
                        Text(
                          "Personal Details",
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: Color(0xff22263D),
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            "STEP 2 of 2",
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
              _space1,
              _space,
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  Strings.identity,
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                ),
              ),
              _space1,
              Text(
                Strings.identity_text,
                style: GoogleFonts.sourceSansPro(
                  textStyle: const TextStyle(
                      color: Color(0xff22263D),
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              ),
              _space,
              Text(
                Strings.note,
                textAlign: TextAlign.center,
                style: GoogleFonts.sourceSansPro(
                  textStyle: const TextStyle(
                      color: Color(0xffFF405A),
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
              ),
              _space,
              Container(
                height: 220,
                width: 210,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 2,
                      color: _image != null
                          ? const Color(0xff66DC65)
                          : AppColors.primaryColor),
                  // image: const DecorationImage(
                  //   image: AssetImage(ConstantImage.profile_pic),
                  // )
                ),
                child: _image != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.file(
                          _image!,
                          fit: BoxFit.fill,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: SvgPicture.asset(
                            ConstantImage.profile_pic,
                          ),
                        ),
                      ),
              ),
              _space,
              InkWell(
                onTap: () async {
                  final pickedFile =
                      await _picker.getImage(source: ImageSource.camera);
                  if (pickedFile != null) {
                    setState(() {
                      _image = File(pickedFile.path);
                      isCapture = true;
                    });
                  }
                },
                child: Container(
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: AppColors.primaryColor),
                  child: Center(
                      child: Text(
                    "Capture",
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 10),
                    ),
                  )),
                ),
              ),
              _space,
              _space1,
              Text(
                Strings.tips,
                textAlign: TextAlign.center,
                style: GoogleFonts.sourceSansPro(
                  textStyle: const TextStyle(
                      color: Color(0xff22263D),
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              ),
              _space,
              _space1,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SvgPicture.asset(
                        ConstantImage.bulb,
                        height: 40,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        Strings.good_light,
                        style: GoogleFonts.sourceSansPro(
                          textStyle: TextStyle(
                              color: Color(0xff22263D),
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SvgPicture.asset(
                        ConstantImage.webcam,
                        height: 40,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        Strings.look,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.sourceSansPro(
                          textStyle: TextStyle(
                              color: Color(0xff22263D),
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        ConstantImage.sunglasses,
                        height: 40,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        Strings.Sungalses,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.sourceSansPro(
                          textStyle: TextStyle(
                              color: Color(0xffff405A),
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        ConstantImage.cap,
                        height: 40,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        Strings.Caps,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.sourceSansPro(
                          textStyle: TextStyle(
                              color: Color(0xffff405A),
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                      )
                    ],
                  )
                ],
              ),
              _space,
              _space,
              InkWell(
                onTap: () {
                  onProfilePicVerificationBottomSheet();
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
                          color: isCapture
                              ? AppColors.textColor
                              : Color(0xffE1E0E6)),
                      color: Colors.white),
                  child: Center(
                      child: Text(
                    "Continue",
                    style: GoogleFonts.quicksand(
                      textStyle: TextStyle(
                          color: isCapture
                              ? AppColors.textColor
                              : Color(0xffE1E0E6),
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  )),
                ),
              ),
              _space,
              _space1,
            ],
          ),
        ),
      ),
    );
  }

  Widget bankDetail() {
    return Padding(
      padding: const EdgeInsets.all(
        8.0,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color(0xffF7F7FA),
            border: Border.all(width: 1.2, color: Color(0xffbcbcbc))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Bank Details",
                  style: GoogleFonts.quicksand(
                    textStyle: TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                indent: 5,
                endIndent: 5,
              ),
              _space,
              Text(
                "Hey $firstName1, Enter Your Bank Details",
                style: GoogleFonts.quicksand(
                  textStyle: TextStyle(
                      color: Color(0xff22263D),
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
              ),
              Text(
                "We will deposit ₹1 in your bank account to verify it",
                style: GoogleFonts.sourceSansPro(
                  textStyle: TextStyle(
                      color: Color(0xff22263D),
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              ),
              _space,
              Text(
                "IFSC Code ",
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1.1, color: AppColors.borderColor),
                ),
                child: TextField(
                  controller: ifscCode,
                  autofocus: false,
                  textCapitalization: TextCapitalization.characters,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(11),
                  ],
                  style: GoogleFonts.sourceSansPro(
                    textStyle: TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        letterSpacing: 4),
                  ),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Enter IFSC code",
                    hintStyle: TextStyle(color: Color(0xffC8C7CE)),
                    border: InputBorder.none,
                    fillColor: Colors.white,
                    contentPadding:
                        const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 5),
                  ),
                ),
              ),
              _space1,
              _space1,
              RichText(
                text: const TextSpan(children: [
                  TextSpan(
                      text: "Click here",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Color(0xffFF405A))),
                  TextSpan(
                      text: "  for help with the IFSC code.",
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Color(0xff22263D))),
                ]),
              ),
              _space,
              Text(
                "Bank Account Number ",
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1.1, color: AppColors.borderColor),
                ),
                child: TextField(
                  controller: bankAccountNo,
                  obscureText: true,
                  autofocus: false,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(16),
                  ],
                  style: GoogleFonts.sourceSansPro(
                    textStyle: TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        letterSpacing: 4),
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Enter 16 Digit Account Number",
                    hintStyle: TextStyle(color: Color(0xffC8C7CE)),
                    border: InputBorder.none,
                    fillColor: Colors.white,
                    labelStyle:
                        TextStyle(color: AppColors.textColor, letterSpacing: 4),
                    contentPadding:
                        const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 5),
                  ),
                ),
              ),
              _space,
              Text(
                "Re-enter Bank Account Number ",
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
                    textStyle: TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        letterSpacing: 4),
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Enter 16 Digit Re-Account number",
                    hintStyle: TextStyle(color: Color(0xffC8C7CE)),
                    labelStyle:
                        TextStyle(color: AppColors.textColor, letterSpacing: 4),
                    border: InputBorder.none,
                    fillColor: Colors.white,
                    contentPadding:
                        const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 5),
                  ),
                ),
              ),
              _space,
              Text(
                "Account Type? ",
                style: GoogleFonts.sourceSansPro(
                  textStyle: TextStyle(
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
                  SizedBox(
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
                          boxShadow: [
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
                          boxShadow: [
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
                  SizedBox(
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
                            BoxShadow(
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
                              width: 1.1, color: AppColors.borderColor),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 14.0, top: 12),
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
                  onTap: () {
                    setState(() {
                      if (inCheckCancelled == true) {
                        onBank1AddedBottomSheet();
                      } else {
                        onNameNotMatchedBottomSheet();
                      }
                    });
                  },
                  child: InkWell(
                    onTap: () async {
                      if (ifscCode.text.isEmpty) {
                        Fluttertoast.showToast(msg: "Enter Your IFSC Code");
                      } else if (bankAccountNo.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Enter Your Account Number");
                      } else if (bankAccountNo.text.toString() !=
                          confirmBankAcc.text.toString()) {
                        Fluttertoast.showToast(
                            msg: "Re-Account does not match");
                      } else {
                        // final addBankDetailModel = await BankDetailRepository()
                        //     .addbankDetails(
                        //         ifscCode.text.toString(),
                        //         bankAccountNo.text.toString(),
                        //         savingIndex,
                        //         jointIndex);
                        // if (addBankDetailModel != null) {
                        //   onBank1AddedBottomSheet();
                        // }
                      }

                      // _addBankDetails(
                      //     ifscCode.text.toString(),
                      //     bankAccountNo.text.toString(),
                      //     confirmBankAcc.text.toString(),
                      //     savingIndex,
                      //     jointIndex);
                      // onBank1AddedBottomSheet();
                    },
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 2, color: AppColors.textColor)),
                      child: Center(
                          child: Text(
                        "Submit",
                        style: ConstStyle.quickStandBtn,
                      )),
                    ),
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

  Widget NewDematWidget() {
    return Padding(
      padding: const EdgeInsets.all(
        8.0,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color(0xffF7F7FA),
            border: Border.all(width: 1.2, color: const Color(0xffbcbcbc))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  profileprofilevisbileTab1 = false;
                  profilevisbileTab2 = false;
                  profilevisbileTab3 = false;
                  bankDetails = false;
                  dematDetails = false;
                  inPersonVerifications = false;
                  addNewDematAccounts = true;
                  existingDematAccountDetails = false;
                  isNewDemat = false;
                  isMandatory = false;
                  isUpload = false;
                  isSignInDemat = false;
                  isNomineeAdd = false;
                  isAddressAdd = false;
                  isAddNominee = false;
                  cardDetails = false;
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
                        textStyle: TextStyle(
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
                        textStyle: TextStyle(
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
                        textStyle: TextStyle(
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
                              hint: const Text("Select Region"),
                              items: born_list.map((item) {
                                return DropdownMenuItem(
                                    value: item.whereYouBornId.toString(),
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
                                    textStyle: TextStyle(
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
                        textStyle: TextStyle(
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
                              hint: const Text("Select Primary Wealth"),
                              items: wealth_list.map((item) {
                                return DropdownMenuItem(
                                    value:
                                        item.primarySourceOfWealthId.toString(),
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
                          });
                        },
                      ),
                      Container(
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
                        width: MediaQuery.of(context).size.width / 1.3,
                      ),
                    ],
                  ),
                  _space,
                  InkWell(
                    onTap: () {
                      if (isAware == true && aceeptTerm == true) {
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
                          border: Border.all(
                              width: 2,
                              color: awareButtonClick == false
                                  ? (isAware && aceeptTerm)
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
                                  ? (isAware && aceeptTerm)
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
                  Text(
                    "Signature Upload",
                    style: GoogleFonts.quicksand(
                      textStyle: TextStyle(
                          color: Color(0xff22263D),
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                  ),
                  Text(
                    "Let’s Upload your Signature",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: TextStyle(
                          color: Color(0xff22263D),
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  ),
                  _space,
                  Center(
                    child: Container(
                      height: 360,
                      width: MediaQuery.of(context).size.width / 1.18,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border:
                              Border.all(width: 0.5, color: Color(0xff707070))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 45,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
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
                                  textStyle: TextStyle(
                                      color: Color(0xff22263D),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          InkWell(
                            onTap: () {
                              signatureExampleBottomSheet();
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: RichText(
                                text: const TextSpan(children: [
                                  TextSpan(
                                      text:
                                          "Ensure that you sign on a blank paper in a clearly ",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff22263D))),
                                  TextSpan(
                                      text: "see example ",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontSize: 12,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xffFF405A))),
                                ]),
                              ),
                            ),
                          ),
                          _space,
                          _space,
                          Center(
                            child: Container(
                              height: 150,
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
                                                source: ImageSource.camera);
                                        if (pickedFile != null) {
                                          setState(() {
                                            signatureImage = File(pickedFile.path);
                                            isBackImageClick = true;
                                          });
                                        }
                                      },
                                      child: Column(
                                        children: [
                                          Center(
                                            child: SvgPicture.asset(
                                              ConstantImage.upload,
                                              height: 50,
                                            ),
                                          ),
                                          Center(
                                            child: Text(
                                              "Upload your Signature",
                                              style: GoogleFonts.sourceSansPro(
                                                textStyle: TextStyle(
                                                    color: Color(0xff22263D),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                            ),
                          ),
                          _space,
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: RichText(
                              text: const TextSpan(children: [
                                TextSpan(
                                    text: "upload your Signature ",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff22263D))),
                                TextSpan(
                                    text: "JPG, JPEG ",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffFF405A))),
                                TextSpan(
                                    text: "or ",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff22263D))),
                                TextSpan(
                                    text: "PNG ",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffFF405A))),
                                TextSpan(
                                    text: "in less than ",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff22263D))),
                                TextSpan(
                                    text: "10 MB ",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffFF405A))),
                              ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 15),
                    child: InkWell(
                      onTap: () {
                        uploadSignatureBottomSheet();
                      },
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2, color: AppColors.textColor)),
                        child: Center(
                            child: Text(
                          "Continue",
                          style: ConstStyle.quickStandBtn,
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
                                    // After selecting the desired option,it will
                                    // change button value to selected value
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
                              autofocus: false,
                              style: ConstStyle.sourceSans5,
                              decoration: const InputDecoration(
                                hintText: "Full Name",
                                border: InputBorder.none,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.only(
                                    left: 14.0, bottom: 7.0, top: 6.0),
                              ),
                            ),
                          ),
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
                                      hint: const Text("Select Relationship"),
                                      items: relation_list.map((item) {
                                        return DropdownMenuItem(
                                            value: item
                                                .relationshipWithApplicationId
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
                                    width: 1.1, color: AppColors.borderColor),
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14.0),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton2(
                                      hint: const Text(
                                          "Select Nominee Identification"),
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
                                          nomineeProofID = newVal;
                                          print(nomineeProofID.toString());
                                        });
                                      },
                                      value: nomineeProofID,
                                    ),
                                  ))),
                          _space,
                          Text(
                            "PAN Number",
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
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  width: 1, color: AppColors.textColor),
                            ),
                            child: TextField(
                              autofocus: false,
                              style: ConstStyle.sourceSans5,
                              decoration: InputDecoration(
                                hintText: "10 Digit PAN Number",
                                border: InputBorder.none,
                                fillColor: Colors.white,
                                contentPadding: const EdgeInsets.only(
                                    left: 14.0, bottom: 7.0, top: 6.0),
                              ),
                            ),
                          ),
                          _space,
                          Text(
                            "Mobile Number",
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
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  width: 1, color: AppColors.textColor),
                            ),
                            child: TextField(
                              autofocus: false,
                              style: ConstStyle.sourceSans5,
                              decoration: InputDecoration(
                                hintText: "Nominee mobile number",
                                border: InputBorder.none,
                                fillColor: Colors.white,
                                contentPadding: const EdgeInsets.only(
                                    left: 14.0, bottom: 7.0, top: 6.0),
                              ),
                            ),
                          ),
                          _space,
                          Text(
                            "Date of Birth",
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
                                    style: ConstStyle.sourceSansdob,
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
                              height: 95,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    width: 1, color: AppColors.textColor),
                              ),
                              child: TextField(
                                autofocus: false,
                                style: ConstStyle.sourceSans5,
                                maxLines: 3,
                                decoration: const InputDecoration(
                                  hintText:
                                      "A 1XX4, XXXXX XXXXX XXX, XXXXX XXXXX XXXXX, XXXXX - XXXXX, XXXXX - XXXX64, XXXXXXXXXX, XXXXX.",
                                  border: InputBorder.none,
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.only(
                                      left: 14.0, bottom: 7.0, top: 6.0),
                                ),
                              )
                              /*Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                  "A 1XX4, XXXXX XXXXX XXX, XXXXX XXXXX XXXXX, XXXXX - XXXXX, XXXXX - XXXX64, XXXXXXXXXX, XXXXX.",
                                  style: ConstStyle.sourceSans5),
                            ),*/
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
                                    textStyle: TextStyle(
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
                                    autofocus: false,
                                    style: ConstStyle.sourceSans5,
                                    decoration: InputDecoration(
                                      hintText: "ADDRESS LINE 1",
                                      hintStyle: ConstStyle.sourceSans5,
                                      border: InputBorder.none,
                                      fillColor: Colors.white,
                                      contentPadding: const EdgeInsets.only(
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
                                    autofocus: false,
                                    style: ConstStyle.sourceSans5,
                                    decoration: InputDecoration(
                                      hintText: "ADDRESS LINE 2",
                                      hintStyle: ConstStyle.sourceSans5,
                                      border: InputBorder.none,
                                      fillColor: Colors.white,
                                      contentPadding: const EdgeInsets.only(
                                          left: 14.0, bottom: 7.0, top: 6.0),
                                    ),
                                  ),
                                ),
                                _space,
                                Text(
                                  "Pincode",
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
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        width: 1, color: AppColors.textColor),
                                  ),
                                  child: TextField(
                                    autofocus: false,
                                    style: ConstStyle.sourceSans5,
                                    decoration: InputDecoration(
                                      hintText: "226301",
                                      hintStyle: ConstStyle.sourceSans5,
                                      border: InputBorder.none,
                                      fillColor: Colors.white,
                                      contentPadding: const EdgeInsets.only(
                                          left: 14.0, bottom: 7.0, top: 6.0),
                                    ),
                                  ),
                                ),
                                _space,
                                Text(
                                  "Select State",
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
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          width: 1.1,
                                          color: AppColors.borderColor),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 14.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Uttar Pradesh",
                                            style: GoogleFonts.sourceSansPro(
                                              textStyle: TextStyle(
                                                  color: Color(0xff23263B),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18),
                                            ),
                                          ),
                                          Icon(
                                            CupertinoIcons.chevron_down,
                                            size: 20,
                                            color: Color(0xff22263D),
                                          )
                                        ],
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
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          width: 1.1,
                                          color: AppColors.borderColor),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 14.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Lucknow",
                                            style: GoogleFonts.sourceSansPro(
                                              textStyle: TextStyle(
                                                  color: Color(0xff23263B),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18),
                                            ),
                                          ),
                                          Icon(
                                            CupertinoIcons.chevron_down,
                                            size: 20,
                                            color: Color(0xff22263D),
                                          )
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: InkWell(
                        onTap: () {
                         // DematDetailRepository().addNominee();
                          setState(() {
                            isMandatory = false;
                            isUpload = false;
                            isSignInDemat = true;
                            isAddNominee = false;
                          });
                        },
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2, color: AppColors.textColor)),
                          child: Center(
                              child: Text(
                            "Continue",
                            style: ConstStyle.quickStandBtn,
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
                    _space,
                    InkWell(
                      onTap: () {},
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
                    _space,
                    _space1,
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
                      height: MediaQuery.of(context).size.height / 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
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
                    ),
                    _space,
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

  Widget existingDematAccountDetail() {
    return Padding(
      padding: const EdgeInsets.all(
        8.0,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color(0xffF7F7FA),
            border: Border.all(width: 1.2, color: Color(0xffbcbcbc))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
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
              _space,
              Text(
                "Hey $firstName1, Enter Your Demat Account Information",
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                      color: Color(0xff22263D),
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ),
              _space,
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
                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          value: nsdlItemsvalue,
                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),
                          // Array list of items
                          items: nsdlItems.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              nsdlItemsvalue = newValue!;
                            });
                          },
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
                ),
                child: TextField(
                  autofocus: false,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(16),
                  ],
                  style: GoogleFonts.sourceSansPro(
                    textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                  decoration: const InputDecoration(
                    hintText: "Enter DP id",
                    border: InputBorder.none,
                    fillColor: Colors.white,
                    labelStyle:
                        TextStyle(color: AppColors.textColor, letterSpacing: 4),
                    contentPadding:
                        EdgeInsets.only(left: 14.0, bottom: 7.0, top: 5.0),
                  ),
                ),
              ),
              _space,
              Text(
                "Beneficiary-ID*  ",
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
                  autofocus: false,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(16),
                  ],
                  style: GoogleFonts.sourceSansPro(
                    textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                  decoration: const InputDecoration(
                    hintText: "Enter benificiary ID",
                    hintStyle: TextStyle(letterSpacing: 4),
                    labelStyle:
                        TextStyle(color: AppColors.textColor, letterSpacing: 4),
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
                ),
                child: TextField(
                  autofocus: false,
                  style: GoogleFonts.sourceSansPro(
                    textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: "Enter DP-Name",
                    hintStyle: TextStyle(letterSpacing: 0),
                    labelStyle:
                        TextStyle(color: AppColors.textColor, letterSpacing: 4),
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
                  onTap: () {
                    onBankAddedBottomSheet();
                  },
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Color(0xff23263B))),
                    child: Center(
                        child: Text(
                      "Add Demat Account",
                      style: ConstStyle.quickStandBtn,
                    )),
                  ),
                ),
              ),
              const SizedBox(
                height: 86,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget addNewDematAccount() {
    return Padding(
      padding: const EdgeInsets.all(
        8.0,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color(0xffF7F7FA),
            border: Border.all(width: 1.2, color: Color(0xffbcbcbc))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
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
              _space,
              Text(
                "Hey $firstName1, Enter Your Demat Account Information",
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
                          profileprofilevisbileTab1 = false;
                          profilevisbileTab2 = false;
                          profilevisbileTab3 = false;
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
                          profileprofilevisbileTab1 = false;
                          profilevisbileTab2 = false;
                          profilevisbileTab3 = false;
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
                height: 350,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget cardDetail() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(
            8.0,
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xffF7F7FA),
                border: Border.all(width: 1.2, color: Color(0xffbcbcbc))),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bank Details",
                              style: GoogleFonts.quicksand(
                                textStyle: TextStyle(
                                    color: Color(0xff22263D),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20),
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Container(
                              height: 3,
                              width: 130,
                              color: Color(0xFF23263B),
                            )
                          ],
                        ),
                        Container(
                          height: 35,
                          width: 132,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.textColor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                size: 16,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Add New Account",
                                style: GoogleFonts.sourceSansPro(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    indent: 5,
                    endIndent: 5,
                  ),
                  _space,
                  Text(
                    "You can add more back account once your KYC is completed",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: TextStyle(
                          color: Color(0xff22263D),
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  ),
                  _space1,
                  _space1,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10),
                    child: Card(
                        elevation: 2,
                        child: Container(
                          width: 368,
                          height: 90,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white,
                                  Color(0xffec515f),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5.0,
                                      right: 2.0,
                                      top: 20.0,
                                      bottom: 5.0),
                                  child: Column(
                                    children: [
                                      Image.asset("assets/images/elefant.png",
                                          height: 45, width: 40),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          height: 16,
                                          width: 70,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(5),
                                                  topRight: Radius.circular(5)),
                                              color: Color(0xffffc440)),
                                          child: Center(
                                              child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                "PRIMARY",
                                                style: TextStyle(
                                                    fontSize: 8,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                  flex: 5,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5.0,
                                            right: 2.0,
                                            top: 23.0,
                                            bottom: 5.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              "HDFC BANK",
                                              style: ConstStyle.sourceSansbname,
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Container(
                                              height: 14,
                                              width: 70,
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(5),
                                                    bottomRight:
                                                        Radius.circular(5)),
                                                color: AppColors.textColor,
                                              ),
                                              child: Center(
                                                  child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: const [
                                                  Text(
                                                    "Saving A/C",
                                                    style: TextStyle(
                                                        fontSize: 8,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              )),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 5.0),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(bank_detail_list[1].accountNumber,
                                              style: ConstStyle.sourceSans),
                                        ),
                                      ),
                                    ],
                                  )),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20.0, top: 20.0),
                                          child: Image.asset(
                                              "assets/images/edit.png")),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 33.0, right: 18.0),
                                      child: Divider(
                                          thickness: 2,
                                          color: AppColors.textColor),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 33.0,
                                              right: 18.0,
                                              bottom: 18),
                                          child: Image.asset(
                                              "assets/images/delete.png")),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
                  ),
                  _space,
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 2.3,
        )
      ],
    );
  }

  Widget dematDetail() {
    return Padding(
      padding: const EdgeInsets.all(
        8.0,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color(0xfff7f7fa),
            border: Border.all(width: 1.2, color: Color(0xffbcbcbc))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Demat Details",
                          style: GoogleFonts.quicksand(
                            textStyle: TextStyle(
                                color: Color(0xff22263D),
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          ),
                        ),
                        SizedBox(
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
                        print("add new demat");
                        setState(() {
                          profileprofilevisbileTab1 = false;
                          profilevisbileTab2 = false;
                          profilevisbileTab3 = false;
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
                            Icon(
                              Icons.add,
                              size: 16,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Add New Account",
                              style: GoogleFonts.sourceSansPro(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
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
                  textStyle: TextStyle(
                      color: Color(0xff22263D),
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              ),
              _space1,
              _space1,
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
                child: Card(
                    elevation: 2,
                    child: Container(
                      width: 368,
                      height: 90,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.white,
                              Color(0xfff7c55b),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 5.0,
                                  right: 2.0,
                                  top: 20.0,
                                  bottom: 5.0),
                              child: Column(
                                children: [
                                  Image.asset("assets/images/arrow.png",
                                      height: 45, width: 40),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      height: 16,
                                      width: 70,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              topRight: Radius.circular(5)),
                                          color: Color(0xffffc440)),
                                      child: Center(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "PRIMARY",
                                            style: TextStyle(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white),
                                          ),
                                        ],
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 9,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5.0,
                                        right: 0.0,
                                        top: 15.0,
                                        bottom: 5.0),
                                    child: Row(
                                      children: [
                                        Text(
                                         "Trust KYC",
                                          style: ConstStyle.sourceSanscardname1,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Container(
                                          height: 14,
                                          width: 38,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(5),
                                                bottomRight:
                                                    Radius.circular(5)),
                                            color: AppColors.textColor,
                                          ),
                                          child: Center(
                                              child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: const [
                                              Text(
                                                "NSDL",
                                                style: TextStyle(
                                                    fontSize: 8,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text("JaiRaj Bhavani",
                                          style: ConstStyle.sourceSanscardname),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text("3265 3287 346634",
                                          style: ConstStyle.sourceSans),
                                    ),
                                  ),
                                ],
                              )),
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 6.0, top: 20.0),
                                      child: Image.asset(
                                          "assets/images/edit.png")),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.only(left: 18.0, right: 16.0),
                                  child: Divider(
                                      thickness: 2, color: AppColors.textColor),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, right: 18.0, bottom: 18),
                                      child: Image.asset(
                                          "assets/images/delete.png")),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
              ),
              SizedBox(
                height: 430,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget inPersonVerification() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(
        bottom: 20.0,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          color: Color(0xffE8EAED),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 8,
              ),
              Center(
                child: Text(
                  "Important Instructions.",
                  style: GoogleFonts.quicksand(
                    textStyle: TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.w500,
                        fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                Strings.authinstruc,
                textAlign: TextAlign.center,
                style: GoogleFonts.sourceSansPro(
                  textStyle: TextStyle(
                      color: Color(0xff22263D),
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
              ),
              _space,
              RichText(
                text: TextSpan(children: [
                  const TextSpan(
                      text: Strings.authinstructions,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff22263D))),
                  TextSpan(
                    text: "see example",
                    style: const TextStyle(
                        fontSize: 15,
                        decoration: TextDecoration.underline,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffFF405A)),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        setState(() {
                          personVerificationBottomSheet();
                        });
                      },
                  ),
                ]),
              ),
              _space,
              _space,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: 50,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x29000000),
                            blurRadius: 8.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child: Center(
                        child: Text(
                      "0",
                      style: GoogleFonts.quicksand(
                        textStyle: TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 25),
                      ),
                    )),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 60,
                    width: 50,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x29000000),
                            blurRadius: 8.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child: Center(
                        child: Text(
                      "8",
                      style: GoogleFonts.quicksand(
                        textStyle: TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 25),
                      ),
                    )),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 60,
                    width: 50,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x29000000),
                            blurRadius: 8.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child: Center(
                        child: Text(
                      "8",
                      style: GoogleFonts.quicksand(
                        textStyle: TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 25),
                      ),
                    )),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 60,
                    width: 50,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x29000000),
                            blurRadius: 8.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child: Center(
                        child: Text(
                      "8",
                      style: GoogleFonts.quicksand(
                        textStyle: TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 25),
                      ),
                    )),
                  ),
                ],
              ),
              _space,
              _space1,
              Text(
                Strings.tipsauth,
                textAlign: TextAlign.center,
                style: GoogleFonts.sourceSansPro(
                  textStyle: TextStyle(
                      color: Color(0xff22263D),
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              ),
              _space,
              _space,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 125,
                    width: 125,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x29000000),
                          blurRadius: 8.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SvgPicture.asset(
                          ConstantImage.bulb,
                          width: 63,
                          height: 50,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          Strings.good_light,
                          style: GoogleFonts.sourceSansPro(
                            textStyle: TextStyle(
                                color: Color(0xff22263D),
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Container(
                    height: 125,
                    width: 125,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x29000000),
                            blurRadius: 8.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SvgPicture.asset(
                          ConstantImage.webcam,
                          width: 63,
                          height: 50,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          Strings.look,
                          style: GoogleFonts.sourceSansPro(
                            textStyle: TextStyle(
                                color: Color(0xff22263D),
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 125,
                    width: 125,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x29000000),
                            blurRadius: 8.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SvgPicture.asset(
                          ConstantImage.sunglasses,
                          width: 63,
                          height: 50,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          Strings.Sungalses,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.sourceSansPro(
                            textStyle: TextStyle(
                                color: Color(0xffff405A),
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Container(
                    height: 125,
                    width: 125,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x29000000),
                            blurRadius: 8.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SvgPicture.asset(
                          ConstantImage.cap,
                          width: 63,
                          height: 50,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          Strings.Caps,
                          style: GoogleFonts.sourceSansPro(
                            textStyle: TextStyle(
                                color: Color(0xffff405A),
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              _space,
              _space,
              _space,
              InkWell(
                onTap: () {
                  setState(() {
                    tabVisible=true;
                    barLine=true;
                    profilevisbileTab3 = true;
                    inPersonVerifications = false;
                    profileprofilevisbileTab1 = false;
                    profilevisbileTab2 = false;
                    bankDetails = false;
                    dematDetails = false;
                    addNewDematAccounts = false;
                    existingDematAccountDetails = false;
                    isNewDemat = false;
                    isMandatory = false;
                    isUpload = false;
                    isSignInDemat = false;
                    isNomineeAdd = false;
                    isAddressAdd = false;
                    isAddNominee = false;
                    cardDetails = false;
                  });
                },
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: AppColors.textColor),
                      color: Colors.white),
                  child: Center(
                      child: Text(
                    "Continue",
                    style: ConstStyle.quickStandBtn,
                  )),
                ),
              ),
              _space,
              _space1,
            ],
          ),
        ),
      ),
    );
  }

  Widget get _space => const SizedBox(height: 20);

  Widget get _space1 => const SizedBox(height: 3);

  void onCommentBottomSheet() {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (context) {
          return BottomSheet(
              onClosing: () {},
              builder: (BuildContext context) {
                return StatefulBuilder(
                    builder: (BuildContext context, setState) {
                  return SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.75,
                      decoration: const BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0),
                        ),
                      ),
                      child: Column(
                        children: [],
                      ),
                    ),
                  );
                });
              });
        });
  }

  void verifyPanNoBottomSheet() {
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
                  child: Container(
                    height: 350,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    color: AppColors.primaryColor,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25, bottom: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                ConstantImage.profile,
                                width: 100,
                                height: 100,
                                scale: 3,
                              ),
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "Hi [$firstName1 $lastName1]",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                          color: Colors.white)),
                                ]),
                              ),
                              _space,
                              _space1,
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isAadhaarVerified = true;
                                    isEditStep1 = false;
                                    isEditStep2 = false;
                                    Navigator.pop(context);
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 58,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                        width: 1, color: Colors.white),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 2.0, left: 2, right: 2, top: 5),
                                    child: Text(
                                      "I confirm to open the account in the same name of [$firstName1 $lastName1]",
                                      textAlign: TextAlign.center,
                                      style: ConstStyle.sourceSansbottom,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        _space,
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10.0, bottom: 0),
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.white)),
                              child: Center(
                                  child: Text(
                                "Wrong name? -Re-enter PAN number",
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
                );
              });
            },
            onClosing: () {},
          );
        });
  }

  void onBankAddedBottomSheet() {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
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
                      isAddBankDetails = true;
                      isAdddemat = true;
                      isAddBankDetails = true;
                      tabVisible = true;
                      profileprofilevisbileTab1 = true;
                      existingDematAccountDetails = false;
                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Continue()));
                    });
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.28,
                    decoration: BoxDecoration(
                      color: AppColors.textColor,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(35.0),
                        topRight: const Radius.circular(35.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Image.asset(
                          ConstantImage.profile,
                          width: 75,
                          height: 75,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: Text(
                            "Congratulations! $firstName1 \n Demat Account Added Successfully",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.quicksand(
                              textStyle: TextStyle(
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

  void closeApplicationBottomSheet() {
    showModalBottomSheet(
        context: context,
        isDismissible: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(35),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (context) {
          return BottomSheet(
            builder: (BuildContext context) {
              var height = MediaQuery.of(context).size.height;
              return StatefulBuilder(builder: (BuildContext context, State) {
                return Container(
                  height: height * 0.43,
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
                      SizedBox(
                        height: height * 0.04,
                      ),
                      Image.asset(
                        ConstantImage.profile,
                        width: 75,
                        height: 75,
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Center(
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
                      ),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20, bottom: 30),
                        child: InkWell(
                          onTap: () {
                            exit(0);
                          },
                          child: Container(
                            height: 45,
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
                      ),
                    ],
                  ),
                );
              });
            },
            onClosing: () {
              exit(0);
            },
          );
        });
  }

  void onBank1AddedBottomSheet() {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
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
                      isAddBankDetails = true;
                      bankDetails = false;
                      profilevisbileTab3 = false;
                      inPersonVerifications = false;
                      profileprofilevisbileTab1 = false;
                      profilevisbileTab2 = false;
                      dematDetails = false;
                      addNewDematAccounts = true;
                      existingDematAccountDetails = false;
                      isNewDemat = false;
                      isMandatory = false;
                      isUpload = false;
                      isSignInDemat = false;
                      isNomineeAdd = false;
                      isAddressAdd = false;
                      isAddNominee = false;

                      Navigator.pop(context);
                    });
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.28,
                    decoration: BoxDecoration(
                      color: AppColors.textColor,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(35.0),
                        topRight: const Radius.circular(35.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Image.asset(
                          ConstantImage.profile,
                          width: 75,
                          height: 75,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: Text(
                            "Congratulations! $firstName1 \n Bank Account Added Successfully",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.quicksand(
                              textStyle: TextStyle(
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

  void onNameNotMatchedBottomSheet() {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
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
                    });
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 1.7,
                    decoration: const BoxDecoration(
                      color: AppColors.textColor,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(35.0),
                        topRight: const Radius.circular(35.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Image.asset(
                          "assets/images/docnotmatch.png",
                          width: 75,
                          height: 75,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 15.0),
                          child: Center(
                            child: Text(
                              "Your Bank A/C number does not \n match with PAN name.",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                        _space,
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 15.0),
                          child: Center(
                            child: Text(
                              "please upload the cancelled signed  cheque of your bank A/C.",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                        _space,
                        _space,
                        _space,
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 15.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              uploadCancelledChequeBottomSheet();
                            },
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.5, color: Colors.white)),
                              child: Center(
                                  child: Text(
                                "Proceed to upload Signed Cheque",
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
                );
              });
            },
            onClosing: () {},
          );
        });
  }

  void onProfilePicVerificationBottomSheet() {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
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
                      isAddPersonalDetails = true;
                      bankDetails = true;
                      profilevisbileTab3 = false;
                      inPersonVerifications = false;
                      profileprofilevisbileTab1 = false;
                      profilevisbileTab2 = false;
                      dematDetails = false;
                      addNewDematAccounts = false;
                      existingDematAccountDetails = false;
                      isNewDemat = false;
                      isMandatory = false;
                      isUpload = false;
                      isSignInDemat = false;
                      isNomineeAdd = false;
                      isAddressAdd = false;
                      isAddNominee = false;
                      Navigator.pop(context);
                    });
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(35.0),
                        topRight: const Radius.circular(35.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          ConstantImage.profile,
                          width: 100,
                          height: 100,
                          scale: 3,
                        ),
                        Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 28.0),
                            child: Text(
                              "Congratulations! $firstName1 Identity Verification completed Successfully",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.sourceSansPro(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15),
                              ),
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

  void onEmailVerifiedBottomSheet() {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
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
                      isEmailVerified = true;
                      isGoogleSign = false;
                      Navigator.pop(context);
                    });
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(35.0),
                        topRight: const Radius.circular(35.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          ConstantImage.profile,
                          width: 100,
                          height: 100,
                          scale: 3,
                        ),
                        Center(
                          child: Text(
                            "Congratulations! $firstName1 \n Email ID verified Successfully",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.sourceSansPro(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15),
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

  void uploadSignatureBottomSheet() {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
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
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.28,
                    decoration: BoxDecoration(
                      color: AppColors.textColor,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(35.0),
                        topRight: const Radius.circular(35.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Image.asset(
                          ConstantImage.profile,
                          width: 75,
                          height: 75,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: Text(
                            "Congratulations! $firstName1 \n Signature Uploaded Successfully",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.quicksand(
                              textStyle: TextStyle(
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
        shape: RoundedRectangleBorder(
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
                      child: Image.asset(
                        "assets/images/passport.JPG",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.14,
                      height: 180,
                      child: Image.asset(
                        "assets/images/passport.JPG",
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

          /*BottomSheet(
            builder: (BuildContext context) {
              return StatefulBuilder(builder: (BuildContext context, State) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.pop(context);
                      isUpload = true;
                      isMandatory = false;
                      isAddNominee = false;
                    });
                  },
                  child:
                );
              });
            },
            onClosing: () {},
          );*/
        });
  }

  void personVerificationBottomSheet() {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
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
                      isUpload = true;
                      isMandatory = false;
                      isAddNominee = false;
                    });
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.80,
                    decoration: BoxDecoration(
                      color: AppColors.textColor,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(35.0),
                        topRight: const Radius.circular(35.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Code Position Examples",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.quicksand(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        SvgPicture.asset(
                          ConstantImage.example,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0, right: 25),
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.5, color: Colors.white)),
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
                );
              });
            },
            onClosing: () {},
          );
        });
  }

  void uploadCancelledChequeBottomSheet() {
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
                      isUpload = true;
                      isMandatory = false;
                      isAddNominee = false;
                    });
                  },
                  child: Container(
                    height: 600,
                    decoration: const BoxDecoration(
                      color: AppColors.textColor,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(35.0),
                        topRight: const Radius.circular(35.0),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            "Upload cancelled cheque",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Container(
                              height: 270,
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
                                        "Upload Preview",
                                        style: GoogleFonts.sourceSansPro(
                                          textStyle: TextStyle(
                                              color: Color(0xff22263D),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  _space,
                                  _space,
                                  _space,
                                  Center(
                                    child: SvgPicture.asset(
                                      ConstantImage.upload,
                                      height: 50,
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      "Upload Cancelled Cheque ",
                                      style: GoogleFonts.sourceSansPro(
                                        textStyle: TextStyle(
                                            color: Color(0xff22263D),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),
                                  _space,
                                  _space,
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
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
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 8.0, left: 30, right: 30),
                            child: Text(
                              "Note : if you do not have your Cheque book with you for the cancelled cheque , you can upload a copy of your Bank Statement or Bank Passbook ",
                              style: GoogleFonts.sourceSansPro(
                                textStyle: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    color: Color(0xffFFC440),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 25.0, right: 25),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  Navigator.pop(context);
                                  inCheckCancelled = true;
                                });
                              },
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.5, color: Colors.white)),
                                child: Center(
                                    child: Text(
                                  "Submit",
                                  style: GoogleFonts.quicksand(
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500)),
                                )),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
            },
            onClosing: () {},
          );
        });
  }

  void uploadPassportBottomSheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(35),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter State) {
            return Container(
              height: MediaQuery.of(context).size.height / 1.3,
              decoration: const BoxDecoration(
                color: AppColors.textColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35.0),
                  topRight: Radius.circular(35.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Text(
                        "Upload Passport Scans",
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
                      height: 20,
                    ),
                    Center(
                      child: Container(
                        height: 270,
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
                                  "Passport Frontside Preview",
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
                                                      source:
                                                          ImageSource.camera);
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
                                                    "Upload Your Passport Frontside ",
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
                                        State(() {
                                          frontImage = File(pickedFile.path);
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
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
                        height: 270,
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
                                  "Passport Backside Preview",
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
                                                      source:
                                                          ImageSource.camera);
                                              if (pickedFile != null) {
                                                State(() {
                                                  backImage =
                                                      File(pickedFile.path);
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
                                                    "Upload Your Passport Backside ",
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
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
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 8.0, left: 25, right: 25),
                      child: Container(
                        height: 55,
                        color: Color(0xffE1E0E7),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "TIP: Scan or take a photo of your passport on the white-coloured background to avoid rejection ",
                            style: ConstStyle.sourceSansPro,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25, right: 25, bottom: 20, top: 20),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            Navigator.pop(context);
                            isScans = false;
                            isPassportImage = true;
                          });
                        },
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1.5, color: Colors.white)),
                          child: Center(
                              child: Text(
                            "Submit",
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
            );
          });
        });
  }

  void onEmailAddedBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(35),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
            top: 0,
            right: 0,
            left: 0,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Wrap(
          children: [
            Container(
              // height: MediaQuery.of(context).size.height / 3,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: AppColors.primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 45,
                      ),
                      const Text("Please provide your email id",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: Colors.white)),
                      _space,
                      _space1,
                      Container(
                        alignment: Alignment.center,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(width: 1, color: Colors.white),
                        ),
                        child: TextField(
                          controller: email_id,
                          keyboardType: TextInputType.emailAddress,
                          autofocus: false,
                          style: ConstStyle.sourceSans,
                          decoration: const InputDecoration(
                            labelStyle: TextStyle(
                                color: AppColors.textColor, letterSpacing: 4),
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                                color: Color(0xff22263d), letterSpacing: 4),
                            hintText: "Enter Email id",
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding:
                                EdgeInsets.only(left: 14.0, top: 0.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  _space,
                  _space1,
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: InkWell(
                      onTap: () async {
                        if (email_id.text.isNotEmpty) {
                          sendOtp_toEmail(
                              mobNo!, email_id.text.toString(), false);
                          Navigator.pop(context);
                        } else {
                          Fluttertoast.showToast(msg: "Enter Email First!!");
                        }
                      },
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.white),
                        ),
                        child: Center(
                            child: Text(
                          "Submit",
                          style: GoogleFonts.quicksand(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500)),
                        )),
                      ),
                    ),
                  ),
                  _space,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onOtpAddedBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(35),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
            top: 0,
            right: 0,
            left: 0,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: GestureDetector(
          child: Container(
            height: MediaQuery.of(context).size.width * 0.72,
            padding: EdgeInsets.symmetric(horizontal: 15),
            color: AppColors.primaryColor,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          const TextSpan(
                              text:
                                  "Enter the 4 to 6 digits, One Time Password sent on your Email ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: Colors.white)),
                          TextSpan(
                              text: "${email_id.text}  ",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: AppColors.btnColor)),
                          const WidgetSpan(
                            child: Image(
                              image: AssetImage(
                                ConstantImage.edit,
                              ),
                              color: AppColors.btnColor,
                              height: 20,
                              width: 20,
                            ),
                          ),
                        ]),
                      ),
                      _space,
                      _space1,
                      Container(
                        alignment: Alignment.center,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(width: 1, color: Colors.white),
                        ),
                        child: TextField(
                          controller: otpdata,
                          keyboardType: TextInputType.number,
                          autofocus: false,
                          style: ConstStyle.sourceSans,
                          decoration: const InputDecoration(
                            labelStyle: TextStyle(
                                color: AppColors.textColor, letterSpacing: 4),
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                                color: Color(0xff22263d), letterSpacing: 4),
                            hintText: "******",
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding:
                                EdgeInsets.only(left: 14.0, top: 0.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Strings.not_get,
                      style: ConstStyle.sourceSans2,
                    ),
                    InkWell(
                      onTap: () async {
                        // Navigator.pop(context);
                        _resendOTPEmail(mobNo!, email_id.text.toString(),
                            isemailResendOTPt);
                      },
                      child: Container(
                        height: 23,
                        width: 87,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: Colors.white),
                        child: Center(
                            child: Text(
                          "Resend OTP",
                          style: ConstStyle.quickStandSmall1,
                        )),
                      ),
                    ),
                  ],
                ),
                _space,
                _space,
                Padding(
                  padding: const EdgeInsets.only(bottom: 0.0),
                  child: InkWell(
                    onTap: () async {
                      Navigator.pop(context);
                      _verifyOTPEmail(
                          email_id.text.toString(), otpdata.text.toString());
                      mail = await HelperFunctions.getEmailId();
                    },
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.white)),
                      child: Center(
                          child: Text(
                        "Verify",
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
        ),
      ),
    );
  }

  Widget orderTimeLine() {
    return Container(
      alignment: Alignment.center,
      height: 80,
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 400,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Step 01", style: ConstStyle.quickStandMediumtime),
                    Text("Personal Details",
                        style: ConstStyle.quickStandMediumsubtile),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Step 02", style: ConstStyle.quickStandMediumtime),
                    Text("Bank Details",
                        style: ConstStyle.quickStandMediumsubtile),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Step 03", style: ConstStyle.quickStandMediumtime),
                    Text("Demat Details",
                        style: ConstStyle.quickStandMediumsubtile),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: 281,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 12,
                      height: 12,
                      decoration: const BoxDecoration(
                        color: Color(0xffff405a),
                        shape: BoxShape.circle,
                      ),
                      child: Text(""),
                    ),
                    Container(
                      width: 121,
                      height: 04,
                      decoration: BoxDecoration(
                        color: isAddPersonalDetails
                            ? Color(0xffFF405A)
                            : Color(0xffc8c7ce),
                        shape: BoxShape.rectangle,
                      ),
                      child: Text(""),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: isAddPersonalDetails
                            ? Color(0xffFF405A)
                            : Color(0xffc8c7ce),
                        shape: BoxShape.circle,
                      ),
                      child: Text(""),
                    ),
                    Container(
                      width: 121,
                      height: 04,
                      decoration: BoxDecoration(
                        color: isAddBankDetails
                            ? Color(0xffFF405A)
                            : Color(0xffc8c7ce),
                        shape: BoxShape.rectangle,
                      ),
                      child: Text(""),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: isAddBankDetails
                            ? Color(0xffFF405A)
                            : Color(0xffc8c7ce),
                        shape: BoxShape.circle,
                      ),
                      child: Text(""),
                    ),
                    Container(
                      width: 3,
                      height: 20,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.rectangle,
                      ),
                      child: Text(""),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
