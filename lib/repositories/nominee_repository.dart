
import 'package:logging/logging.dart';
import 'package:trust_money/api/network_utility.dart';
import 'package:trust_money/api/trust_kyc_dio_client.dart';
import 'package:trust_money/api/trust_kyc_url.dart';
import 'package:trust_money/utils/sharedPreference.dart';

import '../model/nominee_identify_dropdown_response_data.dart';
import '../model/relationship_dropdown_response_data.dart';

class NomineeRepository {
  final logger = Logger("NomineeRepository");
  NomineeRepository();

  Future<List<RelationShipModel>> relationShip() async {
    List<RelationShipModel> relationShipList = [];
    print("=================> called");
    //logger.info("getStateResponse: ==============");
    await NetworkUtility.checkNetworkStatus();
    var token = await HelperFunctions.getToken();
    var response =
    await TrustKycDioClient(token).get(endpoint: TrustKycUrl.relationship);
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        relationShipList.add(RelationShipModel.fromJson(element));
      });
    }
    return relationShipList;
  }

  Future<List<NomineeIdentyModel>> nomineeProof() async {
    List<NomineeIdentyModel> nomineeProofList = [];
    print("=================> called");
    //logger.info("getStateResponse: ==============");
    await NetworkUtility.checkNetworkStatus();
    var token = await HelperFunctions.getToken();
    var response = await TrustKycDioClient(token)
        .get(endpoint: TrustKycUrl.nomineeIdentity);
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        nomineeProofList.add(NomineeIdentyModel.fromJson(element));
      });
    }
    return nomineeProofList;
  }

  Future<Map<String, dynamic>?> addNominee({
    required String title,
    required String firstname,
    required String relationshipwithApplication,
    required int nominieeIdentify,
    required String nominieeIdentificationNumber,
    required String mobilenumber,
    required String dob,
    required String currentaddressLine1,
    required String currentaddressLine2,
    required String currentaddressLine3,
    required String currentCity,
    required String currentState,
    required String currentZip,
    required String addressLine1,
    required String addressLine2,
    required String addreszipCode,
    required String alternateaddressState,
    required String alternateaddressCity,
  }) async {
    print("============768596 $nominieeIdentificationNumber");
    print("============768596 $nominieeIdentify");
    final Map<String, dynamic> dataq = Map<String, dynamic>();
    dataq["allocation"] = 0;
    dataq["title"] = title;
    dataq["fname"] = firstname;
    dataq["mname"] = "";
    dataq["lname"] = "";
    dataq["relationship"] = relationshipwithApplication;
    dataq["identification"] = nominieeIdentify;
    dataq["identification_number"] = nominieeIdentificationNumber;
    dataq["mobile_number"] = mobilenumber;
    dataq["dob"] = dob.toString();
    dataq["address_line_1"] = addressLine1;
    dataq["address_line_2"] = addressLine2;
    dataq["address_line_3"] = "";
    dataq["address_zip"] = addreszipCode;
    dataq["address_state_code"] = "";
    dataq["address_state"] = alternateaddressState;
    dataq["address_city"] = alternateaddressCity;
    dataq["city_sequence_no"] = "";
    dataq["current_address_line_1"] = currentaddressLine1;
    dataq["current_address_line_2"] = currentaddressLine2;
    dataq["current_address_line_3"] = currentaddressLine3;
    dataq["current_address_zip"] = currentZip;
    dataq["current_address_state_codecurrent"] = "";
    dataq["current_address_state"] = currentState;
    dataq["current_address_city"] = currentCity;
    dataq["current_city_sequence_no"] = "";
    print("=============data $dataq");
    await NetworkUtility.checkNetworkStatus();
    var token = await HelperFunctions.getToken();
    var response = await TrustKycDioClient(token)
        .post(endpoint: TrustKycUrl.addNomineeDetail, body: dataq);
    logger.info("nomineeResponse: ${response.data}");
    var data = NetworkUtility.responseHandler(response);
    if (response.statusCode == 200) {
      return data;
    }
  }


}
