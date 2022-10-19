import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:trust_money/api/url_constant.dart';
import 'package:trust_money/screens/auths/alright_screent.dart';
import 'package:trust_money/screens/auths/sign_in.dart';
import 'package:trust_money/utils/strings.dart';
import '../../repositories/veriify_otp_repository.dart';
import '../../utils/colorsConstant.dart';
import '../../utils/images.dart';
import '../../utils/styles.dart';

class OTPLoginVerify extends StatefulWidget {
  OTPLoginVerify(this.phoneNumber, this.haskkey);
  String  phoneNumber, haskkey;

  @override
  _OTPLoginVerifyState createState() => _OTPLoginVerifyState();
}

class _OTPLoginVerifyState extends State<OTPLoginVerify> {
  String? OTP;
  final otplogin = TextEditingController();
  bool spring = false;
  bool disableOtp = false;
  bool value = false;
  bool isDisable = false;
  bool isButtonClick = false;
  String? phone;
  late Map resopnsmap;
  bool isResendOtp = true;
  String? FirstName, HashKey;
  int secondsRemaining = 30;
  bool enableResend = false;
  Timer? timer;
  bool isResend = false;
  bool isTimer = true;

  void _resendCode() {
    setState(() {
      secondsRemaining = 30;
      enableResend = false;
    });
  }


  verifyotplogin() async {
    if (otplogin.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter otp first');
      return;
      } else {
      final res = await verifyOtps().verifyOtpLogin(widget.phoneNumber, otplogin.text, widget.haskkey);
      if (res != null) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const AllRight()));
      }
    }
  }

  void _resendOTPLogin(String mobno, ResendOtp) async {
    print('start working resend  login otp');
    try {
      Response response = await post(
        Uri.parse(LoginOtp),
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
        Fluttertoast.showToast(msg: 'OTP Resend Successfully');
      } else if (response.statusCode != 200) {
        print("Registration failed");
        Fluttertoast.showToast(msg: collectUseData['errors'].toString());
      }
    } catch (e) {
      print(e.toString());
    }
    // Do something
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
                  ),
                ),
                SizedBox(
                  height: height * 0.035,
                ),
                Center(
                  child: Text(
                    "Welcome Back,Log In",
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
                    const TextSpan(
                        text: Strings.otp_text,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Color(0xff22263D))),
                    TextSpan(
                        text: "+91 ${widget.phoneNumber}",
                        style: const TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 4,
                            fontSize: 18,
                            color: Color(0xffFF405A))),
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: InkWell(onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const SignIn()));
                        },
                          child: const Image(
                            image: AssetImage(
                              ConstantImage.edit,
                            ),
                            color: Color(0xffFF405A),
                            height: 20,
                            width: 20,
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
                        if(otplogin.text.length<4){
                          isDisable = false;
                        }else{
                          isDisable = true;
                        }
                      });
                    },
                    controller: otplogin,
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
                   /* disableOtp
                        ? InkWell(
                      onTap: () {
                        _resendOTPLogin(
                            widget.phoneNumber, isResendOtp);
                        setState(() {
                          disableOtp = false;
                        });
                        disableOtpButton();
                      },
                      child: Container(
                        height: 27,
                        width: 90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: AppColors.borderColor),
                        child: Center(
                            child: Text(
                              "Resend OTP",
                              style: ConstStyle.quickStandSmall,
                            )),
                      ),
                    )
                        : Container(
                      height: 27,
                      width: 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: Color(0x00000029)),
                      child: Center(
                          child: Text(
                            "Resend OTP",
                            style: ConstStyle.quickStandSmall,
                          )),
                    ),*/
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0,),
              child: InkWell(
                onTap: () {
                  if (isDisable == true) {
                    verifyotplogin();
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
            ),
          ],
        ),
      ),
    );
  }

  Widget get _space => const SizedBox(height: 20);

  Widget get _space1 => const SizedBox(height: 8);
}
