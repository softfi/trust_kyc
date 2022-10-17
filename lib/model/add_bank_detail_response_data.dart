
import 'dart:convert';

AddBankDetailModel addBankDetailModelFromJson(String str) => AddBankDetailModel.fromJson(json.decode(str));

String addBankDetailModelToJson(AddBankDetailModel data) => json.encode(data.toJson());

class AddBankDetailModel {
  AddBankDetailModel({
    required this.message,
  });
  String message;
  factory AddBankDetailModel.fromJson(Map<String, dynamic> json) => AddBankDetailModel(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
