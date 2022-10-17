// To parse this JSON data, do
//
//     final otpVerifyModel = otpVerifyModelFromJson(jsonString);

import 'dart:convert';

OtpVerifyModel otpVerifyModelFromJson(String str) => OtpVerifyModel.fromJson(json.decode(str));

String otpVerifyModelToJson(OtpVerifyModel data) => json.encode(data.toJson());

class OtpVerifyModel {
  OtpVerifyModel({
   required this.customerId,
   required this.firstName,
   required this.lastName,
   required this.message,
   required this.refreshToken,
   required this.token,
  });

  String customerId;
  String firstName;
  String lastName;
  String message;
  String refreshToken;
  String token;

  factory OtpVerifyModel.fromJson(Map<String, dynamic> json) => OtpVerifyModel(
    customerId: json["customer_id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    message: json["message"],
    refreshToken: json["refresh_token"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "customer_id": customerId,
    "first_name": firstName,
    "last_name": lastName,
    "message": message,
    "refresh_token": refreshToken,
    "token": token,
  };
}
