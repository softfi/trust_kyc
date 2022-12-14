import 'package:flutter/material.dart';
import '../api/network_utility.dart';
import '../api/trust_kyc_dio_client.dart';
import '../api/trust_kyc_url.dart';
import '../model/otp_verify_response_data.dart';
import '../model/sign_up_response.dart';
import '../utils/helper_widget/custom_snsckbar.dart';
import '../utils/sharedPreference.dart';

class LoginRepository {


  LoginRepository();

  Future<SignUpModel?> sendOtp(String firstName, String lastName,
      String mobileNo, bool isResendOtp, int partner) async {
    final Map<String, dynamic> dataq = Map<String, dynamic>();
    dataq["fname"] = firstName;
    dataq["lname"] = lastName;
    dataq["mobile_number"] = mobileNo;
    dataq["resend_otp"] = isResendOtp;
    dataq["my_details_with_partner_companies"] = partner;
    await NetworkUtility.checkNetworkStatus();
    var token = await HelperFunctions.getToken();
    var response = await TrustKycDioClient(token)
        .post(endpoint: TrustKycUrl.signUpUrl, body: dataq);
    var data = NetworkUtility.responseHandler(response);
    if (response.statusCode == 200) {
      print("==============hashKEY ${data["hash_key"]}");
      await HelperFunctions.savehashkey(data["hash_key"].toString());
      SnackBar(content: Text("OTP send successfully"));
    }
    return SignUpModel.fromJson(data);
  }

  Future<OtpVerifyModel?> verifyOTP(
    String mobileNumber,
    String OTP,
    String hashKey,
  ) async {
    final Map<String, dynamic> dataq = Map<String, dynamic>();
    dataq["mobile_number"] = mobileNumber;
    dataq["otp"] = OTP;
    dataq["hash_key"] = hashKey;
    await NetworkUtility.checkNetworkStatus();
    var token = await HelperFunctions.getToken();
    /*var getRefreshToken = await HelperFunctions.getRefreshToken();
    print("Refresh"+getRefreshToken);*/

    var response = await TrustKycDioClient(token)
        .post(endpoint: TrustKycUrl.verifyOtp, body: dataq);
    var data = NetworkUtility.responseHandler(response);
    if (response.statusCode == 200) {
      SnackBar(content: Text("OTP verify successfully"));
      //Fluttertoast.showToast(msg: 'OTP verify successfully');
      await HelperFunctions.savetoken(data['token'].toString());
      await HelperFunctions.saveuserLoggedInSharedPreference(true);
      print("=========>token ${data['token']}");
      print("===========>refresh_token ${data['refresh_token']}");
    }
    return OtpVerifyModel.fromJson(data);
  }

  Future<SignUpModel?> resendOtp(String firstName, String lastName,
      String mobileNo, bool isResendOtp) async {
    final Map<String, dynamic> dataq = Map<String, dynamic>();
    dataq["fname"] = firstName;
    dataq["lname"] = lastName;
    dataq["mobile_number"] = mobileNo;
    dataq["resend_otp"] = isResendOtp;
    await NetworkUtility.checkNetworkStatus();
    var token = await HelperFunctions.getToken();
    var response = await TrustKycDioClient(token)
        .post(endpoint: TrustKycUrl.signUpUrl, body: dataq);
    var data = NetworkUtility.responseHandler(response);
    if (response.statusCode == 200) {
      await HelperFunctions.savehashkey(data["hash_key"].toString());
      ShowCustomSnackBar().SuccessSnackBar("OTP Resend Successfully");
    }
    return SignUpModel.fromJson(data);
  }


}
