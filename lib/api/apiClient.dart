import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trust_money/api/trust_kyc_url.dart';
import 'package:trust_money/getx_controller/personal_details_controller.dart';
import 'package:trust_money/model/get_pan_response_data.dart';
import '../model/perosnal_details/get_personal_detail_response.dart';
import '../utils/helper_widget/custom_snsckbar.dart';
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
      ShowCustomSnackBar().ErrorSnackBar(e.toString());
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
      if (response.statusCode == 200) {
        return response.body["message"];
      } else {
        Get.back();
       ShowCustomSnackBar().ErrorSnackBar(  response.body["errors"],);
      }
    } catch (e) {
     ShowCustomSnackBar().ErrorSnackBar(e.toString());
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
      if (response.statusCode == 200) {
        return response.body["message"];
      }
    } catch (e) {
     ShowCustomSnackBar().ErrorSnackBar(e.toString());
    }
  }

  verifyOtp(String email, String otp) async {
    var token = await HelperFunctions.getToken();
    var body = {"email_id": email, "otp": otp};
    try {
      var response = await post(
          TrustKycUrl.baseUrl + TrustKycUrl.verifyEmailOtp, body,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': token,
          });
      if (response.statusCode == 200) {
        if (response.body["is_email_verified"] == 1) {
          await HelperFunctions.saveEmail(response.body["email_id"].toString());
          return response.body["message"];
        }
      } else {
        ShowCustomSnackBar().ErrorSnackBar(response.body["message"]);
      }
    } catch (e) {
     ShowCustomSnackBar().ErrorSnackBar(e.toString());
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
              "?pan_no=${_controller.panNumber.value.text}",
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': token,
          });
      if(response.statusCode==200){
        PanStatusModel modal=PanStatusModel.fromJson(response.body);
        return modal;
      }else{
        ShowCustomSnackBar().ErrorSnackBar(response.body["message"].toString());
      }
    } catch (e) {
     ShowCustomSnackBar().ErrorSnackBar(e.toString());
    }
  }
}
