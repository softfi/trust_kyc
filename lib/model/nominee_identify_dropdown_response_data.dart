// To parse this JSON data, do
//
//     final nomineeIdentyModel = nomineeIdentyModelFromJson(jsonString);

import 'dart:convert';

List<NomineeIdentyModel> nomineeIdentyModelFromJson(String str) => List<NomineeIdentyModel>.from(json.decode(str).map((x) => NomineeIdentyModel.fromJson(x)));

String nomineeIdentyModelToJson(List<NomineeIdentyModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NomineeIdentyModel {
  NomineeIdentyModel({
    required this.addressProof,
    required this.nomineeIdentificationId,
  });

  String addressProof;
  int nomineeIdentificationId;

  factory NomineeIdentyModel.fromJson(Map<String, dynamic> json) => NomineeIdentyModel(
    addressProof: json["address_proof"],
    nomineeIdentificationId: json["nominee_identification_id"],
  );

  Map<String, dynamic> toJson() => {
    "address_proof": addressProof,
    "nominee_identification_id": nomineeIdentificationId,
  };
}
