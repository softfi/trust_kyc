import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logging/logging.dart';
import 'package:trust_money/model/all_demat_response_data.dart';
import 'package:trust_money/model/delete_bank_details_response_data.dart';
import 'package:trust_money/model/get_demate_account_response_data.dart';
import 'package:trust_money/model/wealth_dropdown_response_data.dart';
import '../api/network_utility.dart';
import '../api/trust_kyc_dio_client.dart';
import '../api/trust_kyc_url.dart';
import '../model/add_demat_response_data.dart';
import '../model/born_dropdown_response_data.dart';
import '../utils/helper_widget/custom_snsckbar.dart';
import '../utils/sharedPreference.dart';

class DematDetailRepository {
  final logger = Logger("DematDetailRepository");

  DematDetailRepository();

  Future<AllDematAccountModel?> getAllDematDetails() async {
    //List<AllDematAccountModel> dematList = [];
    await NetworkUtility.checkNetworkStatus();
    var token = await HelperFunctions.getToken();
    var response =
        await TrustKycDioClient(token).get(endpoint: TrustKycUrl.alldemat);
    var data = NetworkUtility.responseHandler(response);
    if (response.statusCode == 200) {
      return AllDematAccountModel.fromJson(data);
      // response.data.forEach((element) {
      //   return AllDematAccountModel.fromJson(data);
      // });
    }
    //return AllDematAccountModel.fromJson(data);
  }

addNewDematAccount1({
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
    // await NetworkUtility.checkNetworkStatus();
    var token = await HelperFunctions.getToken();
    var response = await TrustKycDioClient(token).post(endpoint: TrustKycUrl.dematDetail, body: dataq);
    // var data = NetworkUtility.responseHandler(response);
    if (response.statusCode == 201) {
      AddDematDetailModel model = AddDematDetailModel.fromJson(response.data);
      return model;
    }else{
      debugPrint("dp_resident_indiaelse ${response.data["errors"]}");
      ShowCustomSnackBar().ErrorSnackBar(response.data["errors"]);
    }

  }

  Future<List<WealthModel>> wealthDropdown() async {
    List<WealthModel> wealthList = [];
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

  addExistingDemat(int selectdepositrty, String dpid, String customerID,
      String benificiaryid, String dpname) async {
    final Map<String, dynamic> dataq = <String, dynamic>{};
    dataq["depository"] = selectdepositrty;
    dataq["dp_id"] = dpid;
    dataq["client_id"] = customerID;
    dataq["beneficiary_id"] = benificiaryid;
    dataq["dp_name"] = dpname;
    debugPrint("=====dataq $dataq");
    await NetworkUtility.checkNetworkStatus();
    var token = await HelperFunctions.getToken();
    var response = await TrustKycDioClient(token).post(endpoint: TrustKycUrl.existingDemat, body: dataq);
    debugPrint("=====dataq $response");
    debugPrint("=====dataq ${response.statusCode}");
    var data = NetworkUtility.responseHandler(jsonDecode(response.data));
    if (response.statusCode == 201) {
      ShowCustomSnackBar().SuccessSnackBar(data['message']);
      return data;
    }else{
      ShowCustomSnackBar().ErrorSnackBar(data['errors']);
    }
  }

  Future uploadSignature({required File file}) async {
    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(file.path),
    });
    var token = await HelperFunctions.getToken();
    var response = await TrustKycDioClient(token).upload(
      endpoint: TrustKycUrl.signatureUpload,
      data: formData,
    );
    if (response.statusCode == 201) {
      print("ImageString${response.data["message"].toString()}");
      await HelperFunctions.saveBackImage(response.data['message']);
      return response;
    }
  }

  Future<DeleteDematDetailModel> deleteDematDetails(int accountID) async {
    await NetworkUtility.checkNetworkStatus();
    var token = await HelperFunctions.getToken();
    var response = await TrustKycDioClient(token)
        .delete(endpoint: "${TrustKycUrl.deleteDemat}?demat_id=$accountID");
    var data = NetworkUtility.responseHandler(response);
    if (response.statusCode == 200) {
    }
    return DeleteDematDetailModel.fromJson(data);
  }

  Future<DeleteDematDetailModel> deleteDematExistingDetails(
      int accountID) async {
    await NetworkUtility.checkNetworkStatus();
    var token = await HelperFunctions.getToken();
    var response = await TrustKycDioClient(token)
        .delete(endpoint: "${TrustKycUrl.deleteExixtingDemat}?id=$accountID");
    var data = NetworkUtility.responseHandler(response);
    if (response.statusCode == 200) {
    }
    return DeleteDematDetailModel.fromJson(data);
  }

  Future<Response<dynamic>?> eSign() async {
    await NetworkUtility.checkNetworkStatus();
    var token = await HelperFunctions.getToken();
    var response =
        await TrustKycDioClient(token).get(endpoint: TrustKycUrl.eSign);
    if (response.statusCode == 200) {
      return response;
    }
  }

  uploadVideo(File file) async {
    debugPrint("9886866 $file");
    var token = await HelperFunctions.getToken();
    FormData formData = FormData.fromMap({
      "video": await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last),
    });
    try {
      var response = await TrustKycDioClient(token)
          .upload(endpoint: TrustKycUrl.personVerification, data: formData);
      if (response.statusCode == 201) {
        return response.data.toString();
      }
    } catch (e) {
      ShowCustomSnackBar().ErrorSnackBar(e.toString());
    }
  }
}
