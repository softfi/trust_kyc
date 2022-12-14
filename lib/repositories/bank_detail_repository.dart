
import 'package:trust_money/model/get_bank_detail_response_data.dart';
import 'package:trust_money/model/get_ifsc_code_response_data.dart';
import '../api/network_utility.dart';
import '../api/trust_kyc_dio_client.dart';
import '../api/trust_kyc_url.dart';
import '../model/delete_bank_details_response_data.dart';
import '../utils/helper_widget/custom_snsckbar.dart';
import '../utils/sharedPreference.dart';

class BankDetailRepository {

  BankDetailRepository();

  Future<Map<String, dynamic>?> addbankDetails(
    String ifsc,
    String accountNumber,
    int savingIndex,
    int jointIndex,
  ) async {
    print("==========5463 $accountNumber");
    print("==========5463 $savingIndex");
    print("==========5463 $jointIndex");
    final Map<String, dynamic> dataq = Map<String, dynamic>();
    dataq["ifsc_code"] = ifsc.toString();
    dataq["account_number"] = accountNumber.toString();
    dataq["account_type_1"] = savingIndex;
    dataq["account_type_2"] = jointIndex;
    dataq["is_primary"] = 0;
    await NetworkUtility.checkNetworkStatus();
    var token = await HelperFunctions.getToken();
    var response = await TrustKycDioClient(token)
        .post(endpoint: TrustKycUrl.bankDetail, body: dataq);
    print("============2332 ${response.statusCode}");
    var data = NetworkUtility.responseHandler(response);
    if (response.statusCode == 200) {
     // ShowCustomSnackBar().SuccessSnackBar("bank details added successfully");
    }else if(response.statusCode == 400){
      ShowCustomSnackBar().ErrorSnackBar("Invalid IFSC code, Please enter valid IFSC code");
    }
    return data;
  }


  Future<List<BankDetailModel>> getBankDetails() async {
    List<BankDetailModel> detailList = [];
    var token = await HelperFunctions.getToken();
    var response = await TrustKycDioClient(token).get(endpoint: TrustKycUrl.bankDetailWithCheck);
    print("=================getBankDetails ${response.data}");
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        detailList.add(BankDetailModel.fromJson(element));
      });
    }
    return detailList;
  }

  Future<DeleteDematDetailModel> deleteBankDetails(int bankDetailsId) async {
    await NetworkUtility.checkNetworkStatus();
    var token = await HelperFunctions.getToken();
    var response = await TrustKycDioClient(token).delete(
        endpoint: "${TrustKycUrl.bankDetailWithCheck}?id=$bankDetailsId");
    var data = NetworkUtility.responseHandler(response);
    if (response.statusCode == 200) {
      ShowCustomSnackBar().SuccessSnackBar("Bank details deleted Successful");

    }
    return DeleteDematDetailModel.fromJson(data);
  }

  Future<GetIfscCdeModel> getIFSCCode(String IFSC) async {
    await NetworkUtility.checkNetworkStatus();
    var token = await HelperFunctions.getToken();
    var response = await TrustKycDioClient(token).get(
        endpoint: "${TrustKycUrl.getIFSC}?ifsc_code=$IFSC");
    var data = NetworkUtility.responseHandler(response);
    if (response.statusCode == 200) {
    }
    return GetIfscCdeModel.fromJson(data);
  }
}
