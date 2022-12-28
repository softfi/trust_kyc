// To parse this JSON data, do
//
//     final allDematAccountModel = allDematAccountModelFromJson(jsonString);

import 'dart:convert';

AllDematAccountModel allDematAccountModelFromJson(String str) => AllDematAccountModel.fromJson(json.decode(str));

String allDematAccountModelToJson(AllDematAccountModel data) => json.encode(data.toJson());

class AllDematAccountModel {
  AllDematAccountModel({
    required this.existDemat,
    required this.newDemat,
  });

  List<ExistDemat> existDemat;
  List<NewDemat> newDemat;

  factory AllDematAccountModel.fromJson(Map<String, dynamic> json) => AllDematAccountModel(
    existDemat: List<ExistDemat>.from(json["exist_demat"].map((x) => ExistDemat.fromJson(x))),
    newDemat: List<NewDemat>.from(json["new_demat"].map((x) => NewDemat.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "exist_demat": List<dynamic>.from(existDemat.map((x) => x.toJson())),
    "new_demat": List<dynamic>.from(newDemat.map((x) => x.toJson())),
  };
}

class ExistDemat {
  ExistDemat({
    required this.beneficiaryId,
    required this.clientId,
    required this.depository,
    required this.dpId,
    required this.dpName,
    required this.existDematAccountDetailsCreatedAt,
    required this.existDematAccountDetailsStatusKey,
    required this.existDematAccountDetailsUpdatedAt,
    required this.existDematAccountPrimaryAccount,
    required this.existDematId,
    required this.existDepositoryNameId,
    required this.fname,
    required this.lname,
    required this.userId,
    this.isEnable = true,
  });

  String beneficiaryId;
  String clientId;
  dynamic depository;
  String dpId;
  String dpName;
  DateTime existDematAccountDetailsCreatedAt;
  int existDematAccountDetailsStatusKey;
  DateTime existDematAccountDetailsUpdatedAt;
  dynamic existDematAccountPrimaryAccount;
  dynamic existDematId;
  int existDepositoryNameId;
  String fname;
  String lname;
  int userId;
  bool isEnable;

  factory ExistDemat.fromJson(Map<String, dynamic> json) => ExistDemat(
    beneficiaryId: json["beneficiary_id"],
    clientId: json["client_id"],
    depository: json["depository"],
    dpId: json["dp_id"],
    dpName: json["dp_name"],
    existDematAccountDetailsCreatedAt: DateTime.parse(json["exist_demat_account_details_created_at"]),
    existDematAccountDetailsStatusKey: json["exist_demat_account_details_status_key"],
    existDematAccountDetailsUpdatedAt: DateTime.parse(json["exist_demat_account_details_updated_at"]),
    existDematAccountPrimaryAccount: json["exist_demat_account_primary_account"],
    existDematId: json["exist_demat_id"],
    existDepositoryNameId: json["exist_depository_name_id"],
    fname: json["fname"],
    lname: json["lname"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "beneficiary_id": beneficiaryId,
    "client_id": clientId,
    "depository": depository,
    "dp_id": dpId,
    "dp_name": dpName,
    "exist_demat_account_details_created_at": existDematAccountDetailsCreatedAt.toIso8601String(),
    "exist_demat_account_details_status_key": existDematAccountDetailsStatusKey,
    "exist_demat_account_details_updated_at": existDematAccountDetailsUpdatedAt.toIso8601String(),
    "exist_demat_account_primary_account": existDematAccountPrimaryAccount,
    "exist_demat_id": existDematId,
    "exist_depository_name_id": existDepositoryNameId,
    "fname": fname,
    "lname": lname,
    "user_id": userId,
  };
}

class NewDemat {
  NewDemat({
    required this.bornPlace,
    required this.checkBoxAccountStatementElectronic,
    required this.checkBoxTermsSelected,
    required this.dematAccountDetailsCreatedAt,
    required this.dematAccountDetailsStatus,
    required this.dematAccountDetailsUpdatedAt,
    required this.dematAccountPrimaryAccount,
    required this.dematSignatureImage,
    required this.depository,
    required this.dpAccountNumber,
    required this.dpResidentIndia,
    required this.dpResidentUsa,
    required this.fname,
    required this.lname,
    required this.newDematId,
    required this.newDepositoryNameId,
    required this.primarySource,
    required this.userId,
    this.isEnable = true,
  });

  String bornPlace;
  int checkBoxAccountStatementElectronic;
  int checkBoxTermsSelected;
  DateTime dematAccountDetailsCreatedAt;
  int dematAccountDetailsStatus;
  dynamic dematAccountDetailsUpdatedAt;
  dynamic dematAccountPrimaryAccount;
  String dematSignatureImage;
  String depository;
  String dpAccountNumber;
  int dpResidentIndia;
  int dpResidentUsa;
  String fname;
  String lname;
  dynamic newDematId;
  int newDepositoryNameId;
  String primarySource;
  int userId;
  bool isEnable;

  factory NewDemat.fromJson(Map<String, dynamic> json) => NewDemat(
    bornPlace: json["born_place"],
    checkBoxAccountStatementElectronic: json["check_box_account_statement_electronic"],
    checkBoxTermsSelected: json["check_box_terms_selected"],
    dematAccountDetailsCreatedAt: DateTime.parse(json["demat_account_details_created_at"]),
    dematAccountDetailsStatus: json["demat_account_details_status"],
    dematAccountDetailsUpdatedAt: json["demat_account_details_updated_at"],
    dematAccountPrimaryAccount: json["demat_account_primary_account"],
    dematSignatureImage: json["demat_signature_image"],
    depository: json["depository"],
    dpAccountNumber: json["dp_account_number"],
    dpResidentIndia: json["dp_resident_india"],
    dpResidentUsa: json["dp_resident_usa"],
    fname: json["fname"],
    lname: json["lname"],
    newDematId: json["new_demat_id"],
    newDepositoryNameId: json["new_depository_name_id"],
    primarySource: json["primary_source"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "born_place": bornPlace,
    "check_box_account_statement_electronic": checkBoxAccountStatementElectronic,
    "check_box_terms_selected": checkBoxTermsSelected,
    "demat_account_details_created_at": dematAccountDetailsCreatedAt.toIso8601String(),
    "demat_account_details_status": dematAccountDetailsStatus,
    "demat_account_details_updated_at": dematAccountDetailsUpdatedAt,
    "demat_account_primary_account": dematAccountPrimaryAccount,
    "demat_signature_image": dematSignatureImage,
    "depository": depository,
    "dp_account_number": dpAccountNumber,
    "dp_resident_india": dpResidentIndia,
    "dp_resident_usa": dpResidentUsa,
    "fname": fname,
    "lname": lname,
    "new_demat_id": newDematId,
    "new_depository_name_id": newDepositoryNameId,
    "primary_source": primarySource,
    "user_id": userId,
  };
}
