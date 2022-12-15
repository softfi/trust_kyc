import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trust_money/api/trust_kyc_url.dart';
import 'package:trust_money/getx_controller/personal_details_controller.dart';
import 'package:trust_money/model/get_pan_response_data.dart';
import '../model/perosnal_details/get_personal_detail_response.dart';
import '../utils/sharedPreference.dart';

class APiProvider extends GetConnect {
  personalDetail() async {
    try {
      var token = await HelperFunctions.getToken();
      var response =
          await get(TrustKycUrl.baseUrl + TrustKycUrl.personalDetail, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': token,
      });
      if (response.statusCode == 200) {
        GetPersonalDetailModel model =
            GetPersonalDetailModel.fromJson(response.body);
        return model;
      }
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        messageText: Text(e.toString()),
      ));
    }
  }

// verifyEmail()async{
//   var token = await HelperFunctions.getToken();
//   try {
//     var response = await get(TrustKycUrl.verifyEmail, headers: {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       'Authorization': 'API Key $token',
//     },);
//     if (response.statusCode == 200) {
//       GetPersonalDetailModel model = getPersonalDetailModelFromJson(response.body);
//       debugPrint("========21 $model");
//       return model;
//     }
//   } catch (e) {
//     Get.showSnackbar(GetSnackBar(
//       title: e.toString(),
//     ));
//   }
//
// }
  updatePersonalDeatil() async {
    PersonalDetailsController _controller =
        Get.put(PersonalDetailsController());
    var token = await HelperFunctions.getToken();
    String correctedDate =
        "${_controller.currentStartDate.value.day}-${_controller.currentStartDate.value.month}-${_controller.currentStartDate.value.year}";
    debugPrint(correctedDate);
    var body = {
      "firstname": "${_controller.firstName.value.text}",
      "lastname": "${_controller.lastName.value.text}",
      "dob": "$correctedDate",
      "smart_card_required": 0,
      "smart_card_number": "string",
      "smart_card_PIN": "string",
      "gender": 0,
      "married_status": 0,
      "mothers_maiden_name": "string",
      "annual_income": 0,
      "trading_experience": 0,
      "occupation": "string",
      "lifestyle": "string",
      "geogriphical_code": "string",
      "education_degree": "string",
      "address_line_1": "string",
      "address_line_2": "string",
      "address_line_3": "string",
      "address_zip": "string",
      "address_state_code": "string",
      "address_state": "string",
      "address_city": "string",
      "city_sequence_no": "string",
      "family_account": "string",
      "mental_disability": "string",
      "profile_image": "string",
      "verification_video": "string",
      "proof_type": "string",
      "proof_front_image": "string",
      "proof_back_image": "string",
      "manager_id": 0,
      "is_politically_exposed": _controller.potentiallyExposedStatusInt.value,
      "filled_itr_last_2years": 0,
      "would_you_like_to_activate": _controller.activateFutureInt.value,
      "check_box_share_data_with_company": _controller.isCheckedInt1.value,
      "check_box_share_data_with_govt": _controller.isCheckedInt2.value
    };
    try {
      var response = await put(
          TrustKycUrl.baseUrl + TrustKycUrl.personalDetail, body,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': token,
          });
      // var temp=json.decode(response.body);
      // debugPrint(temp.toString());
      if (response.statusCode == 200) {
        // var temp=jsonDecode(response.body);
        return response.body["message"];
      } else {
        Get.back();
        Get.showSnackbar(
          GetSnackBar(
            messageText: Text(
              response.body["errors"],
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        messageText: Text(e.toString()),
      ));
    }
  }

  SendKycEmailOtp(String email, bool isResend) async {
    PersonalDetailsController _controller =
        Get.put(PersonalDetailsController());
    var token = await HelperFunctions.getToken();
    try {
      var body = {
        "mobile_number": _controller.mobileNumber.value,
        "email_id": email,
        "resend_otp": isResend
      };

      var response = await post(
          TrustKycUrl.baseUrl + TrustKycUrl.sentEmailOTP, body,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': token,
          });
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {
        return response.body["message"];
      }
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: Colors.red,
        messageText: Text(
          e.toString(),
          style: TextStyle(color: Colors.white),
        ),
      ));
    }
  }

  verifyOtp(String email, String otp) async {
    var token = await HelperFunctions.getToken();
    debugPrint("$email  $otp");
    var body = {"email_id": email, "otp": otp};
    try {
      var response = await post(
          TrustKycUrl.baseUrl + TrustKycUrl.verifyEmailOtp, body,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': token,
          });
      debugPrint(response.body.toString());
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {
        if (response.body["is_email_verified"] == 1) {
          return response.body["message"];
        }
      } else {
        Get.showSnackbar(GetSnackBar(
          messageText: Text(response.body["message"]),
        ));
      }
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
        messageText: Text(
          e.toString(),
          style: TextStyle(color: Colors.white),
        ),
      ));
    }
  }

  verfiyPanNumber() async {
    PersonalDetailsController _controller =
        Get.put(PersonalDetailsController());
    var token = await HelperFunctions.getToken();
    try {
      var response = await get(
          TrustKycUrl.baseUrl +
              TrustKycUrl.getPANCard +
              "?pan_no=${_controller.panNumber.value}",
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': token,
          });
      if(response.statusCode==200){
        PanStatusModel modal=PanStatusModel.fromJson(response.body);
        return modal;
      }else{
        Get.showSnackbar(GetSnackBar(
          messageText: Text(response.body["message"]),
        ));
      }
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
        messageText: Text(
          e.toString(),
          style: TextStyle(color: Colors.white),
        ),
      ));
    }
  }
}
