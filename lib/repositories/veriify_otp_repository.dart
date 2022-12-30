import 'package:flutter/material.dart';
import '../api/network_utility.dart';
import '../api/trust_kyc_dio_client.dart';
import '../api/trust_kyc_url.dart';
import '../model/verify_login_otp.dart';
import '../utils/helper_widget/custom_snsckbar.dart';
import '../utils/sharedPreference.dart';

class verifyOtps {
  Future<VeryotpLoginModule?> verifyOtpLogin(
    String mobileNo,
    String otp,
    String hashkey,
  ) async {
    debugPrint("=============otpverification ${mobileNo} ${otp} ${hashkey}");
    final Map<String, dynamic> dataq = Map<String, dynamic>();
    dataq["mobile_number"] = mobileNo;
    dataq["otp"] = otp;
    dataq["hash_key"] = hashkey;
    await NetworkUtility.checkNetworkStatus();
    var token = await HelperFunctions.getToken();
    var response = await TrustKycDioClient(token)
        .post(endpoint: TrustKycUrl.login_mobile_otp_verify, body: dataq);
    var data = NetworkUtility.responseHandler(response);
    if (response.statusCode == 200) {
      await HelperFunctions.saveCustomerID(data['customer_id']);
      await HelperFunctions.saveFirstName(data['first_name'].toString());
      await HelperFunctions.saveLastName(data['last_name'].toString());
      await HelperFunctions.savetoken(data['token'].toString());
      await HelperFunctions.saveuserLoggedInSharedPreference(true);
      ShowCustomSnackBar().SuccessSnackBar("OTP verified Successful!");
    }
    return VeryotpLoginModule.fromJson(data);
  }


}
