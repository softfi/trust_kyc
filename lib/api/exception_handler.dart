class LoginExceptionData {
  final String message;

  LoginExceptionData({this.message = ''});

  factory LoginExceptionData.fromJson(Map<String, dynamic> json) {
    String value = '';
    json["errors"].forEach((e) {
      value = "$value $e";
    });
    return LoginExceptionData(message: value);
  }
}
