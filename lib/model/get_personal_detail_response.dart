// To parse this JSON data, do
//
//     final getPersonalDetailModel = getPersonalDetailModelFromJson(jsonString);

import 'dart:convert';

GetPersonalDetailModel getPersonalDetailModelFromJson(String str) =>
    GetPersonalDetailModel.fromJson(json.decode(str));

String getPersonalDetailModelToJson(GetPersonalDetailModel data) =>
    json.encode(data.toJson());

class GetPersonalDetailModel {
  GetPersonalDetailModel({
    this.aadharName,
    this.aadharNumber,
    this.addressCity,
    this.addressLine1,
    this.addressLine2,
    this.addressLine3,
    this.addressState,
    this.addressStateCode,
    this.addressZip,
    this.annualIncome,
    this.checkBoxShareDataWithCompany,
    this.checkBoxShareDataWithGovt,
    this.citySequenceNo,
    required this.countryCode,

    this.educationDegree,
    this.emailId,
    this.familyAccount,
    required this.firstname,
    required this.fname,
    this.gender,
    this.geogriphicalCode,
    this.inPersonVerification,
    this.isAadharVerified,
    required this.isEmailVerified,
    required this.isMobileVerified,
    this.isPanVerified,
    this.isPoliticallyExposed,
    required this.lastname,
    this.lifestyle,
    required this.lname,
    required this.dob,
    this.marriedStatus,
    this.mentalDisability,
    required this.mobileNumber,
    this.mothersMaidenName,
    this.occupation,
    this.panName,
    this.panNumber,
    this.profileImage,
    this.proofBackImage,
    this.proofFrontImage,
    this.proofType,
    this.signature,
    this.signatureFileFlag,
    this.smartCardPin,
    this.smartCardNumber,
    this.smartCardRequired,
    this.tradingExperience,
    this.verificationVideo,
    this.wouldYouLikeToActivate,
  });

  dynamic aadharName;
  dynamic aadharNumber;
  dynamic addressCity;
  dynamic addressLine1;
  dynamic addressLine2;
  dynamic addressLine3;
  dynamic addressState;
  dynamic addressStateCode;
  dynamic addressZip;
  dynamic annualIncome;
  dynamic checkBoxShareDataWithCompany;
  dynamic checkBoxShareDataWithGovt;
  dynamic citySequenceNo;
  String countryCode;

  dynamic educationDegree;
  dynamic emailId;
  dynamic familyAccount;
  String firstname;
  String fname;
  dynamic gender;
  dynamic geogriphicalCode;
  dynamic inPersonVerification;
  dynamic isAadharVerified;
  int isEmailVerified;
  int isMobileVerified;
  dynamic isPanVerified;
  dynamic isPoliticallyExposed;
  String lastname;
  dynamic lifestyle;
  String lname;
  String dob;
  dynamic marriedStatus;
  dynamic mentalDisability;
  String mobileNumber;
  dynamic mothersMaidenName;
  dynamic occupation;
  dynamic panName;
  dynamic panNumber;
  dynamic profileImage;
  dynamic proofBackImage;
  dynamic proofFrontImage;
  dynamic proofType;
  dynamic signature;
  dynamic signatureFileFlag;
  dynamic smartCardPin;
  dynamic smartCardNumber;
  dynamic smartCardRequired;
  dynamic tradingExperience;
  dynamic verificationVideo;
  dynamic wouldYouLikeToActivate;

