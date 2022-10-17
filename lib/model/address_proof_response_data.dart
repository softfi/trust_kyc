// To parse this JSON data, do
//
//     final addressProofModel = addressProofModelFromJson(jsonString);

import 'dart:convert';

List<AddressProofModel> addressProofModelFromJson(String str) => List<AddressProofModel>.from(json.decode(str).map((x) => AddressProofModel.fromJson(x)));

String addressProofModelToJson(List<AddressProofModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AddressProofModel {
  AddressProofModel({
    required this.addressProof,
  });

  String addressProof;

  factory AddressProofModel.fromJson(Map<String, dynamic> json) => AddressProofModel(
    addressProof: json["address_proof"],
  );

  Map<String, dynamic> toJson() => {
    "address_proof": addressProof,
  };
}
