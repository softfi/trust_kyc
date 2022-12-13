import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:logging/logging.dart';
import 'package:trust_money/screens/auths/sign_in.dart';
import 'package:trust_money/screens/auths/verify_otp.dart';
import 'package:trust_money/utils/colorsConstant.dart';
import 'package:trust_money/utils/images.dart';
import 'package:trust_money/utils/strings.dart';
import '../../repositories/login_repository.dart';
import '../../utils/styles.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final logger = Logger("LoginStateNotifier");
  bool isChecked = false;
  bool isChecked1 = false;
  bool isChecked2 = false;
  int partnerInt = 0;
  bool isLoader = false;
  bool isButtonClick = false;
  late Map resopnsmap;
  final phoneNumber = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();

  Future<void> sendOTP(String fname, String lname, String mob, int part) async {
    try {
      final signUpModel = await LoginRepository().sendOtp(
          fname.toString(), lname.toString(), mob.toString(), false, part);
      if (signUpModel != null && signUpModel != "") {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return OtpVerification(
            phoneNumber: phoneNumber.text.toString(),
          );
        }));
      }
    } catch (e) {
      logger.warning(e.toString());
      SnackBar(content: Text(e.toString()));
    }
  }

  signUpValidation() async {
    if (firstName.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter first name');
      return;
    } else if (lastName.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter last name');
      return;
    } else if (phoneNumber.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter mobile number');
      return;
    } else if (phoneNumber.text.toString().length < 10) {
      Fluttertoast.showToast(msg: 'Enter 10 digit mobile number');
      return;
    } else if (isChecked != true && isChecked2 != true) {
      Fluttertoast.showToast(msg: 'Check term & conditions!');
    } else {
      sendOTP(firstName.text.toString(), lastName.text.toString(),
          phoneNumber.text.toString(), partnerInt);
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _space,
                _space,
                Center(
                  child: Image.asset(
                    ConstantImage.TrustIcon,
                    height: 100,
                  ),
                ),
                _space1,
                Center(
                  child: Text(
                    "Sign Up",
                    style: ConstStyle.quickStandBold,
                  ),
                ),
                SizedBox(
                  height: height * 0.052,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    "First Name*",
                    style: ConstStyle.sourceSansPro,
                  ),
                ),
                _space1,
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                  ),
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border:
                          Border.all(width: 1, color: AppColors.borderColor),
                    ),
                    child: TextField(
                      controller: firstName,
                      autofocus: false,
                      style: ConstStyle.sourceSans5,
                      textCapitalization: TextCapitalization.words,
                      decoration: const InputDecoration(
                        hintText: "First Name",
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
                _space1,
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                  ),
                  child: Text(
                    "Last Name*",
                    style: ConstStyle.sourceSansPro,
                  ),
                ),
                _space1,
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                  ),
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border:
                          Border.all(width: 1, color: AppColors.borderColor),
                    ),
                    child: TextField(
                      controller: lastName,
                      autofocus: false,
                      style: ConstStyle.sourceSans5,
                      textCapitalization: TextCapitalization.words,
                      decoration: const InputDecoration(
                        hintText: "Last Name",
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
                _space1,
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                  ),
                  child: Text(
                    "Mobile Number*",
                    style: ConstStyle.sourceSansPro,
                  ),
                ),
                _space1,
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                  ),
                  child: SizedBox(
                    height: 65,
                    child: IntlPhoneField(
                      disableLengthCheck: true,
                      invalidNumberMessage: "",
                      flagsButtonPadding: EdgeInsets.only(left: 10),
                      dropdownIconPosition: IconPosition.trailing,
                      dropdownIcon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.grey,
                      ),
                      validator: (value) {
                        if (value == null || phoneNumber.text.length < 10) {
                          return 'Enter 10 Digit mobile number.';
                        }
                        return null;
                      },
                      controller: phoneNumber,
                      dropdownTextStyle: ConstStyle.sourceSans5,
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                            color: Color(0xff22263D),
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            letterSpacing: 4),
                      ),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                      ],
                      decoration: InputDecoration(
                        focusedErrorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                          color: AppColors.borderColor,
                          width: 1,
                        )),
                        disabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                          color: AppColors.borderColor,
                          width: 1,
                        )),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.borderColor,
                            width: 1,
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.borderColor,
                            width: 1,
                          ),
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.borderColor,
                            width: 1,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.borderColor,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                        contentPadding: const EdgeInsets.only(top: 15),
                        hintText: 'Mobile Number',
                        hintStyle: const TextStyle(color: Color(0xffC8C7CE)),
                      ),
                      initialCountryCode: 'IN',
                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.092,
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
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: SizedBox(
                          width: width / 1.3,
                          child: RichText(
                            text: const TextSpan(children: [
                              TextSpan(
                                  text: Strings.check_box_text1,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff22263D))),
                              TextSpan(
                                  text: Strings.calls,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xffFF405A))),
                              TextSpan(
                                  text: Strings.etc,
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
                        value: isChecked1,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked1 = value!;
                            partnerInt = 1;
                            print("=======int $partnerInt");
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: SizedBox(
                          width: width / 1.3,
                          child: RichText(
                            text: const TextSpan(children: [
                              TextSpan(
                                  text:
                                      "I Give Consent To Share My Details With Partner Companies, ",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff22263D))),
                              TextSpan(
                                  text:
                                      "“Trust Capital Services India Pvt Ltd”, “Trust Financial Consultancy Services Pvt. Ltd”, “Trust Investment Advisors Pvt. Ltd”.",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xffFF405A))),
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
                      activeColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      value: isChecked2,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked2 = value!;
                        });
                      },
                    ),
                    SizedBox(
                      width: width / 1.3,
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
              ],
            ),
            _space,
            InkWell(
              onTap: () {
                if (isChecked == true &&
                    isChecked2 == true &&
                    firstName.text.isNotEmpty &&
                    lastName.text.isNotEmpty &&
                    phoneNumber.text.isNotEmpty) {
                  signUpValidation();
                  setState(() {
                    isButtonClick = true;
                  });
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
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
                        color: isButtonClick == false
                            ? (isChecked &&
                                    isChecked2 &&
                                    firstName.text.isNotEmpty &&
                                    lastName.text.isNotEmpty &&
                                    phoneNumber.text.isNotEmpty)
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
                    style: GoogleFonts.quicksand(
                      textStyle: TextStyle(
                          color: isButtonClick == false
                              ? (isChecked &&
                                      isChecked2 &&
                                      firstName.text.isNotEmpty &&
                                      lastName.text.isNotEmpty &&
                                      phoneNumber.text.isNotEmpty)
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
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignIn()));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 30),
                child: Center(
                  child: RichText(
                    text: const TextSpan(children: [
                      TextSpan(
                          text: "Already Sign In  ",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff22263D))),
                      TextSpan(
                          text: "Click here",
                          style: TextStyle(
                              fontSize: 13,
                              decoration: TextDecoration.underline,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffFF405A))),
                    ]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _space => const SizedBox(height: 15);

  Widget get _space1 => const SizedBox(height: 5);
}
