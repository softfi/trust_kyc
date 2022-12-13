import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:trust_money/api/trust_kyc_url.dart';
import '../model/perosnal_details/get_personal_detail_response.dart';
import '../utils/sharedPreference.dart';

class APiProvider extends GetConnect {
  personalDetail() async {
    // try {
    var token = await HelperFunctions.getToken();
    var response =
        await get(TrustKycUrl.baseUrl + TrustKycUrl.personalDetail, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': token,
    });
    print("========21 ${response.statusCode}");
    print("========21 $token");
    print("========21 ${response.body}");
    if (response.statusCode == 200) {
      GetPersonalDetailModel model =
          GetPersonalDetailModel.fromJson(response.body);
      debugPrint("========21 $model");
      return model;
    }
    // } catch (e) {
    //   Get.showSnackbar(GetSnackBar(
    //     title: e.toString(),
    //   ));
    // }
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

}
