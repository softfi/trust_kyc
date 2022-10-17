import 'package:fluttertoast/fluttertoast.dart';
import 'package:logging/logging.dart';
import '../api/network_utility.dart';
import '../api/trust_kyc_dio_client.dart';
import '../api/trust_kyc_url.dart';
import '../model/otp_verify_response_data.dart';
import '../model/sendOtpEmailModel.dart';
import '../model/sign_up_response.dart';
import '../screens/auths/sharedPreference.dart';

class LoginRepository {
  final logger = Logger("LoginRepository");

  LoginRepository();

  Future<SignUpModel?> sendOtp(String firstName, String lastName,
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
    logger.info("SIGNUPResponse: ${response.data}");
    var data = NetworkUtility.responseHandler(response);
    if (response.statusCode == 200) {
      print("==============hashKEY ${data["hash_key"]}");
      await HelperFunctions.savehashkey(data["hash_key"].toString());
      Fluttertoast.showToast(
          msg: "OTP send successfully");
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
    logger.info("OTPResponse: ${response.data}");
    var data = NetworkUtility.responseHandler(response);
    if (response.statusCode == 200) {
      Fluttertoast.showToast(msg: 'OTP verify successfully');
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
    logger.info("SIGNUPResponse: ${response.data}");
    var data = NetworkUtility.responseHandler(response);
    if (response.statusCode == 200) {
      await HelperFunctions.savehashkey(data["hash_key"].toString());
      Fluttertoast.showToast(
          msg: 'OTP Resend Successfully', timeInSecForIosWeb: 3);
    }
    return SignUpModel.fromJson(data);
  }

  Future<SendOtpEmailModule?> sentOtpToEmail(
      String mobnumber, String emailid, bool isResendOtp) async {
    await NetworkUtility.checkNetworkStatus();
    var token = await HelperFunctions.getToken();
    final Map<String, dynamic> dataq = Map<String, dynamic>();
    dataq["mobile_number"] = mobnumber;
    dataq["email_id"] = emailid;
    dataq["resend_otp"] = isResendOtp;
    var response = await TrustKycDioClient(token)
        .post(endpoint: TrustKycUrl.sentEmailOTP, body: dataq);
    logger.info("getProfileResponse: ${response.data}");
    var data = NetworkUtility.responseHandler(response);
    if (response.statusCode == 200) {
      Fluttertoast.showToast(msg: 'Otp send Successfully to email!');
    } else if (response.statusCode == 400) {
      Fluttertoast.showToast(msg: 'personal_details not found');
    }
    return SendOtpEmailModule.fromJson(data);
  }
}
