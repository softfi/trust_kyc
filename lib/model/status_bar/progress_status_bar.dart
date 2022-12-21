import 'dart:convert';

StatusBarModel statusBarModelFromJson(String str) =>
    StatusBarModel.fromJson(json.decode(str));

String statusBarModelToJson(StatusBarModel data) => json.encode(data.toJson());

class StatusBarModel {
  StatusBarModel({
    required this.message,
  });

  int message;

  factory StatusBarModel.fromJson(Map<String, dynamic> json) => StatusBarModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
