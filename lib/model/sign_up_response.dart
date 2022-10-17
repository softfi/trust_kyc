
import 'dart:convert';

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  SignUpModel({
    required this.hashKey,
    required this.message,
  });

  String hashKey;
  String message;

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
    hashKey: json["hash_key"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "hash_key": hashKey,
    "message": message,
  };
}
