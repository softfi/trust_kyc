// To parse this JSON data, do
//
//     final sendOtpEmailModule = sendOtpEmailModuleFromJson(jsonString);

import 'dart:convert';

SendOtpEmailModule sendOtpEmailModuleFromJson(String str) => SendOtpEmailModule.fromJson(json.decode(str));

String sendOtpEmailModuleToJson(SendOtpEmailModule data) => json.encode(data.toJson());

class SendOtpEmailModule {
  SendOtpEmailModule({
    required this.message,
  });

  String message;

  factory SendOtpEmailModule.fromJson(Map<String, dynamic> json) => SendOtpEmailModule(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
