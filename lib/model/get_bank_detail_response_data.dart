// To parse this JSON data, do
//
//     final bankDetailModel = bankDetailModelFromJson(jsonString);

import 'dart:convert';

List<BankDetailModel> bankDetailModelFromJson(String str) => List<BankDetailModel>.from(json.decode(str).map((x) => BankDetailModel.fromJson(x)));

String bankDetailModelToJson(List<BankDetailModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BankDetailModel {
  BankDetailModel({
    required this.accountNumber,
    required this.accountType1,
    required this.accountType2,
    required this.bankAccountType,
    required this.bankDetailsId,
    required this.bankDetailsStatus,
    required this.bankName,
    required this.branchAddress,
    required this.branchName,
    required this.ifscCode,
    required this.isBankAccountVerified,
    required this.isPrimary,
    this.isEnable = true,
  });

  String accountNumber;
  int accountType1;
  int accountType2;
  int bankAccountType;
  int bankDetailsId;
  int bankDetailsStatus;
  String bankName;
  String branchAddress;
  String branchName;
  String ifscCode;
  int isBankAccountVerified;
  int isPrimary;
  bool isEnable;

  factory BankDetailModel.fromJson(Map<String, dynamic> json) => BankDetailModel(
    accountNumber: json["account_number"],
    accountType1: json["account_type_1"],
    accountType2: json["account_type_2"],
    bankAccountType: json["bank_account_type"],
    bankDetailsId: json["bank_details_id"],
    bankDetailsStatus: json["bank_details_status"],
    bankName: json["bank_name"],
    branchAddress: json["branch_address"],
    branchName: json["branch_name"],
    ifscCode: json["ifsc_code"],
    isBankAccountVerified: json["is_bank_account_verified"],
    isPrimary: json["is_primary"],
  );

  Map<String, dynamic> toJson() => {
    "account_number": accountNumber,
    "account_type_1": accountType1,
    "account_type_2": accountType2,
    "bank_account_type": bankAccountType,
    "bank_details_id": bankDetailsId,
    "bank_details_status": bankDetailsStatus,
    "bank_name": bankName,
    "branch_address": branchAddress,
    "branch_name": branchName,
    "ifsc_code": ifscCode,
    "is_bank_account_verified": isBankAccountVerified,
    "is_primary": isPrimary,
  };
}
