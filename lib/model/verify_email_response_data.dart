

import 'dart:convert';

VerifyEmailModel verifyEmailModelFromJson(String str) => VerifyEmailModel.fromJson(json.decode(str));

String verifyEmailModelToJson(VerifyEmailModel data) => json.encode(data.toJson());

class VerifyEmailModel {
  VerifyEmailModel({
    required this.emailId,
    required this.isEmailVerified,
    required this.message,
  });

  String emailId;
  int isEmailVerified;
  String message;

  factory VerifyEmailModel.fromJson(Map<String, dynamic> json) => VerifyEmailModel(
    emailId: json["email_id"],
    isEmailVerified: json["is_email_verified"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "email_id": emailId,
    "is_email_verified": isEmailVerified,
    "message": message,
  };
}
