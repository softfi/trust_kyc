

import 'dart:convert';

AddNomineeModel addNomineeModelFromJson(String str) => AddNomineeModel.fromJson(json.decode(str));

String addNomineeModelToJson(AddNomineeModel data) => json.encode(data.toJson());

class AddNomineeModel {
  AddNomineeModel({
    required this.message,
  });

  String message;
  factory AddNomineeModel.fromJson(Map<String, dynamic> json) => AddNomineeModel(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
