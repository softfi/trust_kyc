
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logging/logging.dart';
import 'package:trust_money/model/get_demate_account_response_data.dart';
import 'package:trust_money/model/wealth_dropdown_response_data.dart';
import '../api/network_utility.dart';
import '../api/trust_kyc_dio_client.dart';
import '../api/trust_kyc_url.dart';
import '../model/add_demat_response_data.dart';
import '../model/add_nominee_response_data.dart';
import '../model/born_dropdown_response_data.dart';
import '../model/get_demat_response_data.dart';
import '../model/nominee_identify_dropdown_response_data.dart';
import '../model/relationship_dropdown_response_data.dart';
import '../utils/sharedPreference.dart';

class DematDetailRepository {
  final logger = Logger("DematDetailRepository");

  DematDetailRepository();

  Future<List<DematDetailModel>> getDematDetails() async {
    List<DematDetailModel> dematList = [];
    await NetworkUtility.checkNetworkStatus();
    var token = await HelperFunctions.getToken();
    var response = await TrustKycDioClient(token)
        .get(endpoint: TrustKycUrl.getdematDetail);
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        dematList.add(DematDetailModel.fromJson(element));
      });
    }
    return dematList;
  }

  Future<AddDematDetailModel> adddematDetails({
    required int check_box_account_statement_electronic,
    required int USAcitizen,
    required int taxResidency,
    required int check_box_terms_selected,
    required String wealth,
    required String Bornregion,
  }) async {
    final signatureImage = await HelperFunctions.getSignatureImage();
    print("=================45363 $signatureImage");
    print("=================45363 $wealth");
    print("=================45363 $Bornregion");
    print("=================45363 $USAcitizen");
    print("=================45363 ${check_box_terms_selected}");
    print("=================45363 ${taxResidency}");
    print("=================45363 ${check_box_account_statement_electronic}");
    final Map<String, dynamic> dataq = Map<String, dynamic>();
    dataq["dp_resident_india"] = taxResidency;
    dataq["dp_resident_usa"] = USAcitizen;
    dataq["check_box_terms_selected"] = check_box_terms_selected;
    dataq["check_box_account_statement_electronic"] = check_box_account_statement_electronic;
    dataq["demat_signature_image"] = signatureImage;
    dataq["born_place"] = Bornregion;
    dataq["primary_source"] = wealth;
    print("=================45363 $dataq");
    await NetworkUtility.checkNetworkStatus();
    var token = await HelperFunctions.getToken();
    var response = await TrustKycDioClient(token)
        .post(endpoint: TrustKycUrl.dematDetail, body: dataq);
    logger.info("dematDetailResponse: ${response.data}");
    print("dematDetail1223234: ${response.data}");
    var data = NetworkUtility.responseHandler(response);
    if (response.statusCode == 201) {
       Fluttertoast.showToast(msg: 'Demat account added successfully', timeInSecForIosWeb: 3);
    }
    return AddDematDetailModel.fromJson(data);
  }

  Future<List<RelationShipModel>> relationShip() async {
    List<RelationShipModel> relationShipList = [];
    print("=================> called");
    //logger.info("getStateResponse: ==============");
    await NetworkUtility.checkNetworkStatus();
    var token = await HelperFunctions.getToken();
    var response =
        await TrustKycDioClient(token).get(endpoint: TrustKycUrl.relationship);
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        relationShipList.add(RelationShipModel.fromJson(element));
      });
    }
    return relationShipList;
  }

  Future<List<NomineeIdentyModel>> nomineeProof() async {
    List<NomineeIdentyModel> nomineeProofList = [];
    print("=================> called");
    //logger.info("getStateResponse: ==============");
    await NetworkUtility.checkNetworkStatus();
    var token = await HelperFunctions.getToken();
    var response = await TrustKycDioClient(token)
        .get(endpoint: TrustKycUrl.nomineeIdentity);
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        nomineeProofList.add(NomineeIdentyModel.fromJson(element));
      });
    }
    return nomineeProofList;
  }

  Future<List<WealthModel>> wealthDropdown() async {
    List<WealthModel> wealthList = [];
    print("=================> called");
    //logger.info("getStateResponse: ==============");
    await NetworkUtility.checkNetworkStatus();
    var token = await HelperFunctions.getToken();
    var response =
        await TrustKycDioClient(token).get(endpoint: TrustKycUrl.wealth);
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        wealthList.add(WealthModel.fromJson(element));
      });
    }
    return wealthList;
  }

  Future<List<BornModel>> bornDropdown() async {
    List<BornModel> bornList = [];
    print("=================> called");
    //logger.info("getStateResponse: ==============");
    await NetworkUtility.checkNetworkStatus();
    var token = await HelperFunctions.getToken();
    var response =
        await TrustKycDioClient(token).get(endpoint: TrustKycUrl.born);
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        bornList.add(BornModel.fromJson(element));
      });
    }
    return bornList;
  }

  Future<Map<String, dynamic>?> addNominee({
    required String title,
    required String firstname,
    required String relationshipwithApplication,
    required int nominieeIdentify,
    required String nominieeIdentificationNumber,
    required String mobilenumber,
    required String dob,
    required String currentaddressLine1,
    required String currentaddressLine2,
    required String currentaddressLine3,
    required String currentCity,
    required String currentState,
    required String currentZip,
    required String addressLine1,
    required String addressLine2,
    required String addreszipCode,
    required String alternateaddressState,
    required String alternateaddressCity,
  }) async {
    print("============768596 $nominieeIdentificationNumber");
    print("============768596 $nominieeIdentify");
    final Map<String, dynamic> dataq = Map<String, dynamic>();
    dataq["allocation"] = 0;
    dataq["title"] = title;
    dataq["fname"] = firstname;
    dataq["mname"] = "";
    dataq["lname"] = "";
    dataq["relationship"] = relationshipwithApplication;
    dataq["identification"] = nominieeIdentify;
    dataq["identification_number"] = nominieeIdentificationNumber;
    dataq["mobile_number"] = mobilenumber;
    dataq["dob"] = dob.toString();
    dataq["address_line_1"] = addressLine1;
    dataq["address_line_2"] = addressLine2;
    dataq["address_line_3"] = "";
    dataq["address_zip"] = addreszipCode;
    dataq["address_state_code"] = "";
    dataq["address_state"] = alternateaddressState;
    dataq["address_city"] = alternateaddressCity;
    dataq["city_sequence_no"] = "";
    dataq["current_address_line_1"] = currentaddressLine1;
    dataq["current_address_line_2"] = currentaddressLine2;
    dataq["current_address_line_3"] = currentaddressLine3;
    dataq["current_address_zip"] = currentZip;
    dataq["current_address_state_codecurrent"] = "";
    dataq["current_address_state"] = currentState;
    dataq["current_address_city"] = currentCity;
    dataq["current_city_sequence_no"] = "";
    print("=============data $dataq");
    await NetworkUtility.checkNetworkStatus();
    var token = await HelperFunctions.getToken();
    var response = await TrustKycDioClient(token)
        .post(endpoint: TrustKycUrl.addNomineeDetail, body: dataq);
    logger.info("nomineeResponse: ${response.data}");
    var data = NetworkUtility.responseHandler(response);
    if (response.statusCode == 200) {
      return data;
    }
  }

  Future<Map<String, dynamic>?> existingDemat(
    String selectdepositrty,
    String dpid,
    String benificiaryid,
    String dpname,
  ) async {
    final Map<String, dynamic> dataq = Map<String, dynamic>();
    dataq["depository"] = selectdepositrty;
    dataq["dp_id"] = dpid;
    dataq["beneficiary_id"] = benificiaryid;
    dataq["dp_name"] = dpname;
    await NetworkUtility.checkNetworkStatus();
    var token = await HelperFunctions.getToken();
    print("=====token $token");
    var response = await TrustKycDioClient(token).post(endpoint: TrustKycUrl.existingDemat, body: dataq);
    logger.info("dematDetailResponse: ${response.data}");
    var data = NetworkUtility.responseHandler(response);
    if (response.statusCode == 201) {
      // Fluttertoast.showToast(msg: 'demat details added successfully', timeInSecForIosWeb: 3);
    }
    return data;
  }

  Future<ExistingDematDetailModel?> getExistingDematDetails() async {
    await NetworkUtility.checkNetworkStatus();
    var token = await HelperFunctions.getToken();
    var response = await TrustKycDioClient(token).get(
      endpoint: TrustKycUrl.existingDemat,
    );
    logger.info("getProfileResponse: ${response.data}");
    print("getProfileResponse: ${response.data}");
    var data = NetworkUtility.responseHandler(response);
    if (response.statusCode == 200) {
      // Fluttertoast.showToast(msg: "200");
    }
    return ExistingDematDetailModel.fromJson(data);
  }

//Addsignature============================
  Future uploadSignature(
      {required File file}) async {
    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(file.path),

    });
    var token = await HelperFunctions.getToken();
    var response = await TrustKycDioClient(token).upload(endpoint: TrustKycUrl.signatureUpload,data: formData);

    print("response" + response.statusCode.toString());
    if (response.statusCode == 201) {
      print("ImageString${response.data["message"].toString()}");
      await HelperFunctions.saveBackImage(response.data['message']);
      return response;
    } else {
      Fluttertoast.showToast(msg: "Something Went Wrong \n try again");
    }
  }

  Future<Map<String, dynamic>?> deleteDematDetails() async {
    await NetworkUtility.checkNetworkStatus();
    var token = await HelperFunctions.getToken();
    var response = await TrustKycDioClient(token)
        .delete(endpoint: TrustKycUrl.deleteDemat);
    var data = NetworkUtility.responseHandler(response);
    if (response.statusCode == 200) {
      Fluttertoast.showToast(msg: 'demat details deleted');
    }
    return data;
  }
}
