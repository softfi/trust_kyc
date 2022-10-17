// To parse this JSON data, do
//
//     final bornModel = bornModelFromJson(jsonString);

import 'dart:convert';

List<BornModel> bornModelFromJson(String str) => List<BornModel>.from(json.decode(str).map((x) => BornModel.fromJson(x)));

String bornModelToJson(List<BornModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BornModel {
  BornModel({
    required this.countryName,
    required this.whereYouBornId,
  });

  String countryName;
  int whereYouBornId;

  factory BornModel.fromJson(Map<String, dynamic> json) => BornModel(
    countryName: json["country_name"],
    whereYouBornId: json["where_you_born_id"],
  );

  Map<String, dynamic> toJson() => {
    "country_name": countryName,
    "where_you_born_id": whereYouBornId,
  };
}
