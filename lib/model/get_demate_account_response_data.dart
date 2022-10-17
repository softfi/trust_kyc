// To parse this JSON data, do
//
//     final dematDetailModel = dematDetailModelFromJson(jsonString);

import 'dart:convert';

List<DematDetailModel> dematDetailModelFromJson(String str) => List<DematDetailModel>.from(json.decode(str).map((x) => DematDetailModel.fromJson(x)));

String dematDetailModelToJson(List<DematDetailModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DematDetailModel {
  DematDetailModel({
    required this.bornPlace,
    required this.checkBoxAccountStatementElectronic,
    required this.checkBoxTermsSelected,
    required this.column1,
    required this.column2,
    required this.countryCode,
    required this.dematAccountDetailsCreatedAt,
    required this.dematAccountDetailsUpdatedAt,
    required this.dematSignatureImage,
    required this.dpAccountNumber,
    required this.dpResidentIndia,
    required this.dpResidentUsa,
    required this.ekycApplicationStatus,
    required this.emailId,
    required this.fatherOrHusbandName,
    required this.fname,
    required this.id,
    required this.isEmailVerified,
    required this.isMobileVerified,
    required this.lname,
    required this.mobileNumber,
    required this.primarySource,
    required this.suffix,
    required this.title,
    required this.userId,
  });

  String bornPlace;
  int checkBoxAccountStatementElectronic;
  int checkBoxTermsSelected;
  dynamic column1;
  dynamic column2;
  String countryCode;
  DateTime dematAccountDetailsCreatedAt;
  DateTime dematAccountDetailsUpdatedAt;
  String dematSignatureImage;
  String dpAccountNumber;
  int dpResidentIndia;
  int dpResidentUsa;
  dynamic ekycApplicationStatus;
  String emailId;
  dynamic fatherOrHusbandName;
  String fname;
  int id;
  int isEmailVerified;
  int isMobileVerified;
  String lname;
  String mobileNumber;
  String primarySource;
  dynamic suffix;
  dynamic title;
  int userId;

  factory DematDetailModel.fromJson(Map<String, dynamic> json) => DematDetailModel(
    bornPlace: json["born_place"],
    checkBoxAccountStatementElectronic: json["check_box_account_statement_electronic"],
    checkBoxTermsSelected: json["check_box_terms_selected"],
    column1: json["column_1"],
    column2: json["column_2"],
    countryCode: json["country_code"],
    dematAccountDetailsCreatedAt: DateTime.parse(json["demat_account_details_created_at"]),
    dematAccountDetailsUpdatedAt: DateTime.parse(json["demat_account_details_updated_at"]),
    dematSignatureImage: json["demat_signature_image"],
    dpAccountNumber: json["dp_account_number"] == null ? null : json["dp_account_number"],
    dpResidentIndia: json["dp_resident_india"],
    dpResidentUsa: json["dp_resident_usa"],
    ekycApplicationStatus: json["ekyc_application_status"],
    emailId: json["email_id"],
    fatherOrHusbandName: json["father_or_husband_name"],
    fname: json["fname"],
    id: json["id"],
    isEmailVerified: json["is_email_verified"],
    isMobileVerified: json["is_mobile_verified"],
    lname: json["lname"],
    mobileNumber: json["mobile_number"],
    primarySource: json["primary_source"],
    suffix: json["suffix"],
    title: json["title"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "born_place": bornPlace,
    "check_box_account_statement_electronic": checkBoxAccountStatementElectronic,
    "check_box_terms_selected": checkBoxTermsSelected,
    "column_1": column1,
    "column_2": column2,
    "country_code": countryCode,
    "demat_account_details_created_at": dematAccountDetailsCreatedAt.toIso8601String(),
    "demat_account_details_updated_at": dematAccountDetailsUpdatedAt.toIso8601String(),
    "demat_signature_image": dematSignatureImage,
    "dp_account_number": dpAccountNumber == null ? null : dpAccountNumber,
    "dp_resident_india": dpResidentIndia,
    "dp_resident_usa": dpResidentUsa,
    "ekyc_application_status": ekycApplicationStatus,
    "email_id": emailId,
    "father_or_husband_name": fatherOrHusbandName,
    "fname": fname,
    "id": id,
    "is_email_verified": isEmailVerified,
    "is_mobile_verified": isMobileVerified,
    "lname": lname,
    "mobile_number": mobileNumber,
    "primary_source": primarySource,
    "suffix": suffix,
    "title": title,
    "user_id": userId,
  };
}
