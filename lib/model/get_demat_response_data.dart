// To parse this JSON data, do
//
//     final dematDetailModel = dematDetailModelFromJson(jsonString);

import 'dart:convert';

ExistingDematDetailModel dematDetailModelFromJson(String str) => ExistingDematDetailModel.fromJson(json.decode(str));

String dematDetailModelToJson(ExistingDematDetailModel data) => json.encode(data.toJson());

class ExistingDematDetailModel {
  ExistingDematDetailModel({
   required this.applicationNumber,
   required this.beneficiaryId,
   required this.countryCode,
   required this.depository,
   required this.dpId,
   required this.dpName,
   required this.ekycApplicationStatus,
   required this.emailId,
   required this.existDematAccountDetailsCreatedAt,
   required this.existDematAccountDetailsUpdatedAt,
   required this.fatherOrHusbandName,
   required this.fname,
   required this.id,
   required this.isEmailVerified,
   required this.isMobileVerified,
   required this.lname,
   required this.mobileNumber,
   required this.suffix,
   required this.title,
   required this.userId,
  });

  dynamic applicationNumber;
  String beneficiaryId;
  String countryCode;
  String depository;
  String dpId;
  String dpName;
  dynamic ekycApplicationStatus;
  String emailId;
  dynamic existDematAccountDetailsCreatedAt;
  dynamic existDematAccountDetailsUpdatedAt;
  dynamic fatherOrHusbandName;
  String fname;
  int id;
  int isEmailVerified;
  int isMobileVerified;
  String lname;
  String mobileNumber;
  dynamic suffix;
  dynamic title;
  int userId;

  factory ExistingDematDetailModel.fromJson(Map<String, dynamic> json) => ExistingDematDetailModel(
    applicationNumber: json["application_number"],
    beneficiaryId: json["beneficiary_id"],
    countryCode: json["country_code"],
    depository: json["depository"],
    dpId: json["dp_id"],
    dpName: json["dp_name"],
    ekycApplicationStatus: json["ekyc_application_status"],
    emailId: json["email_id"],
    existDematAccountDetailsCreatedAt: json["exist_demat_account_details_created_at"],
    existDematAccountDetailsUpdatedAt: json["exist_demat_account_details_updated_at"],
    fatherOrHusbandName: json["father_or_husband_name"],
    fname: json["fname"],
    id: json["id"],
    isEmailVerified: json["is_email_verified"],
    isMobileVerified: json["is_mobile_verified"],
    lname: json["lname"],
    mobileNumber: json["mobile_number"],
    suffix: json["suffix"],
    title: json["title"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "application_number": applicationNumber,
    "beneficiary_id": beneficiaryId,
    "country_code": countryCode,
    "depository": depository,
    "dp_id": dpId,
    "dp_name": dpName,
    "ekyc_application_status": ekycApplicationStatus,
    "email_id": emailId,
    "exist_demat_account_details_created_at": existDematAccountDetailsCreatedAt,
    "exist_demat_account_details_updated_at": existDematAccountDetailsUpdatedAt,
    "father_or_husband_name": fatherOrHusbandName,
    "fname": fname,
    "id": id,
    "is_email_verified": isEmailVerified,
    "is_mobile_verified": isMobileVerified,
    "lname": lname,
    "mobile_number": mobileNumber,
    "suffix": suffix,
    "title": title,
    "user_id": userId,
  };
}
