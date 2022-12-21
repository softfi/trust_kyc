// To parse this JSON data, do
//
//     final professionModel = professionModelFromJson(jsonString);

import 'dart:convert';

List<ProfessionModel> professionModelFromJson(String str) => List<ProfessionModel>.from(json.decode(str).map((x) => ProfessionModel.fromJson(x)));

String professionModelToJson(List<ProfessionModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProfessionModel {
  ProfessionModel({
 required  this.id,
 required  this.professionName,
  });

  int id;
  String professionName;

  factory ProfessionModel.fromJson(Map<String, dynamic> json) => ProfessionModel(
    id: json["id"],
    professionName: json["profession_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "profession_name": professionName,
  };
}
