// To parse this JSON data, do
//
//     final veryotpLoginModule = veryotpLoginModuleFromJson(jsonString);

import 'dart:convert';

VeryotpLoginModule veryotpLoginModuleFromJson(String str) => VeryotpLoginModule.fromJson(json.decode(str));

String veryotpLoginModuleToJson(VeryotpLoginModule data) => json.encode(data.toJson());

class VeryotpLoginModule {
  VeryotpLoginModule({
    required this.customerId,
    required this.fullName,
    required this.message,
    required this.refreshToken,
    required this.token,
  });

  String customerId;
  String fullName;
  String message;
  String refreshToken;
  String token;

  factory VeryotpLoginModule.fromJson(Map<String, dynamic> json) => VeryotpLoginModule(
    customerId: json["customer_id"],
    fullName: json["full_name"],
    message: json["message"],
    refreshToken: json["refresh_token"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "customer_id": customerId,
    "full_name": fullName,
    "message": message,
    "refresh_token": refreshToken,
    "token": token,
  };
}
