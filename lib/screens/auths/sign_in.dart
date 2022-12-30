import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:trust_money/utils/sharedPreference.dart';
import 'package:trust_money/screens/auths/sign_up.dart';
import 'package:trust_money/screens/auths/verify_login_otp.dart';
import 'package:trust_money/utils/colorsConstant.dart';
import 'package:trust_money/utils/images.dart';
import '../../api/trust_kyc_url.dart';
import '../../utils/helper_widget/custom_snsckbar.dart';
import '../../utils/styles.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isResendOtp = true;
  bool isButtonClick = false;
  bool isDisable = false;
  late Map resopnsmap;
  final loginphone = TextEditingController();

  void _signIn(String mobno, ResendOtp) async {
    print('start working');
    try {
      Response response = await post(
        Uri.parse(TrustKycUrl.verifyEmail),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "mobile_number": mobno,
          "resend_otp": isResendOtp
        }),
      );
      // JsonDecoder _decoder = new JsonDecoder();
      // dynamic collectUseData = _decoder.convert(response.body);
      resopnsmap = json.decode(response.body);
      print(resopnsmap['hash_key'].toString());
      print(resopnsmap['message'].toString());
      print("StatusCode" + response.statusCode.toString());
      if (response.statusCode == 200) {
        print(response.statusCode.toString());
        await HelperFunctions.savePhoneNumber(loginphone.text.toString());
        await HelperFunctions.savehashkey(resopnsmap['hash_key'].toString());
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return OTPLoginVerify(mobno, resopnsmap['hash_key'].toString());
        }));
      } else if (response.statusCode > 201) {
        if (resopnsmap['errors'].toString() == "mobile number already register please login") {
          ShowCustomSnackBar().ErrorSnackBar("mobile number already register please login");
        }
        ShowCustomSnackBar().ErrorSnackBar(resopnsmap['errors'].toString());
      }
    } catch (e) {
      print(e.toString());
    }
    // Do something
  }

  signInValidation() async {
    if (loginphone.text.isEmpty) {
      ShowCustomSnackBar().ErrorSnackBar("Please enter Mobile No");
      return;
    } else if (loginphone.text.toString().length < 10) {
      ShowCustomSnackBar().ErrorSnackBar("Enter 10 digit mobile number");
      return;
    } else {
      _signIn(loginphone.text.toString(), isResendOtp);
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
                  child: Image.asset(ConstantImage.TrustIcon,
                    height: 100,
                  ),
                ),
                _space1,
                Center(
                  child: Text(
                    "Welcome Back, Sign In",
                    style: ConstStyle.quickStandBold,
                  ),
                ),
                SizedBox(
                  height: height * 0.060,
                ),
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
                      onChanged: (text) {
                        setState(() {
                          if(loginphone.text.length<10){
                            isDisable = false;
                          }else{
                            isDisable = true;
                          }
                        });
                      },
                      validator: (value) {
                        if (value == null || loginphone.text.length<10) {
                          return 'Enter 10 Digit mobile number.';
                        }
                        return null;
                      },
                      flagsButtonPadding: EdgeInsets.only(left: 10),
                      dropdownIconPosition: IconPosition.trailing,
                      dropdownTextStyle: ConstStyle.sourceSans5,
                      dropdownIcon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.grey,
                      ),
                      controller: loginphone,
                      style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                            color: Color(0xff22263D), fontWeight: FontWeight.w400, fontSize: 18,letterSpacing: 4),
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
                        ),),
                        contentPadding: const EdgeInsets.only(top: 15),
                        hintText: 'Mobile Number',
                        hintStyle: const TextStyle(color: Color(0xffC8C7CE)),
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
                      ),
                      initialCountryCode: 'IN',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height / 2.2,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 18.0,left: 12,right: 12),
              child: InkWell(
                onTap: () {
                  if (isDisable == true) {
                    signInValidation();
                    setState(() {
                      isButtonClick = true;
                    });
                  }
                },
                child:Container(
                  height: 45,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x29000000),
                        blurRadius: 3.0,
                      ),
                    ],
                    border: Border.all(width: 2, color:isButtonClick == false
                        ? isDisable
                        ? AppColors.textColor
                        : Color(0xffE1E0E6)
                        : Color(0xffFF405A)),
                    color: isButtonClick == false
                        ? Colors.white
                        : Color(0xffFF405A),
                  ),
                  child: Center(
                      child: Text(
                        "Verify",
                        style: GoogleFonts.quicksand(
                          textStyle: TextStyle(
                              color: isButtonClick == false
                                  ? isDisable
                                  ? AppColors.textColor
                                  : Color(0xffE1E0E6)
                                  : Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15
                          ),
                        ),
                      )),
                ),
              ),
              /*InkWell(
                onTap: () {
                  signInValidation();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                  ),
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: 2, color: AppColors.textColor)),
                    child: Center(
                        child: Text(
                      "Sign In",
                      style: ConstStyle.quickStandBtn,
                    )),
                  ),
                ),
              ),*/
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignUp()));
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Center(
                  child: RichText(
                    text: const TextSpan(children: [
                      TextSpan(
                          text: "Don't have account  ",
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
