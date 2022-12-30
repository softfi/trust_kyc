import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trust_money/api/trust_kyc_url.dart';
import 'package:trust_money/getx_controller/profile/personal_details_controller.dart';
import 'package:trust_money/model/all_demat_response_data.dart';
import 'package:trust_money/model/get_digilocker_response_data.dart';
import 'package:trust_money/model/get_pan_response_data.dart';
import 'package:trust_money/screens/kyc/profile/digilocker/kra_record.dart';
import '../getx_controller/demat/demat_controller.dart';
import '../getx_controller/ipv/ipv_controller.dart';
import '../getx_controller/kra/kra_controller.dart';
import '../getx_controller/profile/add_nominee_controller.dart';
import '../model/add_nominee_response_data.dart';
import '../model/bond/bond_detail_modal_of_ipo_by_bond_id.dart';
import '../model/bond/bond_details_modal.dart';
import '../model/bond/bond_list_modal.dart';
import '../model/bond/investment_caclulator_modal.dart';
import '../model/code_verification_response_data.dart';
import '../model/digiLocker_response_data.dart';
import '../model/perosnal_details/get_personal_detail_response.dart';
import '../model/perosnal_details/nominee_details_response.dart';
import '../model/profession_response_data.dart';
import '../model/status_bar/progress_status_bar.dart';
import '../screens/animated_screens/verified_animation.dart';
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
    AddNomineeController _addNomineeController =
        Get.put(AddNomineeController());
    var token = await HelperFunctions.getToken();
    String correctedDate =
        "${_controller.currentStartDate.value.day}-${_controller.currentStartDate.value.month}-${_controller.currentStartDate.value.year}";
    debugPrint("correctedDate $correctedDate");
    var body = {
      "firstname": _controller.firstName.value.text ?? "",
      "lastname": _controller.lastName.value.text ?? "",
      "dob": correctedDate,
      "smart_card_required": 0,
      "smart_card_number": "",
      "smart_card_PIN": "",
      "gender": _kRAController.isGenderSelect.value ?? 0,
      "married_status": _kRAController.isMaritalSelect.value ?? 0,
      "mothers_maiden_name": _kRAController.maidenName.value.text ?? "",
      "annual_income": _kRAController.isEnComeSelect.value ?? 0,
      "trading_experience": _kRAController.isExperienceSelect.value ?? 0,
      "occupation": _kRAController.professionId.value ?? 0,
      "lifestyle": "",
      "geogriphical_code": "",
      "education_degree": "",
      "address_line_1": _kRAController.isAddressAdd.value
          ? _kRAController.addressline1.value.text
          : _kRAController.digiLockerDetailModel.value != null
              ? _kRAController.digiLockerDetailModel.value!.landmark
              : "",
      "address_line_2": _kRAController.isAddressAdd.value
          ? _kRAController.addressline2.value.text
          : _kRAController.digiLockerDetailModel.value != null
              ? _kRAController.digiLockerDetailModel.value!.location
              : "",
      "address_line_3": _kRAController.isAddressAdd.value
          ? ""
          : _kRAController.digiLockerDetailModel.value != null
              ? _kRAController.digiLockerDetailModel.value!.villageTownCity
              : "",
      "address_zip": _kRAController.isAddressAdd.value
          ? _kRAController.pinCode.value.text
          : _kRAController.digiLockerDetailModel.value != null
              ? _kRAController.digiLockerDetailModel.value!.pincode
              : "",
      "address_state_code": "",
      "address_state": _kRAController.isAddressAdd.value
          ? _kRAController.selectedSate.value
          : _kRAController.digiLockerDetailModel.value != null
              ? _kRAController.digiLockerDetailModel.value!.state
              : "",
      "address_city": _kRAController.isAddressAdd.value
          ? _kRAController.selectedCity.value
          : _kRAController.digiLockerDetailModel.value != null
              ? _kRAController.digiLockerDetailModel.value!.district
              : "",
      "city_sequence_no": "",
      "family_account": "",
      "mental_disability": "",
      "profile_image": "",
      "verification_video": _ipvController.fileLink.value,
      "proof_type":
          _addNomineeController.selectedNomonneeIdentificationId.value,
      "proof_front_image": await HelperFunctions.getFrontImage(),
      "proof_back_image": await HelperFunctions.getBackImage(),
      "manager_id": 0,
      "is_politically_exposed":
          _controller.potentiallyExposedStatusInt.value ?? 0,
      "filled_itr_last_2years": _kRAController.isRTRInt.value ?? 0,
      "would_you_like_to_activate": _controller.activateFutureInt.value ?? 0,
      "check_box_share_data_with_company": _controller.isCheckedInt1.value ?? 0,
      "check_box_share_data_with_govt": _controller.isCheckedInt2.value ?? 0
    };

    // print("_kRAController.maidenName ${jsonEncode(body)}");
    try {
      var response = await http.put(
          Uri.parse(TrustKycUrl.baseUrl + TrustKycUrl.personalDetail),
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
      // debugPrint(response1.toString());
      debugPrint("correctedDate ${response.statusCode}");
      debugPrint("correctedDate ${response.body.toString()}");
      var res = jsonDecode(response.body);
      if (response.statusCode == 200) {
        debugPrint("correctedDate1222 ${response.body.toString()}");
        return res["message"];
      } else {
        ShowCustomSnackBar().ErrorSnackBar(res["errors"]);
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
      Get.dialog(Center(
        child: CircularProgressIndicator(),
      ));
      var response = await post(
          TrustKycUrl.baseUrl + TrustKycUrl.sentEmailOTP, jsonEncode(body),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': token,
          });
      if (response.statusCode == 200) {
        Get.back();
        return response.body["message"];
      } else {
        Get.back();
        ShowCustomSnackBar().ErrorSnackBar(response.body["errors"]);
      }
    } catch (e) {
      Get.back();
      ShowCustomSnackBar().ErrorSnackBar(e.toString());
    }
  }

  verifyOtp(String email, String otp) async {
    var token = await HelperFunctions.getToken();
    var body = {"email_id": email, "otp": otp};
    try {
      Get.dialog(VerifiedAnim(
        image: "assets/images/loding.mp4",
        onClick: () {},
        title: "We Are Verifying Your Email ID",
        subTitle:
            "We are validating your ID and Username with the service provider, this may take some time.",
      ));
      var response = await post(
          TrustKycUrl.baseUrl + TrustKycUrl.verifyEmailOtp, body,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': token,
          });
      if (response.statusCode == 200) {
        Get.back();
        if (response.body["is_email_verified"] == 1) {
          await HelperFunctions.saveEmail(response.body["email_id"].toString());
          return response.body["message"];
        }
      } else {
        Get.back();
        ShowCustomSnackBar().ErrorSnackBar(response.body["errors"]);
      }
    } catch (e) {
      Get.back();
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
              "${TrustKycUrl.baseUrl}${TrustKycUrl.getPANCard}?pan_no=$PAN"),
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
              "${TrustKycUrl.baseUrl}${TrustKycUrl.authenticateDigilocker}?platform=mobile"),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': token,
          });
      debugPrint("response.statusCode " + response.statusCode.toString());
      var res = jsonDecode(response.body);
      if (response.statusCode == 200) {
        DigiLockerModel model =
            DigiLockerModel.fromJson(jsonDecode(response.body));
        debugPrint("urlLink ${response.body}");
        return model;
      }
    } catch (e) {
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
      var response =
          await get("${TrustKycUrl.bondList}?page_number=1&limit=11");
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
      var response = await get(
          "${TrustKycUrl.specificBondsList}?bond_isin_number=$isisnNo");
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
      var response = await get(
          "{TrustKycUrl.inestmentCalculator}?isin=$isinNo&number_of_bonds=$bondNo");
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

/*  uploadImage(File signatureImage, String bornID, String wealthID) async {
    var token = await HelperFunctions.getToken();
    debugPrint("=============$signatureImage");
    debugPrint(
        "=============${signatureImage.path.split("/").last.toString()}");
    final postBody = await FormData({
      "image": MultipartFile(signatureImage,
          filename: signatureImage.path.split("/").last.toString()),
    });
    debugPrint("===233444====$postBody");
    try {
      // var request = http.MultipartRequest('POST', Uri.parse(TrustKycUrl.baseUrl + TrustKycUrl.signatureUpload));
      // request.files.add(http.MultipartFile('image',
      //     File(signatureImage.path).readAsBytes().asStream(), File(signatureImage.path).lengthSync(),
      //     filename: signatureImage.path.split("/").last));
      // var res = await request.send();
      var response = await http.post(
          Uri.parse(TrustKycUrl.baseUrl + TrustKycUrl.signatureUpload),
          body: postBody,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': token,
          });
      debugPrint("=========3223====${response.statusCode}");
      var res = jsonDecode(response.body);
      if (response.statusCode == 201) {
        addDematAccount(res["message"].toString(), bornID, wealthID);
        return res["message"];
      }
    } catch (e) {
      ShowCustomSnackBar().ErrorSnackBar(e.toString());
    }
  }
  */

  addNewDematAcount({
    required int check_box_account_statement_electronic,
    required int USAcitizen,
    required int taxResidency,
    required int check_box_terms_selected,
    required String wealth,
    required String Bornregion,
  }) async {
    final signatureImage = await HelperFunctions.getSignatureImage();
    var token = await HelperFunctions.getToken();
    var body = {
      "dp_resident_india": taxResidency,
      "dp_resident_usa": USAcitizen,
      "check_box_terms_selected": check_box_terms_selected,
      "check_box_account_statement_electronic": check_box_account_statement_electronic,
      "demat_signature_image": signatureImage,
      "born_place": wealth,
      "primary_source": Bornregion
    };
    debugPrint("dp_resident_usa $body");
    try {
      var response = await post(
          TrustKycUrl.baseUrl + TrustKycUrl.dematDetail, body,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': token,
          });
      debugPrint("dp_resident_india ${response.statusCode}");
      if (response.statusCode == 201) {
        return response.body["message"];
      }else{
        debugPrint("dp_resident_indiaelse ${response.body["errors"]}");
        ShowCustomSnackBar().ErrorSnackBar(response.body["errors"]);
      }
    } catch (e) {
      debugPrint("dp_resident_indiacatch ${e.toString()}");
      ShowCustomSnackBar().ErrorSnackBar(e.toString());
    }
  }

  updateNomineeDetail() async {
    var token = await HelperFunctions.getToken();
    AddNomineeController _addnomineeController =
        Get.put(AddNomineeController());
    PersonalDetailsController _personalController =
        Get.put(PersonalDetailsController());
    var temp = _addnomineeController.fullNomineeName.value.text.split(" ");
    debugPrint(temp.toString());
    var body = {
      "nominee_details_allocation": 0,
      "nominee_details_title": _addnomineeController.mrsValue.value,
      "nominee_details_fname": temp[0].toString() ?? "",
      "nominee_details_mname": temp[1].toString() ?? "",
      "nominee_details_lname": temp[2].toString() ?? "",
      "nominee_details_relationship":
          _addnomineeController.relationshipID.value.toString(),
      "nominee_details_identification": int.parse(_addnomineeController
          .selectedNomonneeIdentificationId.value
          .toString()),
      "nominee_details_identification_number":
          _addnomineeController.selectedNomineeIndentitiy.value ?? "",
      "nominee_details_mobile_number":
          _addnomineeController.nominneeMobileNumber.value.text,
      "nominee_details_dob": _addnomineeController.dob.value,
      "nominee_details_address_line_1":
          _personalController.modaltest.value != null
              ? _personalController.modaltest.value!.addressLine1
              : "",
      "nominee_details_address_line_2":
          _personalController.modaltest.value != null
              ? _personalController.modaltest.value!.addressLine2
              : "",
      "nominee_details_address_line_3":
          _personalController.modaltest.value != null
              ? _personalController.modaltest.value!.addressLine3
              : "",
      "nominee_details_address_zip": _personalController.modaltest.value != null
          ? _personalController.modaltest.value!.addressZip
          : "",
      "nominee_details_address_state_code":
          _personalController.modaltest.value != null
              ? _personalController.modaltest.value!.addressStateCode
              : "",
      "nominee_details_address_state":
          _personalController.modaltest.value != null
              ? _personalController.modaltest.value!.addressState
              : "",
      "nominee_details_address_city":
          _personalController.modaltest.value != null
              ? _personalController.modaltest.value!.addressCity
              : "",
      "nominee_details_city_sequence_no": "string",
      "nominee_details_current_address_line_1":
          _addnomineeController.addressLine1.value.text,
      "nominee_details_current_address_line_2":
          _addnomineeController.addressLine2.value.text,
      "nominee_details_current_address_line_3": "",
      "nominee_details_current_address_zip":
          _addnomineeController.pincode.value.text,
      "nominee_details_current_address_state_codecurrent": "",
      "nominee_details_current_address_state":
          _addnomineeController.SelectedState.value.toString(),
      "nominee_details_current_address_city":
          _addnomineeController.SelectedCity.value.toString(),
      "nominee_details_current_city_sequence_no": ""
    };
    try {
      var response = await post(
          TrustKycUrl.baseUrl + TrustKycUrl.addNomineeDetail, body,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': token,
          });
      debugPrint(response.statusCode.toString());

      if (response.statusCode == 201) {
        AddNomineeModel modal = AddNomineeModel.fromJson(response.body);
        _personalController.getNomineeDetails();
        return modal;
      } else {
        var temp = (response.body);
        Get.back();
        // debugPrint(response.body.toString());
        // debugPrint(temp["message"]);
        // debugPrint("temp[message");
        ShowCustomSnackBar().ErrorSnackBar(temp["errors"][0].toString());
      }
    } catch (e) {
      debugPrint(e.toString());
      ShowCustomSnackBar().ErrorSnackBar(e.toString());
    }
  }

  nomineeDetail() async {
    try {
      var token = await HelperFunctions.getToken();
      debugPrint("======token $token");
      var response = await get(
          TrustKycUrl.baseUrl + TrustKycUrl.addNomineeDetail,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': token,
          });
      debugPrint("======nomineeDetail ${response.body}");
      debugPrint(response.body.toString());
      if (response.statusCode == 200) {
        List<NomineeDetailModel> model = List<NomineeDetailModel>.from(
            (response.body).map((x) => NomineeDetailModel.fromJson(x)));
        debugPrint("======nomineeDetail ${response.body.toString()}");
        return model[0];
      }
    } catch (e) {
      debugPrint("======getProfile122121212 ${e.toString()}");
      ShowCustomSnackBar().ErrorSnackBar(e.toString());
    }
  }

  addExistingDemat(int DepositoryID, String DPID, String customerID,
      String beniID, String DPName) async {
    var token = await HelperFunctions.getToken();
    var body = {
      "depository": DepositoryID,
      "dp_id": DPID,
      "client_id": customerID,
      "beneficiary_id": beniID,
      "dp_name": DPName,
    };
    debugPrint("===========8786 ${body}");
    try {
      Get.dialog(VerifiedAnim(
        image: "assets/images/demat.mp4",
        onClick: () {},
        title: "We Are Verifying Your Demat Details",
        subTitle:
            "We are validating your ID and Username with the authorities, this may take some time.",
      ));
      var response = await post(
          TrustKycUrl.baseUrl + TrustKycUrl.existingDemat, body,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': token,
          });
      debugPrint("===========8786 ${response.statusCode}");
      if (response.statusCode == 201) {
        Get.back();
        ShowCustomSnackBar().SuccessSnackBar(response.body["message"]);
        return response.body["message"];
      } else {
        Get.back();
        ShowCustomSnackBar().ErrorSnackBar(response.body["errors"]);
      }
    } catch (e) {
      Get.back();
      ShowCustomSnackBar().ErrorSnackBar(e.toString());
    }
  }

  getAllDematAccounts() async {
    try {
      var token = await HelperFunctions.getToken();
      debugPrint("======token $token");
      var response =
          await get(TrustKycUrl.baseUrl + TrustKycUrl.alldemat, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': token,
      });
      debugPrint("======nomineeDetail ${response.body}");
      debugPrint(response.body.toString());
      if (response.statusCode == 200) {
        AllDematAccountModel model =
            AllDematAccountModel.fromJson(response.body);
        return model;
      }
    } catch (e) {
      debugPrint("======getProfile122121212 ${e.toString()}");
      ShowCustomSnackBar().ErrorSnackBar(e.toString());
    }
  }

  deletExistingDematAccount(int accountID) async {
    var token = await HelperFunctions.getToken();
    debugPrint("======PAN $accountID");
    try {
      Get.dialog(const Center(
        child: CircularProgressIndicator(),
      ));
      var response = await delete(
          "${TrustKycUrl.baseUrl}${TrustKycUrl.deleteExixtingDemat}?exist_demat_id=${accountID}",
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': token,
          });
      debugPrint("======PAN ${response.statusCode}");
      if (response.statusCode == 200) {
        Get.back();
        ShowCustomSnackBar().SuccessSnackBar(response.body["message"]);
        return response.body["message"];
      } else {
        Get.back();
        ShowCustomSnackBar().ErrorSnackBar(response.body["errors"]);
      }
    } catch (e) {
      Get.back();
      debugPrint("======23 ${e.toString()}");
      ShowCustomSnackBar().ErrorSnackBar(e.toString());
    }
  }

  deletNewDematAccount(int accountID) async {
    var token = await HelperFunctions.getToken();
    debugPrint("======deletNewDematAccount $accountID");
    try {
      Get.dialog(const Center(
        child: CircularProgressIndicator(),
      ));
      var response = await delete(
          "${TrustKycUrl.baseUrl}${TrustKycUrl.deleteDemat}?new_demat_id=${accountID}",
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': token,
          });
      debugPrint("======deletNewDematAccount ${response.statusCode}");
      if (response.statusCode == 200) {
        Get.back();
        ShowCustomSnackBar().SuccessSnackBar(response.body["message"]);
        return response.body["message"];
      } else {
        Get.back();
        ShowCustomSnackBar().ErrorSnackBar(response.body["errors"]);
      }
    } catch (e) {
      Get.back();
      debugPrint("======23 ${e.toString()}");
      ShowCustomSnackBar().ErrorSnackBar(e.toString());
    }
  }

  eSignPdf() async {
    var token = await HelperFunctions.getToken();
    try {
      Get.dialog(const Center(
        child: CircularProgressIndicator(),
      ));
      var response = await get(TrustKycUrl.eSign, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': token,
      });
      debugPrint("======eSign23234 ${response.statusCode}");
      if (response.statusCode == 200) {
        Get.back();
        debugPrint("============eSign  ${response.body}");
        return response.body;
      } else {
        Get.back();
        ShowCustomSnackBar().ErrorSnackBar(response.body["errors"]);
      }
    } catch (e) {
      Get.back();
      debugPrint("======23 ${e.toString()}");
      ShowCustomSnackBar().ErrorSnackBar(e.toString());
    }
  }

  downloadPDF() async {
    var token = await HelperFunctions.getToken();
    try {
      Get.dialog(const Center(
        child: CircularProgressIndicator(),
      ));
      var response = await get(TrustKycUrl.downloadPDF, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': token,
      });
      debugPrint("======errors ${response.statusCode}");
      if (response.statusCode == 200) {
        Get.back();
        debugPrint("9999999999999999 ${response.body['message']}");
        return response.body['message'];
      } else {
        Get.back();
        ShowCustomSnackBar().ErrorSnackBar(response.body["errors"]);
      }
    } catch (e) {
      Get.back();
      ShowCustomSnackBar().ErrorSnackBar(e.toString());
    }
  }

  getBondDetailsByBondID(String bondId)async{
    try{
      var body={
        "id":bondId
      };
      var response=await get(TrustKycUrl.specificBondsListByIdForIPO,query: body);
      debugPrint(response.body.toString());
      debugPrint("response.body.toString()");
      if(response.statusCode==200){
        AllBondListOfIpoByBondId modal=AllBondListOfIpoByBondId.fromJson(response.body);
        return modal;
      }
    }catch(e){ShowCustomSnackBar().ErrorSnackBar(e.toString());}
  }
}