  factory GetPersonalDetailModel.fromJson(Map<String, dynamic> json) =>
      GetPersonalDetailModel(
        aadharName: json["aadhar_name"],
        aadharNumber: json["aadhar_number"],
        addressCity: json["address_city"],
        addressLine1: json["address_line_1"],
        addressLine2: json["address_line_2"],
        addressLine3: json["address_line_3"],
        addressState: json["address_state"],
        addressStateCode: json["address_state_code"],
        addressZip: json["address_zip"],
        annualIncome: json["annual_income"],
        checkBoxShareDataWithCompany: json["check_box_share_data_with_company"],
        checkBoxShareDataWithGovt: json["check_box_share_data_with_govt"],
        citySequenceNo: json["city_sequence_no"],
        countryCode: json["country_code"] == null ? null : json["country_code"],

        educationDegree: json["education_degree"],
        emailId: json["email_id"],
        familyAccount: json["family_account"],
        firstname: json["firstname"] == null ? null : json["firstname"],
        fname: json["fname"] == null ? null : json["fname"],
        gender: json["gender"],
        geogriphicalCode: json["geogriphical_code"],
        inPersonVerification: json["in_person_verification"],
        isAadharVerified: json["is_aadhar_verified"],
        isEmailVerified: json["is_email_verified"] == null
            ? null
            : json["is_email_verified"],
        isMobileVerified: json["is_mobile_verified"] == null
            ? null
            : json["is_mobile_verified"],
        isPanVerified: json["is_pan_verified"],
        isPoliticallyExposed: json["is_politically_exposed"],
        lastname: json["lastname"] == null ? null : json["lastname"],
        dob: json["dob"] == null ? null : json["dob"],
        lifestyle: json["lifestyle"],
        lname: json["lname"] == null ? null : json["lname"],
        marriedStatus: json["married_status"],
        mentalDisability: json["mental_disability"],
        mobileNumber:
            json["mobile_number"] == null ? null : json["mobile_number"],
        mothersMaidenName: json["mothers_maiden_name"],
        occupation: json["occupation"],
        panName: json["pan_name"],
        panNumber: json["pan_number"],
        profileImage: json["profile_image"],
        proofBackImage: json["proof_back_image"],
        proofFrontImage: json["proof_front_image"],
        proofType: json["proof_type"],
        signature: json["signature"],
        signatureFileFlag: json["signature_file_flag"],
        smartCardPin: json["smart_card_PIN"],
        smartCardNumber: json["smart_card_number"],
        smartCardRequired: json["smart_card_required"],
        tradingExperience: json["trading_experience"],
        verificationVideo: json["verification_video"],
        wouldYouLikeToActivate: json["would_you_like_to_activate"],
      );

  Map<String, dynamic> toJson() => {
        "aadhar_name": aadharName,
        "aadhar_number": aadharNumber,
        "address_city": addressCity,
        "address_line_1": addressLine1,
        "address_line_2": addressLine2,
        "address_line_3": addressLine3,
        "address_state": addressState,
        "address_state_code": addressStateCode,
        "address_zip": addressZip,
        "annual_income": annualIncome,
        "check_box_share_data_with_company": checkBoxShareDataWithCompany,
        "check_box_share_data_with_govt": checkBoxShareDataWithGovt,
        "city_sequence_no": citySequenceNo,
        "country_code": countryCode == null ? null : countryCode,

        "education_degree": educationDegree,
        "email_id": emailId,
        "family_account": familyAccount,
        "firstname": firstname == null ? null : firstname,
        "fname": fname == null ? null : fname,
        "dob": dob == null ? null : dob,
        "gender": gender,
        "geogriphical_code": geogriphicalCode,
        "in_person_verification": inPersonVerification,
        "is_aadhar_verified": isAadharVerified,
        "is_email_verified": isEmailVerified == null ? null : isEmailVerified,
        "is_mobile_verified":
            isMobileVerified == null ? null : isMobileVerified,
        "is_pan_verified": isPanVerified,
        "is_politically_exposed": isPoliticallyExposed,
        "lastname": lastname == null ? null : lastname,
        "lifestyle": lifestyle,
        "lname": lname == null ? null : lname,
        "married_status": marriedStatus,
        "mental_disability": mentalDisability,
        "mobile_number": mobileNumber == null ? null : mobileNumber,
        "mothers_maiden_name": mothersMaidenName,
        "occupation": occupation,
        "pan_name": panName,
        "pan_number": panNumber,
        "profile_image": profileImage,
        "proof_back_image": proofBackImage,
        "proof_front_image": proofFrontImage,
        "proof_type": proofType,
        "signature": signature,
        "signature_file_flag": signatureFileFlag,
        "smart_card_PIN": smartCardPin,
        "smart_card_number": smartCardNumber,
        "smart_card_required": smartCardRequired,
        "trading_experience": tradingExperience,
        "verification_video": verificationVideo,
        "would_you_like_to_activate": wouldYouLikeToActivate,
      };
}
