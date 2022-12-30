import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:trust_money/model/wealth_dropdown_response_data.dart';
import '../api/network_utility.dart';
import '../api/trust_kyc_dio_client.dart';
import '../api/trust_kyc_url.dart';
import '../model/add_demat_response_data.dart';
import '../model/born_dropdown_response_data.dart';
import '../utils/helper_widget/custom_snsckbar.dart';
import '../utils/sharedPreference.dart';

class DematDetailRepository {

  DematDetailRepository();



addNewDematAccount1({
    required int check_box_account_statement_electronic,
    required int USAcitizen,
    required int taxResidency,
    required int check_box_terms_selected,
    required String wealth,
    required String Bornregion,
  }) async {
    final signatureImage = await HelperFunctions.getSignatureImage();
    final Map<String, dynamic> dataq = Map<String, dynamic>();
    dataq["dp_resident_india"] = taxResidency;
    dataq["dp_resident_usa"] = USAcitizen;
    dataq["check_box_terms_selected"] = check_box_terms_selected;
    dataq["check_box_account_statement_electronic"] = check_box_account_statement_electronic;
    dataq["demat_signature_image"] = signatureImage;
    dataq["born_place"] = Bornregion;
    dataq["primary_source"] = wealth;
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
