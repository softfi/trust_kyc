import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logging/logging.dart';
import 'package:trust_money/model/address_proof_response_data.dart';
import 'package:trust_money/model/profession_response_data.dart';
import 'package:trust_money/model/verify_email_response_data.dart';
import '../api/network_utility.dart';
import '../api/trust_kyc_dio_client.dart';
import '../api/trust_kyc_url.dart';
import '../model/city_responsse_data.dart';
import '../model/code_verification_response_data.dart';
import '../model/digiLocker_response_data.dart';
import '../model/get_digilocker_response_data.dart';
import '../model/get_pan_response_data.dart';
import '../model/get_personal_detail_response.dart';
import '../model/state_response_data.dart';
import '../utils/sharedPreference.dart';
import 'package:http_parser/http_parser.dart';

class ProfileRepository {
  final logger = Logger("ProfileRepository");

  ProfileRepository();

  Future<GetPersonalDetailModel?> getProfileDetails() async {
    await NetworkUtility.checkNetworkStatus();
    var token = await HelperFunctions.getToken();
    var response = await TrustKycDioClient(token).get(
      endpoint: TrustKycUrl.personalDetail,
    );
    print("========token $token");
    print("getProfileResponse: ${response.data}");
    print("getProfileResponse: ${response.data}");
    var data = NetworkUtility.responseHandler(response);
    if (response.statusCode == 200) {
      // Fluttertoast.showToast(msg: "200");
      await HelperFunctions.saveEmail(data["email_id"].toString());
      await HelperFunctions.saveFirstName(data["firstname"].toString());
      await HelperFunctions.saveLastName(data["lastname"].toString());
      print("===========00: ${data["firstname"]}");
      print("===========00: ${data["lastname"]}");
    }
    return GetPersonalDetailModel.fromJson(data);
  }

  Future<Map<String, dynamic>?> addPersonalDetails({
    required String firstName,
    required String lastName,
    required String addressLine1,
    required String addressLine2,
    required String addressLine3,
    required String addressZip,
    required String maidenName,
    required String professionID,
    required String proof,
    required String stateId,
    required String cityID,
    required int genderIndex,
    required int maritalIndex,
    required int incomeIndex,
    required int experienceIndex,
    required String dob,
    required int politicallyexposed,
    required int wouldyouliketoActivate,
    required int chekbox1,
    required int chekbox2,
    required int itrFiled,
  }) async {
    final profileImage = await HelperFunctions.getProfileImage();
    final frontImage = await HelperFunctions.getFrontImage();
    final backImage = await HelperFunctions.getBackImage();
    print("================765 $profileImage");
    print("================765 $maidenName");
    print("================76ik $dob");
    print("================76ik $itrFiled");
    print("================765 $firstName");
    print("================765 $lastName");
    print("================765 $addressLine1");
    print("================765 $addressLine2");
    print("================765 $addressLine3");
    print("================765 $stateId");
    print("================765 $cityID");
    print("================765 $maidenName");
    print("================765 $professionID");
    print("================765 $dob");
    print("================765 $itrFiled");
    print("================765 $frontImage");
    print("================765 $backImage");
    print("================765 $profileImage");
    final Map<String, dynamic> dataq = Map<String, dynamic>();
    dataq["firstname"] = firstName;
    dataq["lastname"] = lastName;
    dataq["dob"] = dob;
    dataq["smart_card_required"] = 0;
    dataq["smart_card_number"] = "";
    dataq["smart_card_PIN"] = "";
    dataq["gender"] = genderIndex;
    dataq["married_status"] = maritalIndex;
    dataq["mothers_maiden_name"] = maidenName;
    dataq["annual_income"] = incomeIndex;
    dataq["trading_experience"] = experienceIndex;
    dataq["occupation"] = professionID;
    dataq["lifestyle"] = "";
    dataq["geogriphical_code"] = "";
    dataq["education_degree"] = "";
    dataq["address_line_1"] = addressLine1;
    dataq["address_line_2"] = addressLine2;
    dataq["address_line_3"] = addressLine3;
    dataq["address_zip"] = addressZip;
    dataq["address_state_code"] = "";
    dataq["address_state"] = stateId;
    dataq["address_city"] = cityID;
    dataq["city_sequence_no"] = "";
    dataq["family_account"] = "";
    dataq["mental_disability"] = "";
    dataq["profile_image"] = profileImage;
    dataq["verification_video"] = profileImage;
    dataq["proof_type"] = proof;
    dataq["proof_front_image"] = frontImage;
    dataq["proof_back_image"] = backImage;
    dataq["manager_id"] = 0;
    dataq["filled_itr_last_2years"] = itrFiled;
    dataq["is_politically_exposed"] = politicallyexposed;
    dataq["would_you_like_to_activate"] = wouldyouliketoActivate;
    dataq["check_box_share_data_with_company"] = chekbox1;
    dataq["check_box_share_data_with_govt"] = chekbox2;
    print("================765 $dataq");
    await NetworkUtility.checkNetworkStatus();
    var token = await HelperFunctions.getToken();
    var response = await TrustKycDioClient(token).put(
      endpoint: TrustKycUrl.personalDetail,
      body: dataq,
    );

    var data = NetworkUtility.responseHandler(response);
    print("================45655 $data");
    if (response.statusCode == 200) {
      return data;
    }else{
      Fluttertoast.showToast(msg: "something wrong!");
    }
  }

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

