// To parse this JSON data, do
//
//     final deleteDematDetailModel = deleteDematDetailModelFromJson(jsonString);

import 'dart:convert';

DeleteDematDetailModel deleteDematDetailModelFromJson(String str) => DeleteDematDetailModel.fromJson(json.decode(str));

String deleteDematDetailModelToJson(DeleteDematDetailModel data) => json.encode(data.toJson());

class DeleteDematDetailModel {
  DeleteDematDetailModel({
    required this.message,
  });

  String message;

  factory DeleteDematDetailModel.fromJson(Map<String, dynamic> json) => DeleteDematDetailModel(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
