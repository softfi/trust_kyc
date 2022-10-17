// To parse this JSON data, do
//
//     final digiLockerDetailModel = digiLockerDetailModelFromJson(jsonString);

import 'dart:convert';

DigiLockerDetailModel digiLockerDetailModelFromJson(String str) => DigiLockerDetailModel.fromJson(json.decode(str));

String digiLockerDetailModelToJson(DigiLockerDetailModel data) => json.encode(data.toJson());

class DigiLockerDetailModel {
  DigiLockerDetailModel({
    required this.aadharNumber,
    required this.careOf,
    required this.country,
    required this.dateOfBirth,
    required this.district,
    required this.fullDetails,
    required this.gender,
    required this.houseNo,
    required this.image,
    required this.landmark,
    required this.location,
    required this.name,
    required this.pincode,
    required this.state,
    required this.street,
    required this.villageTownCity,
  });

  String aadharNumber;
  String careOf;
  String country;
  String dateOfBirth;
  String district;
  String fullDetails;
  String gender;
  String houseNo;
  String image;
  String landmark;
  String location;
  String name;
  String pincode;
  String state;
  String street;
  String villageTownCity;

  factory DigiLockerDetailModel.fromJson(Map<String, dynamic> json) => DigiLockerDetailModel(
    aadharNumber: json["aadhar_number"] == null ? null : json["aadhar_number"],
    careOf: json["care_of"] == null ? null : json["care_of"],
    country: json["country"] == null ? null : json["country"],
    dateOfBirth: json["date_of_birth"] == null ? null : json["date_of_birth"],
    district: json["district"] == null ? null : json["district"],
    fullDetails: json["full_details"] == null ? null : json["full_details"],
    gender: json["gender"] == null ? null : json["gender"],
    houseNo: json["house_no"] == null ? null : json["house_no"],
    image: json["image"] == null ? null : json["image"],
    landmark: json["landmark"] == null ? null : json["landmark"],
    location: json["location"] == null ? null : json["location"],
    name: json["name"] == null ? null : json["name"],
    pincode: json["pincode"] == null ? null : json["pincode"],
    state: json["state"] == null ? null : json["state"],
    street: json["street"] == null ? null : json["street"],
    villageTownCity: json["village_town_city"] == null ? null : json["village_town_city"],
  );

  Map<String, dynamic> toJson() => {
    "aadhar_number": aadharNumber == null ? null : aadharNumber,
    "care_of": careOf == null ? null : careOf,
    "country": country == null ? null : country,
    "date_of_birth": dateOfBirth == null ? null : dateOfBirth,
    "district": district == null ? null : district,
    "full_details": fullDetails == null ? null : fullDetails,
    "gender": gender == null ? null : gender,
    "house_no": houseNo == null ? null : houseNo,
    "image": image == null ? null : image,
    "landmark": landmark == null ? null : landmark,
    "location": location == null ? null : location,
    "name": name == null ? null : name,
    "pincode": pincode == null ? null : pincode,
    "state": state == null ? null : state,
    "street": street == null ? null : street,
    "village_town_city": villageTownCity == null ? null : villageTownCity,
  };
}
