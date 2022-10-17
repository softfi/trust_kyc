
import 'dart:convert';

DigiLockerModel digiLockerModelFromJson(String str) => DigiLockerModel.fromJson(json.decode(str));

String digiLockerModelToJson(DigiLockerModel data) => json.encode(data.toJson());

class DigiLockerModel {
  DigiLockerModel({
    required this.link,
  });

  String link;

  factory DigiLockerModel.fromJson(Map<String, dynamic> json) => DigiLockerModel(
    link: json["link"],
  );

  Map<String, dynamic> toJson() => {
    "link": link,
  };
}
