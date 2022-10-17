
import 'dart:convert';

CodeVerificationModel codeVerificationModelFromJson(String str) => CodeVerificationModel.fromJson(json.decode(str));

String codeVerificationModelToJson(CodeVerificationModel data) => json.encode(data.toJson());

class CodeVerificationModel {
  CodeVerificationModel({
    required this.message,
    required this.randomNumber,
  });

  String message;
  String randomNumber;

  factory CodeVerificationModel.fromJson(Map<String, dynamic> json) => CodeVerificationModel(
    message: json["message"],
    randomNumber: json["random_number"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "random_number": randomNumber,
  };
}
