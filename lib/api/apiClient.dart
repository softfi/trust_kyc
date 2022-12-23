import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trust_money/api/trust_kyc_url.dart';
import 'package:trust_money/getx_controller/profile/personal_details_controller.dart';
import 'package:trust_money/model/get_digilocker_response_data.dart';
import 'package:trust_money/model/get_pan_response_data.dart';
import '../getx_controller/ipv/ipv_controller.dart';
import '../getx_controller/kra/kra_controller.dart';
import '../model/bond/bond_details_modal.dart';
import '../model/bond/bond_list_modal.dart';
import '../model/bond/investment_caclulator_modal.dart';
import '../model/code_verification_response_data.dart';
import '../model/digiLocker_response_data.dart';
import '../model/perosnal_details/get_personal_detail_response.dart';
import '../model/profession_response_data.dart';
import '../model/status_bar/progress_status_bar.dart';
import '../utils/helper_widget/custom_snsckbar.dart';
import '../utils/sharedPreference.dart';

class APiProvider extends GetConnect {
  personalDetail() async {
    try {
      var token = await HelperFunctions.getToken();
      debugPrint("======token $token");
      var response =
          await get(TrustKycUrl.baseUrl + TrustKycUrl.personalDetail, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': token,
      });
      debugPrint("======getProfile ${response.statusCode}");
      debugPrint(response.body.toString());
      if (response.statusCode == 200) {
        GetPersonalDetailModel model =
            GetPersonalDetailModel.fromJson(response.body);
        debugPrint("======getProfile1212121 ${response.body.toString()}");
        return model;
      }
    } catch (e) {
      debugPrint("======getProfile122121212 ${e.toString()}");
      ShowCustomSnackBar().ErrorSnackBar(e.toString());
    }
  }

  updatePersonalDeatil() async {
    IPVController _ipvController = Get.put(IPVController());
    PersonalDetailsController _controller =
        Get.put(PersonalDetailsController());
    KRAController _kRAController = Get.put(KRAController());
    var token = await HelperFunctions.getToken();
    String correctedDate =
        "${_controller.currentStartDate.value.day}-${_controller.currentStartDate.value.month}-${_controller.currentStartDate.value.year}";
    debugPrint((_kRAController.maidenName != null)
        ? "${_kRAController.maidenName.value.text}"
        : "");

    var body = {
      "firstname": _controller.firstName.value.text ?? "",
      "lastname": _controller.lastName.value.text ?? "",
      "dob": correctedDate,
      "smart_card_required": 0,
      "smart_card_number": "string",
      "smart_card_PIN": "string",
      "gender": _kRAController.isGenderSelect.value ?? 0,
      "married_status": _kRAController.isMaritalSelect.value ?? 0,
      "mothers_maiden_name": "string",
      "annual_income": _kRAController.isEnComeSelect.value ?? 0,
      "trading_experience": _kRAController.isExperienceSelect.value ?? 0,
      "occupation": "String",
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
      /*_ipvController.fileLink.value ?? */
      "proof_type": "string",
      "proof_front_image": "string",
      "proof_back_image": "string",
      "manager_id": 0,
      "is_politically_exposed": _controller.potentiallyExposedStatusInt.value,
      "filled_itr_last_2years": _kRAController.isRTRInt.value ?? 0,
      "would_you_like_to_activate": _controller.activateFutureInt.value,
      "check_box_share_data_with_company": _controller.isCheckedInt1.value,
      "check_box_share_data_with_govt": _controller.isCheckedInt2.value
    };

    print("_kRAController.maidenName" + body.toString());
    try {
      var response = await http.put(
          Uri.parse("https://trust-api.trustmony.com/api/v1/personal_details"),
          body: jsonEncode(body),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': token,
          });
      var response1 = await put(
          TrustKycUrl.baseUrl + TrustKycUrl.personalDetail, jsonEncode(body),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': token,
          });
      debugPrint("correctedDate ${response.statusCode}");
      debugPrint("correctedDate ${response.body.toString()}");
      var res = jsonDecode(response.body);
      if (response.statusCode == 200) {
        debugPrint("correctedDate1222 ${response.body.toString()}");
        return res["message"];
      } else {
        Get.back();
        ShowCustomSnackBar().ErrorSnackBar(
          res["errors"],
        );
      }
    } catch (e) {
      debugPrint("correctedDate22222 ${e.toString()}");
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
          TrustKycUrl.baseUrl + TrustKycUrl.sentEmailOTP, jsonEncode(body),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': token,
          });
      if (response.statusCode == 200) {
        debugPrint("=======res ${response.body["message"]}");
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

  verifyGoogleGmail() async {
    PersonalDetailsController _controller =
        Get.put(PersonalDetailsController());
    var token = await HelperFunctions.getToken();
    var body = {"email_id": _controller.mail.value, "is_verified": true};
    debugPrint(_controller.mail.value);
    try {
      var response = await post(
          TrustKycUrl.baseUrl + TrustKycUrl.verifyEmail, body,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': token,
          });
      debugPrint("response.statusCode.toString()");
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {
        debugPrint(response.body.toString());
        return true;
      } else {
        return false;
      }
    } catch (e) {
      ShowCustomSnackBar().ErrorSnackBar(e.toString());
    }
  }

  verfiyPanNumber(String PAN) async {
    // PersonalDetailsController _controller = Get.put(PersonalDetailsController());
    var token = await HelperFunctions.getToken();
    debugPrint("======PAN ${token}");
    try {
      var response = await http.get(
          Uri.parse(
              "https://trust-api.trustmony.com/api/v1/pan_verify?pan_no=$PAN"),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': token,
          });
      debugPrint("======PAN ${response.statusCode}");
      if (response.statusCode == 200) {
        PanStatusModel modal =
            PanStatusModel.fromJson(jsonDecode(response.body));
        debugPrint("======PAN12 ${response.body.toString()}");
        return modal;
      }
    } catch (e) {
      debugPrint("======PAN123 ${e.toString()}");
      ShowCustomSnackBar().ErrorSnackBar(e.toString());
    }
  }

  authenticateDigilocker() async {
    try {
      var token = await HelperFunctions.getToken();
      var response = await http.get(
          Uri.parse(
              "https://trust-api.trustmony.com/api/v1/authentication_digilocker?platform=mobile"),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': token,
          });
      debugPrint("response.statusCode " + response.statusCode.toString());
      debugPrint("response.statusCode " + response.body.toString());
      if (response.statusCode == 200) {
        DigiLockerModel model =
            DigiLockerModel.fromJson(jsonDecode(response.body));
        debugPrint("response.statusCode12 " + response.body.toString());
        return model;
      }
    } catch (e) {
      debugPrint("response.statusCode1234 " + e.toString());
      ShowCustomSnackBar().ErrorSnackBar(e.toString());
    }
  }

  digilockerData() async {
    try {
      var token = await HelperFunctions.getToken();
      var response =
          await get(TrustKycUrl.baseUrl + TrustKycUrl.getDigiLocker, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': token,
      });
      debugPrint("=======res ${response.body}");
      debugPrint("=======res ${response.statusCode}");
      if (response.statusCode == 200) {
        DigiLockerDetailModel model =
            DigiLockerDetailModel.fromJson(response.body);
        return model;
      }
    } catch (e) {
      ShowCustomSnackBar().ErrorSnackBar(e.toString());
    }
  }

  getOccupationList() async {
    try {
      List<ProfessionModel> temp = List.empty(growable: true);
      var token = await HelperFunctions.getToken();
      var response =
          await get(TrustKycUrl.baseUrl + TrustKycUrl.profession, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': token,
      });
      debugPrint("000000000000000000000000022323232332323230");
      if (response.statusCode == 200) {
        response.body.forEach((e) {
          temp.add(ProfessionModel.fromJson(e));
        });
        return temp;
      }
    } catch (e) {
      debugPrint(e.toString());
      ShowCustomSnackBar().ErrorSnackBar(e.toString());
    }
  }

  bondList() async {
    try {
      var response = await get(TrustKycUrl.baseUrl +
          TrustKycUrl.bondList +
          "?page_number=1&limit=11");
      if (response != null) {
        if (response.statusCode == 200) {
          AllBondList modal = AllBondList.fromJson((response.body));
          return modal;
        } else {
          ShowCustomSnackBar().ErrorSnackBar(response.statusCode.toString());
        }
      }
    } catch (e) {
      ShowCustomSnackBar().ErrorSnackBar(e.toString());
    }
  }

  getBondDetails(String isisnNo) async {
    try {
      var response = await get(TrustKycUrl.baseUrl +
          TrustKycUrl.specificBondsList +
          "?bond_isin_number=$isisnNo");
      if (response.statusCode == 200) {
        BondDetails modal = BondDetails.fromJson((response.body));
        return modal;
      }
    } catch (e) {
      ShowCustomSnackBar().ErrorSnackBar(e.toString());
    }
  }

  getIPVCode() async {
    try {
      var token = await HelperFunctions.getToken();
      var response = await get(
          TrustKycUrl.baseUrl + TrustKycUrl.getVideoVerificationCode,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': token,
          });
      if (response.statusCode == 200) {
        CodeVerificationModel model =
            CodeVerificationModel.fromJson(response.body);
        return model;
      }
    } catch (e) {
      ShowCustomSnackBar().ErrorSnackBar(e.toString());
    }
  }

  getInvestmentCalculatonResult(String isinNo, int bondNo) async {
    try {
      var response = await get(TrustKycUrl.baseUrl +
          TrustKycUrl.inestmentCalculator +
          "?isin=$isinNo&number_of_bonds=$bondNo");
      if (response.statusCode == 200) {
        InvestmentCalculatorModal modal =
            InvestmentCalculatorModal.fromJson(response.body);
        return modal;
      }
    } catch (e) {
      ShowCustomSnackBar().ErrorSnackBar(e.toString());
    }
  }

  updateprogressbar(String barStatus) async {
    debugPrint("=======res $barStatus");
    var token = await HelperFunctions.getToken();
    var body = {
      "kyc_progressbar_status_id": barStatus,
    };
    try {
      debugPrint("=======res ${TrustKycUrl.updateBarStatus}");
      var response = await put(TrustKycUrl.updateBarStatus, body, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': token,
      });
      debugPrint("=======res ${response.body}");
      debugPrint("=======res ${response.statusCode}");
      if (response.statusCode == 200) {
        debugPrint("=======res ${response.body["message"]}");
        return response.body["message"];
      }
    } catch (e) {
      ShowCustomSnackBar().ErrorSnackBar(e.toString());
    }
  }

  getProgressBar() async {
    var token = await HelperFunctions.getToken();
    try {
      var response = await get(TrustKycUrl.updateBarStatus, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': token,
      });
      debugPrint("=======res1 ${response.body}");
      debugPrint("=======res1 ${response.statusCode}");
      if (response.statusCode == 200) {
        StatusBarModel model = StatusBarModel.fromJson(response.body);
        return model;
      }
    } catch (e) {
      ShowCustomSnackBar().ErrorSnackBar(e.toString());
    }
  }
}
