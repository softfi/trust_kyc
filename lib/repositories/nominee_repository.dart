
import 'package:trust_money/api/network_utility.dart';
import 'package:trust_money/api/trust_kyc_dio_client.dart';
import 'package:trust_money/api/trust_kyc_url.dart';
import 'package:trust_money/utils/sharedPreference.dart';

import '../model/nominee_identify_dropdown_response_data.dart';
import '../model/relationship_dropdown_response_data.dart';

class NomineeRepository {
  NomineeRepository();

  Future<List<RelationShipModel>> relationShip() async {
    List<RelationShipModel> relationShipList = [];
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

}
