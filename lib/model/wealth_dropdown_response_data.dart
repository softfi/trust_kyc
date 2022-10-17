// To parse this JSON data, do
//
//     final wealthModel = wealthModelFromJson(jsonString);

import 'dart:convert';

List<WealthModel> wealthModelFromJson(String str) => List<WealthModel>.from(json.decode(str).map((x) => WealthModel.fromJson(x)));

String wealthModelToJson(List<WealthModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WealthModel {
  WealthModel({
    required this.primarySourceOfWealthId,
    required this.primarySourceOfWealthName,
  });

  int primarySourceOfWealthId;
  String primarySourceOfWealthName;

  factory WealthModel.fromJson(Map<String, dynamic> json) => WealthModel(
    primarySourceOfWealthId: json["primary_source_of_wealth_id"],
    primarySourceOfWealthName: json["primary_source_of_wealth_name"],
  );

  Map<String, dynamic> toJson() => {
    "primary_source_of_wealth_id": primarySourceOfWealthId,
    "primary_source_of_wealth_name": primarySourceOfWealthName,
  };
}
