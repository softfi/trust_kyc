import 'dart:convert';

// import 'package:get/get_connect.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_connect/connect.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:trust_money/api/url_constant.dart';

import '../model/get_personal_detail_response.dart';
import '../screens/auths/sharedPreference.dart';


class APiProvider extends GetConnect {

  Future SignUp(String fname,String lname,String mobno,bool isResendOtp) async {
    final response = await post(Uri.parse(SignUpUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body:  jsonEncode(<String, dynamic>{
        "fname": fname,
        "lname": lname,
        "mobile_number": mobno,
        "resend_otp":isResendOtp
      }),

    ) ;

    print("Here is response body" + response.body.toString());
    if (response.statusCode == 200) {
      return response;
    }else{
      return response;
    }
  }

  Future enterOtp(String otp) async {
    var api = Uri.parse(OtpVerifyUrl);
    Map mapeddate = {
      "otp": otp.toString(),
    };
    final response = await http.post(
      api,
      body: mapeddate,
    );

    print("Here is response body" + response.body.toString());
    if (response.statusCode == 200) {
      return response;
    }
  }

}
