import 'package:fluttertoast/fluttertoast.dart';
import 'package:trust_money/model/verify_email_response_data.dart';
import '../api/network_utility.dart';
import '../api/trust_kyc_dio_client.dart';
import '../api/trust_kyc_url.dart';
import '../model/verify_login_otp.dart';
import '../screens/auths/sharedPreference.dart';

class verifyOtps {
  Future<VeryotpLoginModule?> verifyOtpLogin(
    String mobileNo,
    String otp,
    String hashkey,
  ) async {
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
      Fluttertoast.showToast(msg: 'OTP verified!', timeInSecForIosWeb: 3);
    }
    return VeryotpLoginModule.fromJson(data);
  }

  Future<VeryotpLoginModule?> resendOtpLogin(
      String mobileNo, bool ResendOtp) async {
    final Map<String, dynamic> dataq = Map<String, dynamic>();
    dataq["mobile_number"] = mobileNo;
    dataq["resend_otp"] = ResendOtp;
    await NetworkUtility.checkNetworkStatus();
    var token = await HelperFunctions.getToken();
    var response = await TrustKycDioClient(token)
        .post(endpoint: TrustKycUrl.login_mobile_otp_verify, body: dataq);
    print("SIGNUPResponse: ${response.data}");
    var data = NetworkUtility.responseHandler(response);
    if (response.statusCode == 200) {
      await HelperFunctions.saveCustomerID(data['customer_id']);
      await HelperFunctions.savetoken(data['token'].toString());
      await HelperFunctions.saveuserLoggedInSharedPreference(true);
      Fluttertoast.showToast(msg: 'OTP verified!', timeInSecForIosWeb: 3);
    }
    return VeryotpLoginModule.fromJson(data);
  }

}