  Future<List<AddressProofModel>> addressProof() async {
    List<AddressProofModel> addressList = [];
    print("=================> called");
    await NetworkUtility.checkNetworkStatus();
    var token = await HelperFunctions.getToken();
    var response =
    await TrustKycDioClient(token).get(endpoint: TrustKycUrl.addressProof);
    if (response.statusCode == 200) {
      //final json = jsonDecode(response.data);
      response.data.forEach((element) {
        addressList.add(AddressProofModel.fromJson(element));
      });
    }
    return addressList;
  }

  Future<List<ProfessionModel>> occupation() async {
    List<ProfessionModel> occupationList = [];
    print("=================> called");
    await NetworkUtility.checkNetworkStatus();
    var token = await HelperFunctions.getToken();
    var response =
    await TrustKycDioClient(token).get(endpoint: TrustKycUrl.profession);
    if (response.statusCode == 200) {
      //final json = jsonDecode(response.data);
      response.data.forEach((element) {
        occupationList.add(ProfessionModel.fromJson(element));
      });
    }
    return occupationList;
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
      var response = await dio.post(
          "https://trust-api.trustmony.com/api/v1/proof_image_upload?proof_type=$proofType",
          data: formData,
          options: Options(headers: {
            'accept': 'application/json',
            'authorization': token,
          }));

      if (response.statusCode == 201) {
        await HelperFunctions.saveFrontImage(response.data['front-image']);
        await HelperFunctions.saveBackImage(response.data['back-image']);
        return response;
      } else {
        Fluttertoast.showToast(msg: "Something Went Wrong \n try again");
      }
    } catch (e) {
      print("===========>  $e");
    }
  }

  Future personVerification({required String file}) async {
    String fileName = file.split('/').last;
    print("============fileN $file");
    print("============fileNmmm $fileName");
    try {
      FormData formData = FormData.fromMap({
        "video": await MultipartFile.fromFile(file,
            filename: fileName, contentType: MediaType("image", "mp4")),
      });
      var token = await HelperFunctions.getToken();
      var dio = Dio();
      var response =
      await TrustKycDioClient(token).upload(endpoint: TrustKycUrl.personVerification,data: formData);
      // var response = await dio.post(TrustKycUrl.baseUrl + TrustKycUrl.personVerification,
      //     data: formData,
      //     options: Options(headers: {
      //       'accept': 'application/json',
      //       'authorization': token,
      //     }));
      if (response.statusCode == 201) {
        print("==========0987${response.data['video']}");
        await HelperFunctions.saveProfileImage(response.data['video']);
        return response;
      } else {
        Fluttertoast.showToast(msg: "Something Went Wrong \n try again");
      }
    } catch (e) {
      print("===========>  $e");
    }
  }

  Future<DigiLockerModel?> digiLocker() async {
    await NetworkUtility.checkNetworkStatus();
    var token = await HelperFunctions.getToken();
    var response = await TrustKycDioClient(token)
        .get(endpoint: "${TrustKycUrl.digilocker}?platform=mobile");
    print("========token $token");
    print("lockerResponse: ${response.data}");
    var data = NetworkUtility.responseHandler(response);
    if (response.statusCode == 200) {
      // Fluttertoast.showToast(msg: "200");
      return DigiLockerModel.fromJson(data);
    }
  }

  Future<DigiLockerDetailModel?> getdigiLocker() async {
    await NetworkUtility.checkNetworkStatus();
    var token = await HelperFunctions.getToken();
    var response = await TrustKycDioClient(token).get(
      endpoint: TrustKycUrl.getDigiLocker,
    );
    print("========token $token");
    logger.info("lockerResponse: ${response.data}");
    print("lockerResponse: ${response.data}");
    var data = NetworkUtility.responseHandler(response);
    if (response.statusCode == 200) {
      //Fluttertoast.showToast(msg: "Details found");
    }
    return DigiLockerDetailModel.fromJson(data);
  }

  Future<PanStatusModel?> getPanCard(String panCard) async {
    print(panCard);
    await NetworkUtility.checkNetworkStatus();
    var token = await HelperFunctions.getToken();
    var response = await TrustKycDioClient(token)
        .get(endpoint: "${TrustKycUrl.getPANCard}?pan_no=$panCard");
    print("pandata: ${response.data}");
    var data = NetworkUtility.responseHandler(response);
    if (response.statusCode == 200) {
      // Fluttertoast.showToast(msg: "200");
    }
    return PanStatusModel.fromJson(data);
  }

  Future<CodeVerificationModel?> getVerificationCode() async {
    await NetworkUtility.checkNetworkStatus();
    var token = await HelperFunctions.getToken();
    var response = await TrustKycDioClient(token)
        .get(endpoint: TrustKycUrl.getVideoVerificationCode);
    print("pandata: ${response.data}");
    var data = NetworkUtility.responseHandler(response);
    if (response.statusCode == 200) {}
    return CodeVerificationModel.fromJson(data);
  }

  Future<VerifyEmailModel?> verifyEmail(
      String email,
      bool isVerified) async {
    final Map<String, dynamic> dataq = Map<String, dynamic>();
    dataq["email_id"] = email;
    dataq["is_verified"] = isVerified;
    await NetworkUtility.checkNetworkStatus();
    var token = await HelperFunctions.getToken();
    var response = await TrustKycDioClient(token)
        .post(endpoint: TrustKycUrl.verifyEmail, body: dataq);
    print("verifyEmail: ${response.data}");
    var data = NetworkUtility.responseHandler(response);
    if (response.statusCode == 200) {
      Fluttertoast.showToast(msg:response.data["message"],);
    }
    return VerifyEmailModel.fromJson(data);
  }
}
