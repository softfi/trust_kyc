import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../api/network_utility.dart';
import '../api/trust_kyc_dio_client.dart';
import '../api/trust_kyc_url.dart';
import '../model/city_responsse_data.dart';
import '../model/state_response_data.dart';
import '../utils/helper_widget/custom_snsckbar.dart';
import '../utils/sharedPreference.dart';
import 'package:http_parser/http_parser.dart';

class ProfileRepository {

  ProfileRepository();

  Future<List<GetStateModel>> getState() async {
    List<GetStateModel> stateList = [];
    print("=================> called");
    await NetworkUtility.checkNetworkStatus();
    var token = await HelperFunctions.getToken();
    var response = await TrustKycDioClient(token).get(
      endpoint: TrustKycUrl.getState,
    );
    if (response.statusCode == 200) {
      //final json = jsonDecode(response.data);
      response.data.forEach((element) {
        stateList.add(GetStateModel.fromJson(element));
      });
    }
    return stateList;
  }

  Future<List<GetCityModel>> getCity(String stateid) async {
    var query = {"state_id": stateid};
    List<GetCityModel> cityList = [];
    print("=================> called");
    await NetworkUtility.checkNetworkStatus();
    var token = await HelperFunctions.getToken();
    var response = await TrustKycDioClient(token)
        .get(endpoint: TrustKycUrl.getCity, query: query);
    if (response.statusCode == 200) {
      //final json = jsonDecode(response.data);
      response.data.forEach((element) {
        cityList.add(GetCityModel.fromJson(element));
      });
    }
    return cityList;
  }

  Future uploadScans(
      {required String proofType,
      required File file1,
      required File file2}) async {
    String fileName = file1.path.split('/').last;
    String fileName1 = file2.path.split('/').last;
    try {
      FormData formData = FormData.fromMap({
        "front_image": await MultipartFile.fromFile(file1.path,
            filename: fileName, contentType: MediaType("image", "jpg")),
        "back_image": await MultipartFile.fromFile(file2.path,
            filename: fileName1, contentType: MediaType("image", "jpg")),
      });
      var token = await HelperFunctions.getToken();
      var dio = Dio();
      var response = await dio.post("${TrustKycUrl.baseUrl}${TrustKycUrl.proofImage}?proof_type=$proofType",
          data: formData,
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': token,
          }));
      debugPrint(response.data.toString());
      debugPrint("0000000000000+++++000000000000");
      if (response.statusCode == 201) {
        await HelperFunctions.saveFrontImage(response.data['front-image']);
        await HelperFunctions.saveBackImage(response.data['back-image']);
        return response;
      } else {
        ShowCustomSnackBar().ErrorSnackBar(response.data["errors"]);
      }
    } catch (e) {
      ShowCustomSnackBar().ErrorSnackBar(e.toString());
    }
  }

}
