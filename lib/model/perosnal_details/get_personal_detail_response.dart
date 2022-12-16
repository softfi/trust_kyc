// To parse this JSON data, do
//
//     final getPersonalDetailModel = getPersonalDetailModelFromJson(jsonString);

import 'dart:convert';

GetPersonalDetailModel getPersonalDetailModelFromJson(String str) => GetPersonalDetailModel.fromJson(json.decode(str));

String getPersonalDetailModelToJson(GetPersonalDetailModel data) => json.encode(data.toJson());

class GetPersonalDetailModel {
  GetPersonalDetailModel({
    this.aadharName,
    this.aadharNumber,
    required this.addressCity,
    required this.addressLine1,
    required this.addressLine2,
    required this.addressLine3,
    required this.addressState,
    required this.addressStateCode,
    required this.addressZip,
    required this.annualIncome,
    required this.bankAccountCount,
    required this.checkBoxShareDataWithCompany,
    required this.checkBoxShareDataWithGovt,
    required this.citySequenceNo,
    required this.countryCode,
    this.customerType,
    required this.dob,
    this.ekycApplicationStatus,
    this.emailId,
    required this.existingDematAccountCount,
    required this.filledItrLast2Years,
    required this.firstname,
    required this.fname,
    required this.gender,
    required this.inPersonVerification,
    this.inPersonVerificationRemarks,
    this.isAadharVerified,
    required this.isEmailVerified,
    required this.isMobileVerified,
    this.isPanVerified,
    required this.isPoliticallyExposed,
    this.kraStatus,
    required this.lastname,
    required this.lname,
    required this.marriedStatus,
    required this.mobileNumber,
    required this.mothersMaidenName,
    required this.newDematAccountCount,
    required this.occupation,
    this.panName,
    this.panNumber,
    required this.profileImage,
    required this.proofBackImage,
    required this.proofFrontImage,
    required this.proofType,
    required this.tradingExperience,
    required this.verificationVideo,
    required this.wouldYouLikeToActivate,
  });

  dynamic aadharName;
  dynamic aadharNumber;
  String addressCity;
  String addressLine1;
  String addressLine2;
  String addressLine3;
  String addressState;
  String addressStateCode;
  String addressZip;
  int annualIncome;
  int bankAccountCount;
  int checkBoxShareDataWithCompany;
  int checkBoxShareDataWithGovt;
  String citySequenceNo;
  String countryCode;
  dynamic customerType;
   DateTime dob;
  dynamic ekycApplicationStatus;
  dynamic emailId;
  int existingDematAccountCount;
  int filledItrLast2Years;
  String firstname;
  String fname;
  int gender;
  int inPersonVerification;
  dynamic inPersonVerificationRemarks;
  dynamic isAadharVerified;
  int isEmailVerified;
  int isMobileVerified;
  dynamic isPanVerified;
  int isPoliticallyExposed;
  dynamic kraStatus;
  String lastname;
  String lname;
  int marriedStatus;
  String mobileNumber;
  String mothersMaidenName;
  int newDematAccountCount;
  String occupation;
  dynamic panName;
  dynamic panNumber;
  String profileImage;
  String proofBackImage;
  String proofFrontImage;
  String proofType;
  int tradingExperience;
  String verificationVideo;
  int wouldYouLikeToActivate;

  factory GetPersonalDetailModel.fromJson(Map<String, dynamic> json) => GetPersonalDetailModel(
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
    bankAccountCount: json["bank_account_count"],
    checkBoxShareDataWithCompany: json["check_box_share_data_with_company"],
    checkBoxShareDataWithGovt: json["check_box_share_data_with_govt"],
    citySequenceNo: json["city_sequence_no"],
    countryCode: json["country_code"],
    customerType: json["customer_type"],
   dob: DateTime.parse(json["dob"] ?? ""),
    ekycApplicationStatus: json["ekyc_application_status"],
    emailId: json["email_id"],
    existingDematAccountCount: json["existing_demat_account_count"],
    filledItrLast2Years: json["filled_itr_last_2years"],
    firstname: json["firstname"],
    fname: json["fname"],
    gender: json["gender"],
    inPersonVerification: json["in_person_verification"],
    inPersonVerificationRemarks: json["in_person_verification_remarks"],
    isAadharVerified: json["is_aadhar_verified"],
    isEmailVerified: json["is_email_verified"],
    isMobileVerified: json["is_mobile_verified"],
    isPanVerified: json["is_pan_verified"],
    isPoliticallyExposed: json["is_politically_exposed"],
    kraStatus: json["kra_status"],
    lastname: json["lastname"],
    lname: json["lname"],
    marriedStatus: json["married_status"],
    mobileNumber: json["mobile_number"],
    mothersMaidenName: json["mothers_maiden_name"],
    newDematAccountCount: json["new_demat_account_count"],
    occupation: json["occupation"],
    panName: json["pan_name"],
    panNumber: json["pan_number"],
    profileImage: json["profile_image"],
    proofBackImage: json["proof_back_image"],
    proofFrontImage: json["proof_front_image"],
    proofType: json["proof_type"],
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
    "bank_account_count": bankAccountCount,
    "check_box_share_data_with_company": checkBoxShareDataWithCompany,
    "check_box_share_data_with_govt": checkBoxShareDataWithGovt,
    "city_sequence_no": citySequenceNo,
    "country_code": countryCode,
    "customer_type": customerType,
   "dob": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
    "ekyc_application_status": ekycApplicationStatus,
    "email_id": emailId,
    "existing_demat_account_count": existingDematAccountCount,
    "filled_itr_last_2years": filledItrLast2Years,
    "firstname": firstname,
    "fname": fname,
    "gender": gender,
    "in_person_verification": inPersonVerification,
    "in_person_verification_remarks": inPersonVerificationRemarks,
    "is_aadhar_verified": isAadharVerified,
    "is_email_verified": isEmailVerified,
    "is_mobile_verified": isMobileVerified,
    "is_pan_verified": isPanVerified,
    "is_politically_exposed": isPoliticallyExposed,
    "kra_status": kraStatus,
    "lastname": lastname,
    "lname": lname,
    "married_status": marriedStatus,
    "mobile_number": mobileNumber,
    "mothers_maiden_name": mothersMaidenName,
    "new_demat_account_count": newDematAccountCount,
    "occupation": occupation,
    "pan_name": panName,
    "pan_number": panNumber,
    "profile_image": profileImage,
    "proof_back_image": proofBackImage,
    "proof_front_image": proofFrontImage,
    "proof_type": proofType,
    "trading_experience": tradingExperience,
    "verification_video": verificationVideo,
    "would_you_like_to_activate": wouldYouLikeToActivate,
  };
}
