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
    required this.depository,
    required this.dpId,
    required this.dpName,
    required this.existDematAccountDetailsCreatedAt,
    required this.existDematAccountDetailsStatusKey,
    required this.existDematAccountDetailsUpdatedAt,
    required this.id,
    this.isEnable = true,
  });

  String beneficiaryId;
  String depository;
  String dpId;
  String dpName;
  DateTime existDematAccountDetailsCreatedAt;
  int existDematAccountDetailsStatusKey;
  DateTime existDematAccountDetailsUpdatedAt;
  int id;
  bool isEnable;

  factory ExistDemat.fromJson(Map<String, dynamic> json) => ExistDemat(
    beneficiaryId: json["beneficiary_id"],
    depository: json["depository"],
    dpId: json["dp_id"],
    dpName: json["dp_name"],
    existDematAccountDetailsCreatedAt: DateTime.parse(json["exist_demat_account_details_created_at"]),
    existDematAccountDetailsStatusKey: json["exist_demat_account_details_status_key"],
    existDematAccountDetailsUpdatedAt: DateTime.parse(json["exist_demat_account_details_updated_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "beneficiary_id": beneficiaryId,
    "depository": depository,
    "dp_id": dpId,
    "dp_name": dpName,
    "exist_demat_account_details_created_at": existDematAccountDetailsCreatedAt.toIso8601String(),
    "exist_demat_account_details_status_key": existDematAccountDetailsStatusKey,
    "exist_demat_account_details_updated_at": existDematAccountDetailsUpdatedAt.toIso8601String(),
    "id": id,
  };
}

class NewDemat {
  NewDemat({
    required this.bornPlace,
    required this.checkBoxAccountStatementElectronic,
    required this.checkBoxTermsSelected,
    required this.column2,
    required this.dematAccountDetailsCreatedAt,
    required this.dematAccountDetailsStatus,
    required this.dematAccountDetailsUpdatedAt,
    required this.dematSignatureImage,
    required this.dpAccountNumber,
    required this.dpResidentIndia,
    required this.dpResidentUsa,
    required this.id,
    required this.primarySource,
    required this.userId,
    this.isEnable = true,
  });

  String bornPlace;
  int checkBoxAccountStatementElectronic;
  int checkBoxTermsSelected;
  dynamic column2;
  DateTime dematAccountDetailsCreatedAt;
  dynamic dematAccountDetailsStatus;
  DateTime dematAccountDetailsUpdatedAt;
  String dematSignatureImage;
  String dpAccountNumber;
  int dpResidentIndia;
  int dpResidentUsa;
  int id;
  String primarySource;
  int userId;
  bool isEnable;
  factory NewDemat.fromJson(Map<String, dynamic> json) => NewDemat(
    bornPlace: json["born_place"],
    checkBoxAccountStatementElectronic: json["check_box_account_statement_electronic"],
    checkBoxTermsSelected: json["check_box_terms_selected"],
    column2: json["column_2"],
    dematAccountDetailsCreatedAt: DateTime.parse(json["demat_account_details_created_at"]),
    dematAccountDetailsStatus: json["demat_account_details_status"],
    dematAccountDetailsUpdatedAt: DateTime.parse(json["demat_account_details_updated_at"]),
    dematSignatureImage: json["demat_signature_image"],
    dpAccountNumber: json["dp_account_number"],
    dpResidentIndia: json["dp_resident_india"],
    dpResidentUsa: json["dp_resident_usa"],
    id: json["id"],
    primarySource: json["primary_source"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "born_place": bornPlace,
    "check_box_account_statement_electronic": checkBoxAccountStatementElectronic,
    "check_box_terms_selected": checkBoxTermsSelected,
    "column_2": column2,
    "demat_account_details_created_at": dematAccountDetailsCreatedAt.toIso8601String(),
    "demat_account_details_status": dematAccountDetailsStatus,
    "demat_account_details_updated_at": dematAccountDetailsUpdatedAt.toIso8601String(),
    "demat_signature_image": dematSignatureImage,
    "dp_account_number": dpAccountNumber,
    "dp_resident_india": dpResidentIndia,
    "dp_resident_usa": dpResidentUsa,
    "id": id,
    "primary_source": primarySource,
    "user_id": userId,
  };
}
