import 'dart:io';

import 'package:dio/dio.dart';
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
import '../model/add_nominee_response_data.dart';
import '../model/born_dropdown_response_data.dart';
import '../model/get_demat_response_data.dart';
import '../model/nominee_identify_dropdown_response_data.dart';
import '../model/relationship_dropdown_response_data.dart';
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

  Future<AddDematDetailModel> addNewDematAccount({
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
      Fluttertoast.showToast(
          msg: 'Demat account added successfully', timeInSecForIosWeb: 3);
    }
    return AddDematDetailModel.fromJson(data);
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

  Future<Map<String, dynamic>?> addExistingDemat(
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
    var response = await TrustKycDioClient(token)
        .post(endpoint: TrustKycUrl.existingDemat, body: dataq);
    logger.info("dematDetailResponse: ${response.data}");
    var data = NetworkUtility.responseHandler(response);
    if (response.statusCode == 201) {
      // Fluttertoast.showToast(msg: 'demat details added successfully', timeInSecForIosWeb: 3);
    }
    return data;
  }

  Future uploadSignature({required File file}) async {
    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(file.path),
    });
    var token = await HelperFunctions.getToken();
    var response = await TrustKycDioClient(token)
        .upload(endpoint: TrustKycUrl.signatureUpload, data: formData,);
    if (response.statusCode == 201) {
      print("ImageString${response.data["message"].toString()}");
      await HelperFunctions.saveBackImage(response.data['message']);
      return response;
    } else {
      Fluttertoast.showToast(msg: "Something Went Wrong \n try again");
    }
  }

  Future<DeleteDematDetailModel> deleteDematDetails(int accountID) async {
    await NetworkUtility.checkNetworkStatus();
    var token = await HelperFunctions.getToken();
    var response = await TrustKycDioClient(token)
        .delete(endpoint: "${TrustKycUrl.deleteDemat}?demat_id=$accountID");
    var data = NetworkUtility.responseHandler(response);
    if (response.statusCode == 200) {
      //Fluttertoast.showToast(msg: 'Demat account deleted successfully');
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
      //Fluttertoast.showToast(msg: 'Demat account deleted successfully');
    }
    return DeleteDematDetailModel.fromJson(data);
  }

  Future<Response<dynamic>?> eSign() async {
    await NetworkUtility.checkNetworkStatus();
    var token = await HelperFunctions.getToken();
    var response =
        await TrustKycDioClient(token).get(endpoint: TrustKycUrl.eSign);
    print("========543 ${response}");
    //var data = NetworkUtility.responseHandler(response);
    if (response.statusCode == 200) {
      print("========542 ${response}");
      return response;
    }
  }

  uploadVideo(File file) async {
    var token = await HelperFunctions.getToken();
    FormData formData = FormData.fromMap({
      "video": await MultipartFile.fromFile(file.path,filename: file.path.split('/').last),
    });
    try {
      var response= await TrustKycDioClient(token)
          .upload(endpoint: TrustKycUrl.personVerification, data: formData);
      if (response.statusCode == 201) {
        return response.data.toString();
      }

    } catch (e) {
      ShowCustomSnackBar().ErrorSnackBar(e.toString());
    }
  }


}
