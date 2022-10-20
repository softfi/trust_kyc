import 'dart:convert';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';
import 'package:trust_money/model/code_verification_response_data.dart';
import 'package:trust_money/model/get_pan_response_data.dart';
import 'package:trust_money/screens/animated_screens/continue_animation.dart';
import 'package:trust_money/screens/animated_screens/invalid_pan_animation.dart';
import 'package:trust_money/screens/animated_screens/verify_email_id_animation.dart';
import 'package:trust_money/screens/animated_screens/verify_pan_animation.dart';
import 'package:trust_money/screens/bank_screen/bank_details.dart';

import 'package:trust_money/screens/home/vedio_page.dart';
import 'package:video_player/video_player.dart';
import '../../api/url_constant.dart';
import '../../model/address_proof_response_data.dart';
import '../../model/city_responsse_data.dart';
import '../../model/get_digilocker_response_data.dart';
import '../../model/get_personal_detail_response.dart';
import '../../model/profession_response_data.dart';
import '../../model/sendOtpEmailModel.dart';
import '../../model/state_response_data.dart';
import '../../repositories/login_repository.dart';
import '../../repositories/profile_repository.dart';
import '../../utils/colorsConstant.dart';
import '../../utils/images.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';
import '../animated_screens/complete_profile_animation.dart';
import '../../utils/sharedPreference.dart';
import 'digilocker_page.dart';

class PersonalDetails extends StatefulWidget {
  final void Function()? onTap;

