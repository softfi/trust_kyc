import 'dart:convert';

List<GetCityModel> getCityModelFromJson(String str) => List<GetCityModel>.from(
    json.decode(str).map((x) => GetCityModel.fromJson(x)));

String getCityModelToJson(List<GetCityModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetCityModel {
  GetCityModel({
    required this.cityId,
    required this.cityName,
    required this.stateId,
  });

  int cityId;
  String cityName;
  int stateId;

  factory GetCityModel.fromJson(Map<String, dynamic> json) => GetCityModel(
        cityId: json["city_id"],
        cityName: json["city_name"],
        stateId: json["state_id"],
      );

  Map<String, dynamic> toJson() => {
        "city_id": cityId,
        "city_name": cityName,
        "state_id": stateId,
      };
}
