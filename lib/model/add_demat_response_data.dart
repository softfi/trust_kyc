
import 'dart:convert';

AddDematDetailModel addDematDetailModelFromJson(String str) => AddDematDetailModel.fromJson(json.decode(str));

String addDematDetailModelToJson(AddDematDetailModel data) => json.encode(data.toJson());

class AddDematDetailModel {
  AddDematDetailModel({
    required this.message,
  });

  String message;

  factory AddDematDetailModel.fromJson(Map<String, dynamic> json) => AddDematDetailModel(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
