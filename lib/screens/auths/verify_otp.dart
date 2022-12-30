import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:trust_money/screens/auths/alright_screent.dart';
import 'package:trust_money/screens/auths/choose_screen.dart';
import 'package:trust_money/utils/sharedPreference.dart';
import 'package:trust_money/screens/auths/sign_up.dart';
import 'package:trust_money/utils/strings.dart';
import '../../api/trust_kyc_url.dart';
import '../../repositories/login_repository.dart';
import '../../utils/colorsConstant.dart';
import '../../utils/helper_widget/custom_snsckbar.dart';
import '../../utils/images.dart';
import '../../utils/styles.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);
  final String phoneNumber;

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  final otpText = TextEditingController();
  bool spring = false;
  bool isButtonClick = false;
  bool isDisable = false;
  late Map resopnsmap;
  bool isResendOtp = true;
  String? hashKey;
  int secondsRemaining = 30;
  bool enableResend = false;
  Timer? timer;
  bool isResend = false;
  bool isTimer = true;

  void _resendOTPLogin(String mobno, ResendOtp) async {
    print('start working resend  login otp');
    try {
      var response = await post(
        Uri.parse(TrustKycUrl.verifyEmail),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "mobile_number": mobno,
          "resend_otp": isResendOtp
        }),
      );

      JsonDecoder _decoder = new JsonDecoder();
      dynamic collectUseData = _decoder.convert(response.body);
      resopnsmap = json.decode(response.body);
      if (response.statusCode == 200) {
        ShowCustomSnackBar().SuccessSnackBar("OTP Resend Successfully");
      } else if (response.statusCode != 200) {
        print("Registration failed");
        ShowCustomSnackBar().ErrorSnackBar(collectUseData['errors'].toString());

        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=> SignUpWidget() ));

      }
    } catch (e) {
      print(e.toString());
    }
    // Do something
  }

  checkValidation() async {
    hashKey = await HelperFunctions.getHashKey();
    if (otpText.text.isEmpty) {
      ShowCustomSnackBar().ErrorSnackBar("Please enter your OTP");
      return;
    } else {
      final otpVerifyModel = await LoginRepository().verifyOTP(
          widget.phoneNumber.toString(),
          otpText.text.toString(),
          hashKey.toString());
      if (otpVerifyModel != "" && otpVerifyModel != null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => ChooseScreen()), (e) => false);

        final userID = otpVerifyModel.customerId.toString();
        final firstName = otpVerifyModel.firstName.toString();
        final lastName = otpVerifyModel.lastName.toString();
        await HelperFunctions.saveFirstName(firstName);
        await HelperFunctions.saveLastName(lastName);
        await HelperFunctions.saveCustomerID(userID);
        await HelperFunctions.savePhoneNumber(widget.phoneNumber.toString());
      }
    }
  }

  void _resendCode() {
    setState(() {
      secondsRemaining = 30;
      enableResend = false;
    });
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
          isResend = true;
          isTimer = false;
        });
      }
    });
  }

  @override
  dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                _space,
                _space1,
                Center(
                  child: Image.asset(
                    ConstantImage.TrustIcon,
                    height: 100,
                    width: 100,
                  ),
                ),
                SizedBox(
                  height: height * 0.038,
                ),
                Center(
                  child: Text(
                    "Mobile Verification",
                    style: ConstStyle.quickStandBold,
                  ),
                ),
                _space,
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: Strings.otp_text, style: ConstStyle.sourceSans),
                    TextSpan(
                        text: "+91 ${widget.phoneNumber}",
                        style: ConstStyle.sourceSans112),
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUp()));
                          },
                          child: const Image(
                            image: AssetImage(
                              ConstantImage.edit,
                            ),
                            color: Color(0xffFF405A),
                            height: 18,
                            width: 18,
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
                _space,
                _space1,
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(width: 1, color: AppColors.borderColor),
                  ),
                  child: TextField(
                    onChanged: (text) {
                      setState(() {
                        if (otpText.text.length < 4) {
                          isDisable = false;
                        } else {
                          isDisable = true;
                        }
                      });
                    },
                    controller: otpText,
                    keyboardType: TextInputType.number,
                    autofocus: false,
                    style: ConstStyle.sourceSans122,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(6),
                    ],
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter OTP",
                      hintStyle: TextStyle(color: Color(0xffC8C7CE)),
                      fillColor: Colors.white,
                      contentPadding:
                          EdgeInsets.only(left: 14.0, bottom: 7.0, top: 5.0),
                    ),
                  ),
                ),
                _space1,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Strings.not_get,
                      style: ConstStyle.sourceSans2,
                    ),
                    /* isResend? InkWell(
                      onTap: () {
                        _resendOTPLogin(widget.phoneNumber, isResendOtp);
                        setState(() {
                          isResend=false;
                        });
                        disableOtpButton();
                      },
                      child: Container(
                        height: 27,
                        width: 90,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x00000029),
                              blurRadius: 2.0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(2),
                          color:  AppColors.borderColor,),
                        child: Center(
                            child: Text(
                              "Resend OTP",
                              style: ConstStyle.quickStandSmall,
                            )),
                      ),
                    ):*/


                    Row(
                      children: [
                        Visibility(
                          visible: isResend,
                          child: InkWell(
                            onTap: () {
                              _resendOTPLogin(widget.phoneNumber, isResendOtp);
                              setState(() {
                                enableResend ? _resendCode() : null;
                                isTimer = true;
                                isResend = false;
                              });
                            },
                            child: Container(
                              height: 27,
                              width: 90,
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x00000029),
                                      blurRadius: 2.0,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(2),
                                  color: AppColors.textColor),
                              child: Center(
                                  child: Text(
                                "Resend OTP",
                                style: ConstStyle.quickStandSmall,
                              )),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: isTimer,
                          child: Text(
                            "Get in $secondsRemaining Seconds",
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: InkWell(
                onTap: () {
                  if (isDisable == true) {
                    checkValidation();
                    setState(() {
                      isButtonClick = true;
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
                        color: isButtonClick == false
                            ? isDisable
                                ? AppColors.textColor
                                : const Color(0xffE1E0E6)
                            : const Color(0xffFF405A)),
                    color: isButtonClick == false
                        ? Colors.white
                        : const Color(0xffFF405A),
                  ),
                  child: Center(
                      child: Text(
                    "Verify",
                    style: GoogleFonts.quicksand(
                      textStyle: TextStyle(
                          color: isButtonClick == false
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
          ],
        ),
      ),
    );
  }

  Widget get _space => const SizedBox(height: 20);

  Widget get _space1 => const SizedBox(height: 8);
}