  PersonalDetails({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  bool profileprofilevisbileTab1 = true;
  bool profilevisbileTab2 = false;
  bool profilevisbileTab3 = false;
  bool isAdditional = false;
  bool isEditStep1 = true;
  bool isEditStep2 = false;
  bool isEditStep12 = false;
  bool isUpload = false;
  bool isverifyKRA = false;
  bool isMandatory = true;
  bool isAddressUpdated = false;
  bool isAddPersonalDetails = false;
  bool isAddBankDetails = false;
  bool isAadhaarVerified = false;
  bool isSignInDemat = false;
  bool isAddressAdd = false;
  bool inPersonVerifications = false;
  bool potentially_exposed_status = false;
  int potentially_exposed_statusInt = 0;
  bool activate_future = false;
  int activate_futureInt = 0;
  bool isChecked = false;
  bool isChecked1 = false;
  bool isMaiden = false;
  bool isPersonalDataFetch = false;
  late Map resopnsmap;
  bool inCheckCancelled = false;
  bool isPanSelected = false;
  bool isCapture = false;
  int isCheckedInt = 0;
  int isChecked1Int = 0;
  bool isButtonClick = false;
  bool isButtonClickMaiden = false;
  bool isEmailVerified = false;
  bool isPanVerify = false;
  bool isGoogleSign = true;
  bool isGoogleEmailVerify = false;
  bool isScans = true;
  bool isPassportImage = false;
  bool isFrontImageClick = false;
  bool isBackImageClick = false;
  bool isBankShowing = false;
  DateTime currentStartDate = DateTime.now();
  String dob = "";
  File? backImage, frontImage;
  final _picker = ImagePicker();
  bool itrValue = false;
  int itrValueInt = 0;
  int numberOfAccount = 1;
  int genderIndex = 0;
  int maritalIndex = 0;
  int incomeIndex = 0;
  int experienceIndex = 0;
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
  String? professionID;
  String? stateid;
  String? cityid;
  String? addressProof;
  String? fileName1;
  String? fileName2;
  String? randumNumber;
  String panName = "";
  String dateOfBirth = "";
  GetPersonalDetailModel? getPersonalDetail;
  DigiLockerDetailModel? digiLockerDetailModel;
  CodeVerificationModel? codeVerificationModel;
  PanStatusModel? panStatusModel;
  SendOtpEmailModule? sendotptoemail;
  List<GetStateModel> state_data = [];
  List<GetCityModel> city_data = [];
  List<AddressProofModel> address_data = [];
  List<ProfessionModel> profession_data = [];
  String? userfName, userlName, mobNo, mail;
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _isRecordingPlay = false;
  bool _isRecording = false;
  bool _isRecordingStop = false;
  late CameraController _cameraController;
  late VideoPlayerController _videoPlayerController;
  var file;

  getPreferences() async {
    userfName = await HelperFunctions.getFirstName();
    userlName = await HelperFunctions.getLastName();
    mobNo = await HelperFunctions.getPhoneNumber();
    dateOfBirth = await HelperFunctions.getDOB();
    mail = await HelperFunctions.getEmailId();
    print("============Email $mail");
    firstName.text = userfName.toString();
    lastName.text = userlName.toString();
    setState(() {});
  }

  getPersonalDetails() async {
    var res1 = await ProfileRepository().getProfileDetails();
    print("============987 $res1");
    if (res1 != "") {
      getPersonalDetail = res1;
      if (getPersonalDetail!.isEmailVerified == 1) {
        isGoogleSign = false;
        isEmailVerified = true;
        getPANCard(getPersonalDetail!.panNumber);
        setState(() {
          //var date1  = getPersonalDetail!.dob !=""?getPersonalDetail!.dob.toString():"";
          // dob = DateFormat('dd-MM-yyyy').format(DateTime.parse(getPersonalDetail!.dob.toString()));
          print(dob);
        });
      }
    }
  }

  getPANCard(String pNumber) async {
    panStatusModel = await ProfileRepository().getPanCard(pNumber);
    if (panStatusModel != "") {
      print(
          "============PANIPV ${panStatusModel
              ?.personVideoVerificationStatus}");
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
      });
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
    await googleUser?.authentication;
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

  getVerificationCode() async {
    var code = await ProfileRepository().getVerificationCode();
    print("============987 $code");
    setState(() {
      if (code != "") {
        codeVerificationModel = code;
        randumNumber = codeVerificationModel!.randomNumber.toString();
        print("========ran $randumNumber");
        print("========ran ${randumNumber![0]}");
        print("========ran ${randumNumber![1]}");
        print("========ran ${randumNumber![2]}");
        print("========ran ${randumNumber![3]}");
      }
    });
  }

  geteDigiLocker() async {
    var res1 = await ProfileRepository().getdigiLocker();
    print("============927 ${res1!.aadharNumber}");
    if (res1 != null) {
      digiLockerDetailModel = res1;
      if (digiLockerDetailModel != null) {
        isEditStep12 = true;
        isAadhaarVerified = false;
        setState(() {});
        print("sdlfsdyfgui");
      }
      isverifyKRA = true;
      setState(() {});
    }
  }

  sendOtp_toEmail(String mobnumber, String emailid, bool boolvalue) async {
    var res1 =
    await LoginRepository().sentOtpToEmail(mobnumber, emailid, boolvalue);
    if (res1 != "") {
      sendotptoemail = res1;
      Navigator.pop(context);
      onOtpAddedBottomSheet();
      await HelperFunctions.saveEmail(email_id.text.toString());
    }
    return sendotptoemail;
  }

  void _verifyOTPEmail(String emailid, String otp) async {
    try {
      String token = await HelperFunctions.getToken();
      Response response = await post(
        Uri.parse(VerifyOTPEmail),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'authorization': token
        },
        body: jsonEncode(<String, dynamic>{"email_id": emailid, "otp": otp}),
      );

      JsonDecoder _decoder = JsonDecoder();
      dynamic collectUseData = _decoder.convert(response.body);
      resopnsmap = json.decode(response.body);
      if (response.statusCode == 200) {
        print(response.statusCode.toString());
        Fluttertoast.showToast(msg: collectUseData['errors'].toString());
        Fluttertoast.showToast(msg: collectUseData['message'].toString());
        setState(() {
          Navigator.pop(context);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const EmailAnimation()));
          getPersonalDetails();
        });
        await HelperFunctions.savehashkey(
            collectUseData['hash_key'].toString());
      } else if (response.statusCode > 201) {
        if (collectUseData['errors'].toString() ==
            "mobile number already register please login") {
          Fluttertoast.showToast(
              msg: 'mobile number already register please login');
        }
        Fluttertoast.showToast(msg: collectUseData['errors'].toString());
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void _resendOTPEmail(String mobnumber, String emailid,
      isemailResendOTPt) async {
    String token = await HelperFunctions.getToken();
    try {
      Response response = await post(
        Uri.parse(SendOTPEmail),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'authorization': token
        },
        body: jsonEncode(<String, dynamic>{
          "mobile_number": mobnumber,
          "email_id": emailid,
          "resend_otp": isemailResendOTPt
        }),
      );
      JsonDecoder _decoder = JsonDecoder();
      dynamic collectUseData = _decoder.convert(response.body);
      resopnsmap = json.decode(response.body);
      if (response.statusCode == 200) {
        print(response.statusCode.toString());
        Fluttertoast.showToast(msg: collectUseData['errors'].toString());
        Fluttertoast.showToast(msg: collectUseData['message'].toString());
        await HelperFunctions.savehashkey(
            collectUseData['hash_key'].toString());
      } else if (response.statusCode > 201) {
        if (collectUseData['errors'].toString() ==
            "mobile number already register please login") {
          Fluttertoast.showToast(
              msg: 'mobile number already register please login');
        }
        Fluttertoast.showToast(msg: collectUseData['errors'].toString());
      }
    } catch (e) {
      print(e.toString());
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

  getOccupation() async {
    var data = await ProfileRepository().occupation();
    setState(() {
      profession_data = data;
      print("=======>100 $data");
    });
  }

  addressProofList() async {
    var data1 = await ProfileRepository().addressProof();
    setState(() {
      address_data = data1;
      print("======>13 $data1");
    });
  }

  _initCamera() async {
    final cameras = await availableCameras();
    final front = cameras.firstWhere(
            (camera) => camera.lensDirection == CameraLensDirection.front);
    _cameraController = CameraController(front, ResolutionPreset.low);
    await _cameraController.initialize();
    setState(() => _isLoading = false);
  }

  _recordVideo() async {
    await _cameraController.prepareForVideoRecording();
    await _cameraController.startVideoRecording();
    setState(() => _isRecording = true);
  }

  Future _initVideoPlayer() async {
    _videoPlayerController = VideoPlayerController.file(File(file.path));
    await _videoPlayerController.initialize();
    // await _videoPlayerController.play();
  }

  @override
  void initState() {
    getPersonalDetails();
    getPreferences();
    getStateList();
    addressProofList();
    getOccupation();
    geteDigiLocker();
    getVerificationCode();
    super.initState();
    _initCamera();
    Future.delayed(Duration(seconds: 4), () {
      setState(() {
        isPersonalDataFetch = true;
      });
    });
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isPersonalDataFetch
        ? Column(
      children: [
        Visibility(
            visible: profileprofilevisbileTab1,
            child: updatedPersonalDetails()),
        Visibility(
            visible: profilevisbileTab2,
            child: editPersonalDetails(context)),
        Visibility(
            visible: inPersonVerifications,
            child: inPersonVerification()),
        Visibility(visible: profilevisbileTab3, child: editPersonalPic()),
        Visibility(
            visible: isBankShowing,
            child: BankDetails(
              cardView: false,
              addBankView: true,
            )),
      ],
    )
        : Center(
        heightFactor: 18,
        child: CircularProgressIndicator(color: Color(0xff00C6D8)));
  }

  Widget personalDetails() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
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
                        isAdditional = false;
                        isEditStep1 = true;
                        isEditStep2 = false;
                        isEditStep12 = false;
                        isAadhaarVerified = false;
                        inPersonVerifications = false;
                        isSignInDemat = false;
                        isAddressAdd = false;
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
                  Text('$userfName $userlName',
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                            color: Color(0xff22263D),
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            letterSpacing: 2),
                      )),
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
                      Text("+91 $mobNo",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                                color: Color(0xff22263D),
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                letterSpacing: 2),
                          )),
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
                        width: 5,
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
                  const SizedBox(
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
                  const SizedBox(
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
                  const SizedBox(
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
                  const SizedBox(
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0),
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0),
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0),
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0),
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0),
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
                  const SizedBox(
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0),
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0),
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0),
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0),
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0),
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0),
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0),
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
                  const SizedBox(
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
                            value: true,
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
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 1.5,
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
                            value: true,
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
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
                        isAdditional = false;
                        isEditStep1 = true;
                        isEditStep2 = false;
                        isEditStep12 = false;
                        isAadhaarVerified = false;
                        inPersonVerifications = false;
                        isSignInDemat = false;
                        isAddressAdd = false;
                        isPanVerify = false;
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
                  Text('$userfName $userlName',
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                            color: Color(0xff22263D),
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            letterSpacing: 2),
                      )),
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
                      Text("+91 $mobNo",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: const TextStyle(
                                color: Color(0xff22263D),
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                letterSpacing: 2),
                          )),
                      const SizedBox(
                        width: 30,
                      ),
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xff00E152)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                        ),
                      )
                    ],
                  ),
                  _space,
                  Text("Email ID : ", style: ConstStyle.sourceSansProDisable),
                  _space1,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 2.4,
                        child: Text(
                            getPersonalDetail!.isEmailVerified == 1
                                ? getPersonalDetail!.emailId.toString()
                                : "ABC@gmail.com",
                            //overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.sourceSansPro(
                              textStyle: TextStyle(
                                  color: getPersonalDetail!.isEmailVerified == 1
                                      ? Color(0xff22263D)
                                      : Color(0xffC8C7CE),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  letterSpacing: 2),
                            )),
                      ),
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: getPersonalDetail!.isEmailVerified == 1
                                ? Color(0xff00E152)
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
                                (getPersonalDetail!.isEmailVerified ?? 0) == 1
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
                      ),
                      Visibility(
                        visible: (getPersonalDetail!.isEmailVerified ?? 0) == 1
                            ? true
                            : false,
                        child: InkWell(
                          onTap: () {
                            onEmailAddedBottomSheet();
                          },
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xff00C6D8)),
                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 12.0),
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
                  Text("Date of Birth - Should be as per Aadhaar ",
                      style: ConstStyle.sourceSansProDisable),
                  _space1,
                  Text(
                      digiLockerDetailModel != null
                          ? digiLockerDetailModel!.dateOfBirth.toString()
                          : 'DD/MM/YYYY   FORMAT',
                      style: GoogleFonts.sourceSansPro(
                        textStyle: TextStyle(
                            color: digiLockerDetailModel != null
                                ? Color(0xff22263D)
                                : Color(0xffC8C7CE),
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            letterSpacing: 2),
                      )),
                  _space,
                  Text("PAN Number ", style: ConstStyle.sourceSansProDisable),
                  _space1,
                  Row(
                    children: [
                      Text(
                          (getPersonalDetail!.isPanVerified ?? 0)== 1
                              ? getPersonalDetail!.panNumber.toString()
                              : "PAN NUMBER",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: TextStyle(
                                color: (getPersonalDetail!.isPanVerified ?? 0)== 1
                                    ? Color(0xff22263D)
                                    : Color(0xffC8C7CE),
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                letterSpacing: 2),
                          )),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: (getPersonalDetail!.isPanVerified ?? 0) == 1
                                ? Color(0xff00E152)
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
                                (getPersonalDetail!.isPanVerified ?? 0) == 1
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
                  _space,
                  Text("Aadhaar Number ",
                      style: ConstStyle.sourceSansProDisable),
                  _space1,
                  Row(
                    children: [
                      Text(
                          (getPersonalDetail!.isAadharVerified ?? 0) == 1
                              ? getPersonalDetail!.aadharNumber.toString()
                              : "AADHAAR NUMBER",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: TextStyle(
                                color: (getPersonalDetail!.isAadharVerified ?? 0) == 1
                                    ? Color(0xff22263D)
                                    : Color(0xffC8C7CE),
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                letterSpacing: 2),
                          )),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: (getPersonalDetail!.isAadharVerified ?? 0) == 1
                                ? Color(0xff00E152)
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
                                (getPersonalDetail!.isAadharVerified ?? 0) == 1
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
                  _space,
                  Text("What is your gender? ",
                      style: ConstStyle.sourceSansProDisable),
                  _space1,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 34,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: (getPersonalDetail!.gender ?? 0) == 1
                                    ? Color(0xff23263B)
                                    : Color(0xffC8C7CD)),
                            color: (getPersonalDetail!.gender ?? 0) == 1
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
                                      color: (getPersonalDetail!.gender ?? 0) == 1
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
                                color: getPersonalDetail!.gender == 2
                                    ? Color(0xff23263B)
                                    : Color(0xffC8C7CD)),
                            color: getPersonalDetail!.gender == 2
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
                                      color: getPersonalDetail!.gender == 2
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
                                color: getPersonalDetail!.gender == 3
                                    ? Color(0xff23263B)
                                    : Color(0xffC8C7CD)),
                            color: getPersonalDetail!.gender == 3
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
                                      color: getPersonalDetail!.gender == 3
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
                        visible: getPersonalDetail!.mothersMaidenName != "" &&
                            getPersonalDetail!.mothersMaidenName != null
                            ? true
                            : false,
                        child: InkWell(
                          onTap: () {
                            updateGenderBottomSheet();
                          },
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xff00C6D8)),
                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 12.0),
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
                  Text("What is your marital status?",
                      style: ConstStyle.sourceSansProDisable),
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0),
                              child: Text(
                                "Single",
                                style: GoogleFonts.sourceSansPro(
                                  textStyle: TextStyle(
                                      color: getPersonalDetail!.marriedStatus ==
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
                                color: getPersonalDetail!.marriedStatus == 2
                                    ? Color(0xff23263B)
                                    : Color(0xffC8C7CD)),
                            color: getPersonalDetail!.marriedStatus == 2
                                ? Color(0xff22263D)
                                : Colors.white),
                        child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0),
                              child: Text(
                                "Married",
                                style: GoogleFonts.sourceSansPro(
                                  textStyle: TextStyle(
                                      color: getPersonalDetail!.marriedStatus ==
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
                                color: getPersonalDetail!.marriedStatus == 3
                                    ? Color(0xff23263B)
                                    : Color(0xffC8C7CD)),
                            color: getPersonalDetail!.marriedStatus == 3
                                ? Color(0xff22263D)
                                : Colors.white),
                        child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0),
                              child: Text(
                                "Others",
                                style: GoogleFonts.sourceSansPro(
                                  textStyle: TextStyle(
                                      color: getPersonalDetail!.marriedStatus ==
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
                        visible: getPersonalDetail!.mothersMaidenName != "" &&
                            getPersonalDetail!.mothersMaidenName != null
                            ? true
                            : false,
                        child: InkWell(
                          onTap: () {
                            updateMaritalBottomSheet();
                          },
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xff00C6D8)),
                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 12.0),
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
                  Visibility(
                    visible: isverifyKRA,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Address (As per record in KRA)",
                            style: ConstStyle.sourceSansProDisable),
                        _space1,
                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.2, color: Color(0xffC8C7CD)),
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xffF7F7FA)),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                                isAddressUpdated
                                    ? "${getPersonalDetail!
                                    .addressLine1}, ${getPersonalDetail!
                                    .addressLine2}, ${getPersonalDetail!
                                    .addressState}"
                                    : digiLockerDetailModel != null
                                    ? "${digiLockerDetailModel!
                                    .location}, ${digiLockerDetailModel!
                                    .villageTownCity}, ${digiLockerDetailModel!
                                    .district}, ${digiLockerDetailModel!
                                    .state}, ${digiLockerDetailModel!.country}"
                                    : "",
                                textAlign: TextAlign.start,
                                style: ConstStyle.sourceSans1),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () {
                              updateAddressBottomSheet();
                            },
                            child: Container(
                              height: 30,
                              width: 135,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xff00C6D8)),
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
                                    "Update Address",
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
                        _space,
                      ],
                    ),
                  ),
                  Text(
                    "What is your Occupation? ",
                    style: ConstStyle.sourceSansProDisable,
                  ),
                  _space1,
                  Text(
                    getPersonalDetail!.occupation != null
                        ? getPersonalDetail!.occupation.toString()
                        : "SELECT OCCUPATION",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: TextStyle(
                          color: getPersonalDetail!.occupation != null
                              ? Color(0xff22263D)
                              : Color(0xffC8C7CE),
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          letterSpacing: 2),
                    ),
                  ),
                  _space,
                  Text(
                    "What is your Annual income? ",
                    style: ConstStyle.sourceSansProDisable,
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0),
                              child: Text(
                                "Below 1 Lakh",
                                style: GoogleFonts.sourceSansPro(
                                  textStyle: TextStyle(
                                      color: getPersonalDetail!.annualIncome ==
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
                                color: getPersonalDetail!.annualIncome == 2
                                    ? Color(0xff23263B)
                                    : Color(0xffC8C7CD)),
                            color: getPersonalDetail!.annualIncome == 2
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
                                      color: getPersonalDetail!.annualIncome ==
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
                                color: getPersonalDetail!.annualIncome == 3
                                    ? Color(0xff23263B)
                                    : Color(0xffC8C7CD)),
                            color: getPersonalDetail!.annualIncome == 3
                                ? Color(0xff22263D)
                                : Colors.white),
                        child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0),
                              child: Text(
                                "5-10 Lakh",
                                style: GoogleFonts.sourceSansPro(
                                  textStyle: TextStyle(
                                      color: getPersonalDetail!.annualIncome ==
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0),
                              child: Text(
                                "10-20 Lakh",
                                style: GoogleFonts.sourceSansPro(
                                  textStyle: TextStyle(
                                      color: getPersonalDetail!.annualIncome ==
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
                                color: getPersonalDetail!.annualIncome == 5
                                    ? Color(0xff23263B)
                                    : Color(0xffC8C7CD)),
                            color: getPersonalDetail!.annualIncome == 5
                                ? Color(0xff22263D)
                                : Colors.white),
                        child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0),
                              child: Text(
                                "Above 25 Lakh",
                                style: GoogleFonts.sourceSansPro(
                                  textStyle: TextStyle(
                                      color: getPersonalDetail!.annualIncome ==
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
                        visible: getPersonalDetail!.mothersMaidenName != "" &&
                            getPersonalDetail!.mothersMaidenName != null
                            ? true
                            : false,
                        child: InkWell(
                          onTap: () {
                            updateAnnualBottomSheet();
                          },
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xff00C6D8)),
                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 12.0),
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
                  Text(
                    "What is your trading experience? ",
                    style: ConstStyle.sourceSansProDisable,
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0),
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0),
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0),
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0),
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0),
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0),
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0),
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
                      const SizedBox(
                        width: 15,
                      ),
                      Visibility(
                        visible: getPersonalDetail!.mothersMaidenName != "" &&
                            getPersonalDetail!.mothersMaidenName != null
                            ? true
                            : false,
                        child: InkWell(
                          onTap: () {
                            updateExperienceBottomSheet();
                          },
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xff00C6D8)),
                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 12.0),
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
                  Text(
                    "Mother's Maiden Name? ",
                    style: ConstStyle.sourceSansProDisable,
                  ),
                  _space1,
                  Row(
                    children: [
                      Text(
                          getPersonalDetail!.mothersMaidenName != "" &&
                              getPersonalDetail!.mothersMaidenName != null
                              ? getPersonalDetail!.mothersMaidenName.toString()
                              : "Maiden Name",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: TextStyle(
                                color: getPersonalDetail!.mothersMaidenName !=
                                    "" &&
                                    getPersonalDetail!.mothersMaidenName !=
                                        null
                                    ? Color(0xff22263D)
                                    : Color(0xffC8C7CE),
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                letterSpacing: 2),
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      Visibility(
                        visible: getPersonalDetail!.mothersMaidenName != "" &&
                            getPersonalDetail!.mothersMaidenName != null
                            ? true
                            : false,
                        child: InkWell(
                          onTap: () {
                            updateMaidenNameBottomSheet();
                          },
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xff00C6D8)),
                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 12.0),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Are You Politically Exposed",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: TextStyle(
                            color: getPersonalDetail!.mothersMaidenName != "" &&
                                getPersonalDetail!.mothersMaidenName != null
                                ? Color(0xff22263D)
                                : Color(0xffC8C7CE),
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        height: 35,
                        width: 70,
                        decoration: BoxDecoration(
                            color: getPersonalDetail!.isPoliticallyExposed == 1
                                ? Colors.green
                                : getPersonalDetail!.mothersMaidenName != "" &&
                                getPersonalDetail!.mothersMaidenName !=
                                    null
                                ? Colors.red
                                : Color(0xffC8C7CD),
                            borderRadius: BorderRadius.circular(25)),
                        child: Row(
                          children: [
                            getPersonalDetail!.isPoliticallyExposed == 1
                                ? Container()
                                : Icon(
                              size: 25,
                              Icons.circle,
                              color: Colors.white,
                            ),
                            SizedBox(width: 3),
                            Text(
                              getPersonalDetail!.isPoliticallyExposed == 1
                                  ? "YES"
                                  : "NO",
                              style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(width: 3),
                            getPersonalDetail!.isPoliticallyExposed == 1
                                ? Icon(
                              size: 25,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 1.5,
                        child: Text(
                          Strings.active_check,
                          style: GoogleFonts.sourceSansPro(
                            textStyle: TextStyle(
                              color: getPersonalDetail!.mothersMaidenName !=
                                  "" &&
                                  getPersonalDetail!.mothersMaidenName !=
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
                        height: 35,
                        width: 70,
                        decoration: BoxDecoration(
                            color: getPersonalDetail!.wouldYouLikeToActivate ==
                                1
                                ? Colors.green
                                : getPersonalDetail!.mothersMaidenName != "" &&
                                getPersonalDetail!.mothersMaidenName !=
                                    null
                                ? Colors.red
                                : Color(0xffC8C7CD),
                            borderRadius: BorderRadius.circular(25)),
                        child: Row(
                          children: [
                            getPersonalDetail!.wouldYouLikeToActivate == 1
                                ? Container()
                                : Icon(
                              size: 25,
                              Icons.circle,
                              color: Colors.white,
                            ),
                            SizedBox(width: 3),
                            Text(
                              getPersonalDetail!.wouldYouLikeToActivate == 1
                                  ? "YES"
                                  : "NO",
                              style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(width: 3),
                            getPersonalDetail!.wouldYouLikeToActivate == 1
                                ? Icon(
                              size: 25,
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
                  Row(
                    children: [
                      Text(
                        "In-Person Verification",
                        style: GoogleFonts.sourceSansPro(
                          textStyle: TextStyle(
                            color: getPersonalDetail!.inPersonVerification == 1
                                ? Color(0xff22263D)
                                : Color(0xffC8C7CE),
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: getPersonalDetail!.inPersonVerification == 1
                                ? Color(0xff00E152)
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
                                getPersonalDetail!.inPersonVerification == 1
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
  }

  Widget editPersonalDetails(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
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
                    inPersonVerifications = false;
                    isSignInDemat = false;
                    isAddressAdd = false;
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
                                    Text(
                                      getPersonalDetail!.dob != null
                                          ? DateFormat('dd-MM-yyyy').format(
                                          DateTime.parse(getPersonalDetail!
                                              .dob
                                              .toString()))
                                          : dob.toString(),
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
                            width: MediaQuery
                                .of(context)
                                .size
                                .width / 1.5,
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
                            width: MediaQuery
                                .of(context)
                                .size
                                .width / 1.3,
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
                            width: MediaQuery
                                .of(context)
                                .size
                                .width / 1.3,
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
                          if (dob != "" || getPersonalDetail!.dob != null) {
                            getPreferences();
                            setState(() {
                              isEditStep1 = false;
                              isEditStep2 = true;
                              isButtonClick = true;
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
                              "Hey $userfName, Let’s Verify Your Email Id",
                              style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    color: Color(0xff22263D),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                              ),
                            ),
                            _space,
                            _space,
                            _space1,
                            Text("Email ID* ", style: ConstStyle.sourceSansPro),
                            _space1,
                            InkWell(
                              onTap: () async {
                                final user = await signInWithGoogle();
                                await ProfileRepository()
                                    .verifyEmail('${user.user!.email}', true);
                                print("========76544 $isGoogleEmailVerify");
                                await HelperFunctions.saveEmail(
                                    "${user.user!.email}");

                                await logout();
                                mail = await HelperFunctions.getEmailId();
                                setState(() {
                                  isGoogleSign = false;
                                  print("userEeamil${user.user!.email}");
                                  print("userEeamil${mail}");
                                  isEmailVerified = true;
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
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.20,
                            ),
                            /*Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
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
                                        color: const Color(0xffC8C7CE))),
                                child: Center(
                                    child: Text(
                                  "Continue",
                                  style: ConstStyle.sourceSansDisable,
                                )),
                              ),
                            ),*/
                          ],
                        ),
                      ),
                      Visibility(
                        visible: isEmailVerified,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hey $userfName, Congratulations! Your Email is Verified",
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
                                        width: 1.1,
                                        color: AppColors.borderColor),
                                    color: Color(0xffF7F7FA)),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                        width:
                                        MediaQuery
                                            .of(context)
                                            .size
                                            .width *
                                            0.70,
                                        child: Text(
                                          mail.toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: ConstStyle.sourceSans5,
                                        )),
                                    Image.asset(
                                      "assets/images/done1.png",
                                      color: Colors.green,
                                      scale: 6,
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.30,
                            ),
                            InkWell(
                              onTap: () {
                                getPreferences();
                                setState(() {
                                  isEmailVerified = false;
                                  isEditStep2 = false;
                                  getPersonalDetail?.isAadharVerified != 1
                                      ? getPersonalDetail?.isPanVerified != 1
                                      ? isPanVerify = true
                                      : isAadhaarVerified = true
                                      : isEditStep12 = true;
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
                      /*  Visibility(
                        visible: isPanVerify,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hey $userfName, Let’s Validate Your PAN ",
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
                                      onTap: () async {
                                        if (isPanSelected == true) {
                                          final panStatusModel =
                                          await ProfileRepository()
                                              .getPanCard(panNumber.text
                                              .toString());
                                          if (panStatusModel != "") {
                                            if (panStatusModel!.statusCode ==
                                                "E") {
                                              setState(() {
                                                verifyPanNoBottomSheet();
                                                panName = panStatusModel!.name
                                                    .toString();
                                                print("dfdjfg " +
                                                    panStatusModel!.name
                                                        .toString());
                                              });
                                            } else if (panStatusModel!
                                                .statusCode ==
                                                "X") {
                                              setState(() {
                                                ReEnterPanNumberBottomSheet(
                                                    "DEACTIVATED");
                                              });
                                            } else if (panStatusModel!
                                                .statusCode ==
                                                "I") {
                                              setState(() {
                                                ReEnterPanNumberBottomSheet(
                                                    "INOPERATIVE");
                                              });
                                            } else
                                            if (panStatusModel!.statusCode ==
                                                "N" ||
                                                panStatusModel!.statusCode ==
                                                    "F" ||
                                                panStatusModel!.statusCode ==
                                                    "ED" ||
                                                panStatusModel!.statusCode ==
                                                    "D") {
                                              setState(() {
                                                ReEnterPanNumberBottomSheet(
                                                    "INVALID ");
                                              });
                                            }
                                          }
                                        }
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
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.40,
                            ),
                          ],
                        ),
                      ),*/
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: isPanVerify,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hey $userfName, Let’s Validate Your PAN ",
                        style: ConstStyle.quickMedium,
                      ),
                      _space,
                      Text("PAN Number* ", style: ConstStyle.sourceSansPro),
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
                          textCapitalization: TextCapitalization.characters,
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
                                onTap: () async {
                                  if (isPanSelected == true) {
                                    panStatusModel = await ProfileRepository()
                                        .getPanCard(panNumber.text.toString());
                                    if (panStatusModel != "") {
                                      if (panStatusModel?.panStatus == "E") {
                                        setState(() async {
                                          panName =
                                          "${panStatusModel!
                                              .panFname} ${panStatusModel!
                                              .panMname} ${panStatusModel!
                                              .panLname}";
                                          await HelperFunctions.savePanName(
                                              "${panStatusModel!
                                                  .panFname} ${panStatusModel!
                                                  .panMname} ${panStatusModel!
                                                  .panLname}");
                                          await HelperFunctions.saveFirstName(
                                              "${panStatusModel!
                                                  .panFname} ${panStatusModel!
                                                  .panMname}");
                                          await HelperFunctions.saveLastName(
                                              "${panStatusModel!.panLname}");
                                          getPreferences();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                  const VerifyPANAnimation()));
                                          setState(() {
                                            getPersonalDetail
                                                ?.isAadharVerified !=
                                                1
                                                ? isAadhaarVerified = true
                                                : isEditStep12 = true;
                                            isEditStep1 = false;
                                            isEditStep2 = false;
                                            isPanVerify = false;
                                          });
                                          // verifyPanNoBottomSheet();
                                        });
                                      } else if (panStatusModel?.panStatus ==
                                          "X") {
                                        setState(() {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                  const InvalidPANAnimation(
                                                    msg: "DEACTIVATED",
                                                  )));
                                          //ReEnterPanNumberBottomSheet("DEACTIVATED");
                                        });
                                      } else if (panStatusModel?.panStatus ==
                                          "I") {
                                        setState(() {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                  const InvalidPANAnimation(
                                                    msg: "INOPERATIVE",
                                                  )));
                                          // ReEnterPanNumberBottomSheet("INOPERATIVE");
                                        });
                                      } else if (panStatusModel?.panStatus ==
                                          "N" ||
                                          panStatusModel?.panStatus == "F" ||
                                          panStatusModel?.panStatus == "ED" ||
                                          panStatusModel?.panStatus == "D") {
                                        setState(() {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                  const InvalidPANAnimation(
                                                    msg: "INVALID",
                                                  )));
                                          // ReEnterPanNumberBottomSheet("INVALID ");
                                        });
                                      }
                                    }
                                  }
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
                                                fontWeight: FontWeight.w500))),
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
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.40,
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
                        "Hey $panName, let's Authenticate Your AADHAAR",
                        style: ConstStyle.quickMedium,
                      ),
                      _space,
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return Digilocker();
                              })).then((value) {
                            geteDigiLocker();
                            setState(() {
                              isEditStep12 = true;
                              isAadhaarVerified = false;
                              isEditStep1 = false;
                              isEditStep2 = false;
                            });
                          });
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
                        height: MediaQuery
                            .of(context)
                            .size
                            .height / 2.8,
                      ),
                      /*InkWell(
                        onTap: () {
                          geteDigiLocker();
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
                      ),*/
                      const SizedBox(
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
                        "Hey $panName, Please Verify, We Fetched This Information From Pan And KRA Records, As Provided By You.",
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
                          color: Color(0xffF7F7FA),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                digiLockerDetailModel != null
                                    ? digiLockerDetailModel!.aadharNumber
                                    .toString()
                                    : "",
                                style: GoogleFonts.sourceSansPro(
                                  textStyle: const TextStyle(
                                      color: Color(0xff22263D),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                      letterSpacing: 3),
                                ),
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
                      Text("Address (As per records in AADHAAR) : ",
                          style: ConstStyle.sourceSansPro),
                      _space1,
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              width: 1.1, color: AppColors.borderColor),
                          color: Color(0xffF7F7FA),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 8),
                          child: Text(
                            digiLockerDetailModel != null
                                ? "${digiLockerDetailModel!
                                .location}, ${digiLockerDetailModel!
                                .villageTownCity}, ${digiLockerDetailModel!
                                .district}, ${digiLockerDetailModel!.state}"
                                : "",
                            style: GoogleFonts.sourceSansPro(
                              textStyle: const TextStyle(
                                  color: Color(0xff22263D),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  letterSpacing: 3),
                            ),
                          ),
                        ),
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
                                  color: digiLockerDetailModel?.gender == "M"
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
                                            color: digiLockerDetailModel
                                                ?.gender == "M"
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
                                  color: digiLockerDetailModel?.gender == "F"
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
                                            color: digiLockerDetailModel
                                                ?.gender == "F"
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
                                  color: digiLockerDetailModel?.gender == "O"
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
                                            color: digiLockerDetailModel
                                                ?.gender == "O"
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
                                boxShadow: const [
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
                          const SizedBox(
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
                                boxShadow: const [
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
                          const SizedBox(
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
                                boxShadow: const [
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
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
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
                                  hint: const Text(
                                    "Select Occupation",
                                    style: TextStyle(color: Color(0xffC8C7CE)),
                                  ),
                                  items: profession_data.map((item) {
                                    return DropdownMenuItem(
                                        value: item.professionName.toString(),
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
                                  boxShadow: const [
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
                                  boxShadow: const [
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
                                boxShadow: const [
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
                                boxShadow: const [
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
                                boxShadow: const [
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
                                boxShadow: const [
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
                                boxShadow: const [
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
                                boxShadow: const [
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
                                boxShadow: const [
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
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Have you filed ITR last 2 Years",
                              style: GoogleFonts.sourceSansPro(
                                textStyle: const TextStyle(
                                    color: Color(0xff22263D),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15),
                              )),
                          CustomSwitch(
                            activeColor: Colors.green,
                            value: itrValue,
                            onChanged: (value) {
                              print("VALUE : $value");
                              setState(() {
                                itrValue = value;
                                if (value == true) {
                                  itrValueInt = 1;
                                } else {
                                  itrValueInt = 0;
                                }
                                print("VALUE : $itrValue");
                              });
                            },
                          )
                        ],
                      ),
                      _space,
                      Text("Mother's Maiden Name? ",
                          style: ConstStyle.sourceSansPro),
                      const SizedBox(
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
                          textCapitalization: TextCapitalization.words,
                          onChanged: (text) {
                            setState(() {
                              isMaiden = true;
                            });
                          },
                          decoration: const InputDecoration(
                            hintText: "Maiden Name",
                            hintStyle: TextStyle(color: Color(0xffC8C7CE)),
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.only(
                                left: 14.0, bottom: 7.0, top: 5.0),
                          ),
                        ),
                      ),
                      _space,
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
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
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
                                        hint: Text(
                                          "Select Address Proof",
                                          style: TextStyle(
                                              color: Color(0xffC8C7CE)),
                                        ),
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
                                style: ConstStyle.sourceSansPro12),
                            _space,
                            Visibility(
                              visible: isScans,
                              child: InkWell(
                                onTap: () {
                                  if (addressProof != null) {
                                    uploadPassportBottomSheet();
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: "First Select Address Proof");
                                  }
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
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 14.0, top: 4),
                                          child: SizedBox(
                                            width: 280,
                                            child: Text(
                                              fileName1.toString(),
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  color: Color(0xff22263D),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15),
                                            ),
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
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 14.0, top: 4),
                                          child: SizedBox(
                                            width: 280,
                                            child: Text(
                                              fileName2.toString(),
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  color: Color(0xff22263D),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15),
                                            ),
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
                                controller: addressLine1,
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
                                controller: addressLine2,
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
                                  hintStyle:
                                  const TextStyle(color: Color(0xffC8C7CE)),
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
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
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
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
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
                                        hint: const Text("Select City",
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
                      _space,
                      InkWell(
                        onTap: () async {
                          if (isMaiden == true) {
                            if (genderIndex == 0) {
                              Fluttertoast.showToast(
                                  msg: 'Choose your gender!');
                            } else if (maritalIndex == 0) {
                              Fluttertoast.showToast(
                                  msg: 'Choose your marital status!');
                            } else if (professionID == null) {
                              Fluttertoast.showToast(
                                  msg: 'Select Your Occupation!');
                            } else if (incomeIndex == 0) {
                              Fluttertoast.showToast(
                                  msg: 'Choose your annual income! ');
                            }else if (experienceIndex == 0) {
                              Fluttertoast.showToast(
                                  msg: 'Choose your trading experience!');
                            }else if (maidenName.text.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: 'Enter Your Maiden Name');
                            } else {
                              if (panStatusModel
                                  ?.personVideoVerificationStatus ==
                                  1) {
                                var updateProfileData1 =
                                await ProfileRepository()
                                    .addPersonalDetails(
                                  firstName: userfName.toString(),
                                  lastName: userlName.toString(),
                                  addressLine1: addressLine1.text.toString(),
                                  addressLine2: addressLine2.text.toString(),
                                  addressLine3: addressLine2.text.toString(),
                                  addressZip: addressZip.text.toString(),
                                  maidenName: maidenName.text.toString(),
                                  professionID: professionID.toString(),
                                  proof: addressProof.toString(),
                                  stateId: stateid.toString(),
                                  cityID: cityid.toString(),
                                  genderIndex: genderIndex,
                                  maritalIndex: maritalIndex,
                                  incomeIndex: incomeIndex,
                                  experienceIndex: experienceIndex,
                                  dob: dob != ""
                                      ? dob.toString()
                                      : DateFormat('dd-MM-yyyy').format(
                                      DateTime.parse(getPersonalDetail!.dob
                                          .toString())),
                                  politicallyexposed:
                                  potentially_exposed_statusInt,
                                  wouldyouliketoActivate: activate_futureInt,
                                  chekbox1: isCheckedInt,
                                  chekbox2: isChecked1Int,
                                  itrFiled: itrValueInt,
                                );
                                if (updateProfileData1 != "") {
                                  await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const ContinueAnimation()));
                                }
                                setState(() {
                                  inPersonVerifications = false;
                                  profileprofilevisbileTab1 = false;
                                  profilevisbileTab2 = false;
                                  isBankShowing = true;
                                  profilevisbileTab3 = false;
                                  isSignInDemat = false;
                                  isAddressAdd = false;
                                  isButtonClickMaiden = true;
                                });
                              } else {
                                setState(() {
                                  inPersonVerifications = false;
                                  profileprofilevisbileTab1 = false;
                                  profilevisbileTab2 = false;
                                  profilevisbileTab3 = true;
                                  isSignInDemat = false;
                                  isAddressAdd = false;
                                  isButtonClickMaiden = true;
                                });
                              }
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
                      /* InkWell(
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
                              setState((){
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
                      ),*/
                      /*  InkWell(
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
                      ),*/
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
                        "Hey $panName, We Need Some Additional Information, It Won’t Take Long.",
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
                                  boxShadow: const [
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
                                  boxShadow: const [
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
                                boxShadow: const [
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
                          const SizedBox(
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
                                boxShadow: const [
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
                          const SizedBox(
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
                                boxShadow: const [
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
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
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
                                  hint: Text(
                                    "Select Occupation",
                                    style: TextStyle(color: Color(0xffC8C7CE)),
                                  ),
                                  items: profession_data.map((item) {
                                    return DropdownMenuItem(
                                        value: item.professionName.toString(),
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
                                  boxShadow: const [
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
                                  boxShadow: const [
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
                                boxShadow: const [
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
                                boxShadow: const [
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
                                boxShadow: const [
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
                                boxShadow: const [
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
                                boxShadow: const [
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
                                boxShadow: const [
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
                      const SizedBox(
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
                          textCapitalization: TextCapitalization.words,
                          onChanged: (text) {
                            setState(() {
                              isMaiden = true;
                            });
                          },
                          decoration: const InputDecoration(
                            hintText: "Maiden Name",
                            hintStyle: TextStyle(color: Color(0xffC8C7CE)),
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
                        onTap: () async {
                          if (isMaiden == true) {
                            if (professionID == null) {
                              Fluttertoast.showToast(
                                  msg: 'Select Your Occupation');
                            } else if (maidenName.text.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: 'Enter Your Maiden Name');
                            } else {
                              setState(() {
                                inPersonVerifications = false;
                                profileprofilevisbileTab1 = false;
                                profilevisbileTab2 = false;
                                profilevisbileTab3 = true;
                                isSignInDemat = false;
                                isAddressAdd = false;
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

  Widget inPersonVerification() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(
        bottom: 20.0,
      ),
      child: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          color: const Color(0xffEFFBFF),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 8,
              ),
              Center(
                child: Text(
                  "Important Instructions.",
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.w500,
                        fontSize: 25),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                Strings.authinstruc,
                textAlign: TextAlign.center,
                style: GoogleFonts.sourceSansPro(
                  textStyle: const TextStyle(
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
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x29000000),
                            blurRadius: 8.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child: Center(
                        child: Text(
                          "${randumNumber![0]}",
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 25),
                          ),
                        )),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 60,
                    width: 50,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x29000000),
                            blurRadius: 8.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child: Center(
                        child: Text(
                          "${randumNumber![1]}",
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 25),
                          ),
                        )),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 60,
                    width: 50,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x29000000),
                            blurRadius: 8.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child: Center(
                        child: Text(
                          "${randumNumber![2]}",
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 25),
                          ),
                        )),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 60,
                    width: 50,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x29000000),
                            blurRadius: 8.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child: Center(
                        child: Text(
                          "${randumNumber![3]}",
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
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
                  textStyle: const TextStyle(
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
                      boxShadow: const [
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
                        boxShadow: const [
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
                        boxShadow: const [
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
                        const SizedBox(
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
                  const SizedBox(
                    width: 16,
                  ),
                  Container(
                    height: 125,
                    width: 125,
                    decoration: BoxDecoration(
                        boxShadow: const [
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
                        const SizedBox(
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
                    profilevisbileTab3 = true;
                    inPersonVerifications = false;
                    profileprofilevisbileTab1 = false;
                    profilevisbileTab2 = false;
                    isSignInDemat = false;
                    isAddressAdd = false;
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

  Widget editPersonalPic() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
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
                    inPersonVerifications = false;
                    isSignInDemat = false;
                    isAddressAdd = false;
                    isEditStep12 = false;
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
                  Row(
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
                      fontStyle: FontStyle.italic,
                      fontSize: 12),
                ),
              ),
              _space,
              /* Container(
                height: 250,
                width: 230,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 3,
                      color: _isLoading
                          ? const Color(0xff66DC65)
                          : AppColors.primaryColor),
                  // image: const DecorationImage(
                  // image: AssetImage(ConstantImage.profile_pic),
                  // )
                ),
                child: _isLoading
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: SvgPicture.asset(
                            ConstantImage.profile_pic,
                          ),
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child:Container(),
                      // CameraPreview(_cameraController)

                      ),

                // child: _image != null
                //     ? InkWell(
                //         onTap: () {
                //           Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                   builder: (context) =>
                //                       ImagePreview(imageFile: _image!)));
                //         },
                //         child: ClipRRect(
                //           borderRadius: BorderRadius.circular(10.0),
                //           child: Image.file(
                //             _image!,
                //             fit: BoxFit.cover,
                //           ),
                //         ),
                //       )
                //     : ClipRRect(
                //         borderRadius: BorderRadius.circular(10.0),
                //         child: Padding(
                //           padding: const EdgeInsets.all(28.0),
                //           child: SvgPicture.asset(
                //             ConstantImage.profile_pic,
                //           ),
                //         ),
                //       ),
              ),*/
              //
              Container(
                  height: 250,
                  width: 230,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 3,
                        color: _isLoading
                            ? const Color(0xff66DC65)
                            : AppColors.primaryColor),
                  ),
                  child: _isLoading == false
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: SvgPicture.asset(
                        ConstantImage.profile_pic,
                      ),
                    ),
                  )
                      : _isRecordingPlay == false
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: CameraPreview(_cameraController),
                  )
                      : ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Stack(
                      children: [
                        FutureBuilder(
                          future: _initVideoPlayer(),
                          builder: (context, state) {
                            // return VideoPlayer(_videoPlayerController!);
                            if (state.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else {
                              return VideoPlayer(
                                  _videoPlayerController);
                            }
                          },
                        ),
                        Positioned(
                          top: 105,
                          left: 95,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 0.5, color: Colors.white),
                              borderRadius: BorderRadius.circular(35),
                              color:
                              Color(0xffffffff).withOpacity(0.20),
                            ),
                            child: const Center(
                                child: Icon(
                                  Icons.play_arrow,
                                  size: 30,
                                  color: Colors.white,
                                )),
                          ),
                        )
                      ],
                    ),
                  )),
              _space,
              _isLoading == false
                  ? InkWell(
                onTap: () async {
                  setState(() {
                    _isLoading = true;
                  });
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
              )
                  : _isRecordingStop == false
                  ? InkWell(
                onTap: () async {
                  setState(() {
                    _recordVideo();
                    Future.delayed(Duration(seconds: 15), () async {
                      _isRecordingPlay = true;
                      file = await _cameraController
                          .stopVideoRecording();
                      setState(() {
                        _isRecording = false;
                        isCapture = true;
                      });
                    });
                    setState(() {
                      _isRecordingStop = true;
                    });
                  });
                },
                child: Container(
                  height: 30,
                  width: 140,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: Color(0xff02AD41)),
                  child: Center(
                      child: Text(
                        "Start Recording",
                        style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 10),
                        ),
                      )),
                ),
              )
                  : _isRecordingPlay == false
                  ? InkWell(
                onTap: () async {
                  file = await _cameraController
                      .stopVideoRecording();
                  setState(() {
                    isCapture = true;
                    _isRecording = false;
                    _isRecordingPlay = true;
                  });
                },
                child: Container(
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: Color(0xffFF0023)),
                  child: Center(
                      child: Text(
                        "Stop",
                        style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 10),
                        ),
                      )),
                ),
              )
                  : InkWell(
                onTap: () async {
                  final route = MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (_) =>
                        VideoPage(filePath: file.path),
                  );
                  Navigator.push(context, route);
                  setState(() {
                    // _isLoading = false;
                    // _isRecordingPlay = false;
                    // _isRecording = false;
                    // _isRecordingStop = false;
                  });
                },
                child: Container(
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: AppColors.primaryColor),
                  child: Center(
                      child: Text(
                        "Preview",
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
              _space,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: 50,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x0000001A),
                            blurRadius: 8.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child: Center(
                        child: Text(
                          "${randumNumber![0]}",
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 25),
                          ),
                        )),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 60,
                    width: 50,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x0000001A),
                            blurRadius: 8.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child: Center(
                        child: Text(
                          "${randumNumber![1]}",
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 25),
                          ),
                        )),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 60,
                    width: 50,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x0000001A),
                            blurRadius: 8.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child: Center(
                        child: Text(
                          "${randumNumber![2]}",
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 25),
                          ),
                        )),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 60,
                    width: 50,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x0000001A),
                            blurRadius: 8.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child: Center(
                        child: Text(
                          "${randumNumber![3]}",
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 25),
                          ),
                        )),
                  ),
                ],
              ),
              _space,
              _space,
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  const TextSpan(
                      text: Strings.authinstructions,
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff22263D))),
                  TextSpan(
                    text: "see example",
                    style: const TextStyle(
                        fontSize: 14,
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
                      const SizedBox(
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
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        Strings.look,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
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
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        Strings.Sungalses,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
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
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        Strings.Caps,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.sourceSansPro(
                          textStyle: const TextStyle(
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
                onTap: () async {
                  var res = await ProfileRepository().personVerification(
                    file: file.path,
                  );
                  if (res != "") {
                    var updateProfileData = await ProfileRepository()
                        .addPersonalDetails(
                        firstName: userfName.toString(),
                        lastName: userlName.toString(),
                        addressLine1:
                        "${digiLockerDetailModel
                            ?.houseNo} ${digiLockerDetailModel?.location}",
                        addressLine2:
                        "${digiLockerDetailModel?.villageTownCity}",
                        addressLine3:
                        "${digiLockerDetailModel
                            ?.landmark} ${digiLockerDetailModel?.country}",
                        addressZip: "${digiLockerDetailModel?.pincode}",
                        maidenName: maidenName.text.toString(),
                        professionID: professionID.toString(),
                        proof: addressProof.toString(),
                        stateId: "${digiLockerDetailModel?.state}",
                        cityID: "${digiLockerDetailModel?.district}",
                        genderIndex: genderIndex,
                        maritalIndex: maritalIndex,
                        incomeIndex: incomeIndex,
                        experienceIndex: experienceIndex,
                        dob: dob.toString(),
                        politicallyexposed: potentially_exposed_statusInt,
                        wouldyouliketoActivate: activate_futureInt,
                        chekbox1: isCheckedInt,
                        chekbox2: isChecked1Int,
                        itrFiled: itrValueInt);
                    if (updateProfileData != "") {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfileAnimation()));
                      setState(() {
                        isBankShowing = true;
                        isAddPersonalDetails = true;
                        profilevisbileTab3 = false;
                        inPersonVerifications = false;
                        profileprofilevisbileTab1 = false;
                        profilevisbileTab2 = false;
                        isMandatory = false;
                        isUpload = false;
                        isSignInDemat = false;
                        isAddressAdd = false;
                      });
                      //onProfilePicVerificationBottomSheet();
                    } else {
                      Fluttertoast.showToast(msg: "something went wrong");
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

  // Widget bankDetail() {
  //   return Padding(
  //     padding: const EdgeInsets.all(
  //       8.0,
  //     ),
  //     child: Container(
  //       width: MediaQuery.of(context).size.width,
  //       decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(5),
  //           color: const Color(0xffFCFCFD).withOpacity(0.35),
  //           border: Border.all(width: 1.2, color: Color(0xffbcbcbc))),
  //       child: Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Padding(
  //               padding: const EdgeInsets.symmetric(vertical: 8.0),
  //               child: Text(
  //                 "Bank Details",
  //                 style: GoogleFonts.quicksand(
  //                   textStyle: const TextStyle(
  //                       color: Color(0xff22263D),
  //                       fontWeight: FontWeight.w500,
  //                       fontSize: 20),
  //                 ),
  //               ),
  //             ),
  //             const Divider(
  //               thickness: 1,
  //               indent: 5,
  //               endIndent: 5,
  //             ),
  //             _space,
  //             Text(
  //               "Hey $userfName, Enter Your Bank Details",
  //               style: GoogleFonts.quicksand(
  //                 textStyle: const TextStyle(
  //                     color: Color(0xff22263D),
  //                     fontWeight: FontWeight.w500,
  //                     fontSize: 20),
  //               ),
  //             ),
  //             Text(
  //               "We will deposit ₹1 in your bank account to verify it",
  //               style: GoogleFonts.sourceSansPro(
  //                 textStyle: const TextStyle(
  //                     color: Color(0xff22263D),
  //                     fontWeight: FontWeight.w500,
  //                     fontSize: 15),
  //               ),
  //             ),
  //             _space,
  //             Text(
  //               "IFSC Code ",
  //               style: GoogleFonts.sourceSansPro(
  //                 textStyle: const TextStyle(
  //                     color: Color(0xff22263D),
  //                     fontWeight: FontWeight.w500,
  //                     fontSize: 12),
  //               ),
  //             ),
  //             _space1,
  //             Container(
  //               height: 45,
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(5),
  //                 border: Border.all(width: 1.1, color: AppColors.borderColor),
  //               ),
  //               child: TextField(
  //                 controller: ifscCode,
  //                 autofocus: false,
  //                 textCapitalization: TextCapitalization.characters,
  //                 inputFormatters: [
  //                   LengthLimitingTextInputFormatter(11),
  //                 ],
  //                 style: GoogleFonts.sourceSansPro(
  //                   textStyle: const TextStyle(
  //                       color: Color(0xff22263D),
  //                       fontWeight: FontWeight.w500,
  //                       fontSize: 16,
  //                       letterSpacing: 4),
  //                 ),
  //                 keyboardType: TextInputType.text,
  //                 decoration: const InputDecoration(
  //                   hintText: "Enter IFSC code",
  //                   hintStyle: TextStyle(color: Color(0xffC8C7CE)),
  //                   border: InputBorder.none,
  //                   fillColor: Colors.white,
  //                   contentPadding:
  //                       EdgeInsets.only(left: 14.0, bottom: 8.0, top: 5),
  //                 ),
  //               ),
  //             ),
  //             _space1,
  //             _space1,
  //             RichText(
  //               text: const TextSpan(children: [
  //                 TextSpan(
  //                     text: "Click here",
  //                     style: TextStyle(
  //                         decoration: TextDecoration.underline,
  //                         fontWeight: FontWeight.w500,
  //                         fontSize: 12,
  //                         color: Color(0xffFF405A))),
  //                 TextSpan(
  //                     text: "  for help with the IFSC code.",
  //                     style: TextStyle(
  //                         fontStyle: FontStyle.normal,
  //                         fontWeight: FontWeight.w500,
  //                         fontSize: 12,
  //                         color: Color(0xff22263D))),
  //               ]),
  //             ),
  //             _space,
  //             Text(
  //               "Bank Account Number ",
  //               style: GoogleFonts.sourceSansPro(
  //                 textStyle: const TextStyle(
  //                     color: Color(0xff22263D),
  //                     fontWeight: FontWeight.w500,
  //                     fontSize: 12),
  //               ),
  //             ),
  //             _space1,
  //             Container(
  //               height: 45,
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(5),
  //                 border: Border.all(width: 1.1, color: AppColors.borderColor),
  //               ),
  //               child: TextField(
  //                 controller: bankAccountNo,
  //                 obscureText: true,
  //                 autofocus: false,
  //                 inputFormatters: [
  //                   LengthLimitingTextInputFormatter(16),
  //                 ],
  //                 style: GoogleFonts.sourceSansPro(
  //                   textStyle: const TextStyle(
  //                       color: Color(0xff22263D),
  //                       fontWeight: FontWeight.w500,
  //                       fontSize: 16,
  //                       letterSpacing: 4),
  //                 ),
  //                 keyboardType: TextInputType.number,
  //                 decoration: const InputDecoration(
  //                   hintText: "Enter 16 Digit Account Number",
  //                   hintStyle: TextStyle(color: Color(0xffC8C7CE)),
  //                   border: InputBorder.none,
  //                   fillColor: Colors.white,
  //                   labelStyle:
  //                       TextStyle(color: AppColors.textColor, letterSpacing: 4),
  //                   contentPadding:
  //                       EdgeInsets.only(left: 14.0, bottom: 8.0, top: 5),
  //                 ),
  //               ),
  //             ),
  //             _space,
  //             Text(
  //               "Re-enter Bank Account Number ",
  //               style: GoogleFonts.sourceSansPro(
  //                 textStyle: const TextStyle(
  //                     color: Color(0xff22263D),
  //                     fontWeight: FontWeight.w500,
  //                     fontSize: 12),
  //               ),
  //             ),
  //             _space1,
  //             Container(
  //               height: 45,
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(5),
  //                 border: Border.all(width: 1.1, color: AppColors.borderColor),
  //               ),
  //               child: TextField(
  //                 controller: confirmBankAcc,
  //                 autofocus: false,
  //                 inputFormatters: [
  //                   LengthLimitingTextInputFormatter(16),
  //                 ],
  //                 style: GoogleFonts.sourceSansPro(
  //                   textStyle: const TextStyle(
  //                       color: Color(0xff22263D),
  //                       fontWeight: FontWeight.w500,
  //                       fontSize: 16,
  //                       letterSpacing: 4),
  //                 ),
  //                 keyboardType: TextInputType.number,
  //                 decoration: const InputDecoration(
  //                   hintText: "Enter 16 Digit Re-Account number",
  //                   hintStyle: TextStyle(color: Color(0xffC8C7CE)),
  //                   labelStyle:
  //                       TextStyle(color: AppColors.textColor, letterSpacing: 4),
  //                   border: InputBorder.none,
  //                   fillColor: Colors.white,
  //                   contentPadding:
  //                       EdgeInsets.only(left: 14.0, bottom: 8.0, top: 5),
  //                 ),
  //               ),
  //             ),
  //             _space,
  //             Text(
  //               "Account Type? ",
  //               style: GoogleFonts.sourceSansPro(
  //                 textStyle: const TextStyle(
  //                     color: Color(0xff22263D),
  //                     fontWeight: FontWeight.w500,
  //                     fontSize: 12),
  //               ),
  //             ),
  //             _space,
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               children: [
  //                 InkWell(
  //                   onTap: () {
  //                     setState(() {
  //                       savingIndex = 1;
  //                     });
  //                   },
  //                   child: Container(
  //                     height: 34,
  //                     decoration: BoxDecoration(
  //                         boxShadow: const [
  //                           BoxShadow(
  //                             color: Color(0x29000000),
  //                             blurRadius: 6.0,
  //                           ),
  //                         ],
  //                         border: Border.all(
  //                             width: 1,
  //                             color: savingIndex == 1
  //                                 ? Color(0xff22263D)
  //                                 : Color(0xff22263D)),
  //                         color: savingIndex == 1
  //                             ? Color(0xff22263D)
  //                             : Colors.white),
  //                     child: Center(
  //                         child: Padding(
  //                       padding: const EdgeInsets.symmetric(horizontal: 20.0),
  //                       child: Text(
  //                         "Savings",
  //                         style: GoogleFonts.sourceSansPro(
  //                           textStyle: TextStyle(
  //                               color: savingIndex == 1
  //                                   ? Colors.white
  //                                   : Color(0xff22263D),
  //                               fontWeight: FontWeight.w500,
  //                               fontSize: 15),
  //                         ),
  //                       ),
  //                     )),
  //                   ),
  //                 ),
  //                 const SizedBox(
  //                   width: 15,
  //                 ),
  //                 InkWell(
  //                   onTap: () {
  //                     setState(() {
  //                       savingIndex = 2;
  //                     });
  //                   },
  //                   child: Container(
  //                     height: 34,
  //                     decoration: BoxDecoration(
  //                         boxShadow: const [
  //                           BoxShadow(
  //                             color: Color(0x29000000),
  //                             blurRadius: 6.0,
  //                           ),
  //                         ],
  //                         border: Border.all(
  //                             width: 1,
  //                             color: savingIndex == 2
  //                                 ? Color(0xff22263D)
  //                                 : Color(0xff22263D)),
  //                         color: savingIndex == 2
  //                             ? Color(0xff22263D)
  //                             : Colors.white),
  //                     child: Center(
  //                         child: Padding(
  //                       padding: const EdgeInsets.symmetric(horizontal: 20.0),
  //                       child: Text(
  //                         "Current",
  //                         style: GoogleFonts.sourceSansPro(
  //                           textStyle: TextStyle(
  //                               color: savingIndex == 2
  //                                   ? Colors.white
  //                                   : Color(0xff22263D),
  //                               fontWeight: FontWeight.w500,
  //                               fontSize: 15),
  //                         ),
  //                       ),
  //                     )),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             _space,
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               children: [
  //                 InkWell(
  //                   onTap: () {
  //                     setState(() {
  //                       jointIndex = 1;
  //                     });
  //                   },
  //                   child: Container(
  //                     height: 34,
  //                     decoration: BoxDecoration(
  //                         boxShadow: const [
  //                           BoxShadow(
  //                             color: Color(0x29000000),
  //                             blurRadius: 6.0,
  //                           ),
  //                         ],
  //                         border: Border.all(
  //                             width: 1,
  //                             color: jointIndex == 1
  //                                 ? Color(0xff000000)
  //                                 : Color(0xff22263D)),
  //                         color: jointIndex == 1
  //                             ? Color(0xff22263D)
  //                             : Colors.white),
  //                     child: Center(
  //                         child: Padding(
  //                       padding: const EdgeInsets.symmetric(horizontal: 18.0),
  //                       child: Text(
  //                         "Single",
  //                         style: GoogleFonts.sourceSansPro(
  //                           textStyle: TextStyle(
  //                               color: jointIndex == 1
  //                                   ? Colors.white
  //                                   : Color(0xff22263D),
  //                               fontWeight: FontWeight.w500,
  //                               fontSize: 15),
  //                         ),
  //                       ),
  //                     )),
  //                   ),
  //                 ),
  //                 const SizedBox(
  //                   width: 15,
  //                 ),
  //                 InkWell(
  //                   onTap: () {
  //                     setState(() {
  //                       jointIndex = 2;
  //                     });
  //                   },
  //                   child: Container(
  //                     height: 34,
  //                     decoration: BoxDecoration(
  //                         boxShadow: const [
  //                           BoxShadow(
  //                             color: Color(0x29000000),
  //                             blurRadius: 6.0,
  //                           ),
  //                         ],
  //                         border: Border.all(
  //                             width: 1,
  //                             color: jointIndex == 2
  //                                 ? Color(0xff000000)
  //                                 : Color(0xff22263D)),
  //                         color: jointIndex == 2
  //                             ? Color(0xff22263D)
  //                             : Colors.white),
  //                     child: Center(
  //                         child: Padding(
  //                       padding: const EdgeInsets.symmetric(horizontal: 18.0),
  //                       child: Text(
  //                         "Joint",
  //                         style: GoogleFonts.sourceSansPro(
  //                           textStyle: TextStyle(
  //                               color: jointIndex == 2
  //                                   ? Colors.white
  //                                   : Color(0xff22263D),
  //                               fontWeight: FontWeight.w500,
  //                               fontSize: 15),
  //                         ),
  //                       ),
  //                     )),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             _space,
  //             Visibility(
  //               visible: inCheckCancelled,
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     "Cancelled Signed Cheque ",
  //                     style: GoogleFonts.sourceSansPro(
  //                       textStyle: const TextStyle(
  //                           color: Color(0xff22263D),
  //                           fontWeight: FontWeight.w500,
  //                           fontSize: 12),
  //                     ),
  //                   ),
  //                   _space1,
  //                   Container(
  //                       height: 45,
  //                       width: MediaQuery.of(context).size.width,
  //                       decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(5),
  //                         border: Border.all(
  //                             width: 1.1, color: AppColors.borderColor),
  //                       ),
  //                       child: const Padding(
  //                         padding: EdgeInsets.only(left: 14.0, top: 12),
  //                         child: Text(
  //                           "Cancelled signed Cheque.jpg",
  //                           style: TextStyle(
  //                               color: Color(0xff22263D),
  //                               fontWeight: FontWeight.w400,
  //                               fontSize: 15),
  //                         ),
  //                       )),
  //                 ],
  //               ),
  //             ),
  //             _space,
  //             _space,
  //             Padding(
  //               padding: const EdgeInsets.only(bottom: 10.0),
  //               child: InkWell(
  //                 onTap: () async {
  //                   if (ifscCode.text.isNotEmpty &&
  //                       bankAccountNo.text.isNotEmpty &&
  //                       confirmBankAcc.text.isNotEmpty) {
  //                     if (ifscCode.text.isEmpty && ifscCode.text.length < 10) {
  //                       Fluttertoast.showToast(
  //                           msg: "Enter Your Valid IFSC Code");
  //                     } else if (bankAccountNo.text.isEmpty &&
  //                         bankAccountNo.text.length < 10) {
  //                       Fluttertoast.showToast(
  //                           msg: "Enter Your Valid Account Number");
  //                     } else if (bankAccountNo.text.toString() !=
  //                         confirmBankAcc.text.toString()) {
  //                       Fluttertoast.showToast(
  //                           msg: "Account Number does not match");
  //                     } else {
  //                       // final addBankDetailModel = await BankDetailRepository()
  //                       //     .addbankDetails(
  //                       //         ifscCode.text.toString(),
  //                       //         bankAccountNo.text.toString(),
  //                       //         savingIndex,
  //                       //         jointIndex,
  //                       //         );
  //                       // if (addBankDetailModel != "") {
  //                       //   onBank1AddedBottomSheet();
  //                       //   print("===============================done");
  //                       // } else {
  //                       //   print("===============================nothing");
  //                       // }
  //                       setState(() {});
  //                     }
  //                   }
  //                 },
  //                 child: Container(
  //                   height: 45,
  //                   decoration: BoxDecoration(
  //                       boxShadow: const [
  //                         BoxShadow(
  //                           color: Color(0x29000000),
  //                           blurRadius: 3.0,
  //                         ),
  //                       ],
  //                       border: Border.all(
  //                           width: 2,
  //                           color: isBankAdded == false
  //                               ? (ifscCode.text.isNotEmpty &&
  //                                       bankAccountNo.text.isNotEmpty &&
  //                                       confirmBankAcc.text.isNotEmpty)
  //                                   ? AppColors.textColor
  //                                   : Color(0xffE1E0E6)
  //                               : Color(0xffFF405A)),
  //                       color: isBankAdded == false
  //                           ? Colors.white
  //                           : Color(0xffFF405A)),
  //                   child: Center(
  //                       child: Text(
  //                     "Submit",
  //                     style: GoogleFonts.quicksand(
  //                       textStyle: TextStyle(
  //                           color: isBankAdded == false
  //                               ? (ifscCode.text.isNotEmpty &&
  //                                       bankAccountNo.text.isNotEmpty &&
  //                                       confirmBankAcc.text.isNotEmpty)
  //                                   ? AppColors.textColor
  //                                   : Color(0xffE1E0E6)
  //                               : Colors.white,
  //                           fontWeight: FontWeight.w500,
  //                           fontSize: 15),
  //                     ),
  //                   )),
  //                 ),
  //               ),
  //             ),
  //             _space,
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget get _space => const SizedBox(height: 20);

  Widget get _space1 => const SizedBox(height: 3);

  //for bottom sheet

  void onProfilePicVerificationBottomSheet() {
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
                      isAddPersonalDetails = true;
                      profilevisbileTab3 = false;
                      inPersonVerifications = false;
                      profileprofilevisbileTab1 = false;
                      profilevisbileTab2 = false;
                      isMandatory = false;
                      isUpload = false;
                      isSignInDemat = false;
                      isAddressAdd = false;
                      Navigator.pop(context);
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfileAnimation()));
                    Future.delayed(const Duration(seconds: 16), () {
                      setState(() {
                        isBankShowing = true;
                      });
                    });
                  },
                  child: Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.30,
                    decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
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
                        _space,
                        Center(
                          child: Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 28.0),
                            child: Text(
                              "Congratulations! $panName Identity Verification completed Successfully",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.sourceSansPro(
                                textStyle: const TextStyle(
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

  void onOtpAddedBottomSheet() {
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
      builder: (context) =>
          Padding(
            padding: EdgeInsets.only(
                top: 0,
                right: 0,
                left: 0,
                bottom: MediaQuery
                    .of(context)
                    .viewInsets
                    .bottom),
            child: Wrap(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color: AppColors.primaryColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 35,
                          ),
                          RichText(
                            text: TextSpan(children: [
                              const TextSpan(
                                  text:
                                  "Enter the 4 to 6 digits, One Time Password sent on your Email ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
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
                                    color: AppColors.textColor,
                                    letterSpacing: 4),
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
                      const SizedBox(
                        height: 7,
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
                              _resendOTPEmail(
                                  mobNo.toString(), email_id.text.toString(),
                                  true);
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
                      InkWell(
                        onTap: () async {
                          _verifyOTPEmail(
                              email_id.text.toString(),
                              otpdata.text.toString());
                          mail = await HelperFunctions.getEmailId();
                        },
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: Colors.white)),
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
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
    );
  }

  void closeApplicationBottomSheet() {
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
              var height = MediaQuery
                  .of(context)
                  .size
                  .height;
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
                        ConstantImage.profileError,
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
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                );
              });
            },
            onClosing: () {
              exit(0);
            },
          );
        });
  }

  void onEmailAddedBottomSheet() {
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
      builder: (context) =>
          Padding(
            padding: EdgeInsets.only(
                top: 0,
                right: 0,
                left: 0,
                bottom: MediaQuery
                    .of(context)
                    .viewInsets
                    .bottom),
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
                          Form(
                            autovalidateMode: AutovalidateMode.always,
                            key: _formKey,
                            child: TextFormField(
                              validator: (input) =>
                              input!.isValidEmail() ? null : "Invalid email",
                              controller: email_id,
                              keyboardType: TextInputType.emailAddress,
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
                                    color: AppColors.textColor,
                                    letterSpacing: 4),
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    color: Color(0xff22263d), letterSpacing: 4),
                                hintText: "Enter Email id",
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
                            if (_formKey.currentState!.validate()) {
                              if (email_id.text.isNotEmpty) {
                                sendOtp_toEmail(mobNo.toString(),
                                    email_id.text.toString(), false);
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Enter Email First!!");
                              }
                            } else {
                              Fluttertoast.showToast(
                                  msg: "Enter Valid Email ID");
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
                                      textStyle: const TextStyle(
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
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 1.3,
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
                            "Upload $addressProof Scans",
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
                            height: 290,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width / 1.12,
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
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
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
                                                source:
                                                ImageSource.camera,
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
                                          final pickedFile = await _picker
                                              .getImage(
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
                                                  style: ConstStyle
                                                      .quickStandSmall,
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
                            height: 290,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width / 1.12,
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
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
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
                                                source:
                                                ImageSource.camera,
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
                                          final pickedFile = await _picker
                                              .getImage(
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
                                                  style: ConstStyle
                                                      .quickStandSmall,
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
                              bottom: 8.0, left: 20, right: 20),
                          child: Container(
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
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20, top: 20),
                          child: InkWell(
                            onTap: () async {
                              if (frontImage != null && backImage != null) {
                                fileName1 = frontImage!
                                    .path
                                    .split('-')
                                    .last;
                                fileName2 = backImage!
                                    .path
                                    .split('-')
                                    .last;
                                var res = await ProfileRepository().uploadScans(
                                    proofType: addressProof!,
                                    file1: frontImage!,
                                    file2: backImage!);
                                print("resssssssssss  $res");
                                if (res != "") {
                                  setState(() {
                                    Navigator.pop(context);
                                    isScans = false;
                                    isPassportImage = true;
                                  });
                                } else {
                                  Fluttertoast.showToast(
                                      msg: "Something went wrong!");
                                }
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Capture Image First");
                              }
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
        });
  }

  void verifyPanNoBottomSheet() {
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
              return StatefulBuilder(builder: (BuildContext context, State) {
                return GestureDetector(
                  child: Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .width * 0.85,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    color: AppColors.primaryColor,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25, bottom: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                ConstantImage.profile,
                                width: 75,
                                height: 75,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text("Hi [$panName]",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                      color: Colors.white)),
                              _space,
                              _space1,
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    print(
                                        " getPersonalDetail?.isAadharVerified!" +
                                            getPersonalDetail!.isAadharVerified
                                                .toString());
                                    getPersonalDetail?.isAadharVerified != 1
                                        ? isAadhaarVerified = true
                                        : isEditStep12 = true;
                                    print(" isAadhaarVerified" +
                                        isAadhaarVerified.toString());
                                    print(" isEditStep12" +
                                        isEditStep12.toString());
                                    isEditStep1 = false;
                                    isEditStep2 = false;
                                    isPanVerify = false;
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
                                      "I confirm to open the account in the same name of [$panName]",
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
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                                border:
                                Border.all(width: 1, color: Colors.white)),
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

  void ReEnterPanNumberBottomSheet(String msg) {
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
              return StatefulBuilder(builder: (BuildContext context, State) {
                return Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.45,
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
                        ConstantImage.card,
                        width: 75,
                        height: 75,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text("Hi [$userfName $userlName]",
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: Colors.white)),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text("Your PAN is",
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.white)),
                      Text("$msg",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              letterSpacing: 2,
                              color: AppColors.btnColor)),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text("Please provide on valid \nPAN Number",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: Colors.white)),
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                                border:
                                Border.all(width: 1, color: Colors.white)),
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

  void personVerificationBottomSheet() {
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
                    });
                  },
                  child: Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.80,
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
                        Text(
                          "Code Position Examples",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
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
                          height: 200,
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

  void onNameNotMatchedBottomSheet() {
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
                    });
                  },
                  child: Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.60,
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
                          height: 25,
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
                    });
                  },
                  child: Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.90,
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
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 1.12,
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
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width,
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
                                          textStyle: const TextStyle(
                                              color: Color(0xff22263D),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
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
                                        textStyle: const TextStyle(
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
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 8.0, left: 30, right: 30),
                            child: Text(
                              "Note : if you do not have your Cheque book with you for the cancelled cheque, you can upload a copy of your Bank Statement or Bank Passbook ",
                              style: GoogleFonts.sourceSansPro(
                                textStyle: const TextStyle(
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

  void updateGenderBottomSheet() {
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
                bottom: MediaQuery
                    .of(context)
                    .viewInsets
                    .bottom),
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
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 2.4,
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
                              var updateGender = await ProfileRepository()
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
                                  genderIndex: genderIndex,
                                  maritalIndex:
                                  getPersonalDetail!.marriedStatus,
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
                              if (updateGender != "") {
                                getPersonalDetails();
                                openConfirmBottomSheet();
                              } else {
                                Fluttertoast.showToast(
                                    msg: "something went wrong");
                              }
                            },
                            child: Container(
                              height: 45,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 2.4,
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

  void updateMaritalBottomSheet() {
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
                bottom: MediaQuery
                    .of(context)
                    .viewInsets
                    .bottom),
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
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 2.4,
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
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 2.4,
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

  void updateAnnualBottomSheet() {
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
                bottom: MediaQuery
                    .of(context)
                    .viewInsets
                    .bottom),
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
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 2.4,
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
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 2.4,
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

  void updateAddressBottomSheet() {
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
                bottom: MediaQuery
                    .of(context)
                    .viewInsets
                    .bottom),
            child: Wrap(
              children: [
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 1.5,
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
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
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
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
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
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
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
                            width: MediaQuery
                                .of(context)
                                .size
                                .width / 1.12,
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
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
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
                                                  style: ConstStyle
                                                      .quickStandSmall,
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
                            width: MediaQuery
                                .of(context)
                                .size
                                .width / 1.12,
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
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
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
                                                  style: ConstStyle
                                                      .quickStandSmall,
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
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width / 2.4,
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
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width / 2.4,
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

  void updateExperienceBottomSheet() {
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
                bottom: MediaQuery
                    .of(context)
                    .viewInsets
                    .bottom),
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
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 2.4,
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
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 2.4,
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

  void updateMaidenNameBottomSheet() {
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
                bottom: MediaQuery
                    .of(context)
                    .viewInsets
                    .bottom),
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
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 2.4,
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
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 2.4,
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

  void openConfirmBottomSheet() {
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
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.27,
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

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}'
        r'\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

List<CameraDescription> cameras = <CameraDescription>[];
