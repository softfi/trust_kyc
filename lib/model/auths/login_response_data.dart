import 'dart:convert';

/// first_name : "Ahahah"
/// hash_key : "52cbbcbf-5c7f-47c6-8e33-0f461ee856b8"
/// last_name : "Fjfjjf"
/// message : "Mobile number OTP was send successfully"

LoginResponseData loginResponseDataFromJson(String str) =>
    LoginResponseData.fromJson(json.decode(str));

String loginResponseDataToJson(LoginResponseData data) =>
    json.encode(data.toJson());

class LoginResponseData {
  LoginResponseData({
    String? firstName,
    String? hashKey,
    String? lastName,
    String? message,
  }) {
    _firstName = firstName;
    _hashKey = hashKey;
    _lastName = lastName;
    _message = message;
  }

  LoginResponseData.fromJson(dynamic json) {
    _firstName = json['first_name'];
    _hashKey = json['hash_key'];
    _lastName = json['last_name'];
    _message = json['message'];
  }

  String? _firstName;
  String? _hashKey;
  String? _lastName;
  String? _message;

  LoginResponseData copyWith({
    String? firstName,
    String? hashKey,
    String? lastName,
    String? message,
  }) =>
      LoginResponseData(
        firstName: firstName ?? _firstName,
        hashKey: hashKey ?? _hashKey,
        lastName: lastName ?? _lastName,
        message: message ?? _message,
      );

  String? get firstName => _firstName;

  String? get hashKey => _hashKey;

  String? get lastName => _lastName;

  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_name'] = _firstName;
    map['hash_key'] = _hashKey;
    map['last_name'] = _lastName;
    map['message'] = _message;
    return map;
  }
}
