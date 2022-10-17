// To parse this JSON data, do
//
//     final getIfscCdeModel = getIfscCdeModelFromJson(jsonString);

import 'dart:convert';

GetIfscCdeModel getIfscCdeModelFromJson(String str) => GetIfscCdeModel.fromJson(json.decode(str));

String getIfscCdeModelToJson(GetIfscCdeModel data) => json.encode(data.toJson());

class GetIfscCdeModel {
  GetIfscCdeModel({
    required this.address,
    required this.bank,
    required this.bankcode,
    required this.branch,
    required this.centre,
    required this.city,
    required this.contact,
    required this.district,
    required this.ifsc,
    required this.imps,
    required this.iso3166,
    required this.micr,
    required this.neft,
    required this.rtgs,
    required this.state,
    required this.swift,
    required this.upi,
  });

  String address;
  String bank;
  String bankcode;
  String branch;
  String centre;
  String city;
  String contact;
  String district;
  String ifsc;
  bool imps;
  String iso3166;
  String micr;
  bool neft;
  bool rtgs;
  String state;
  dynamic swift;
  bool upi;

  factory GetIfscCdeModel.fromJson(Map<String, dynamic> json) => GetIfscCdeModel(
    address: json["ADDRESS"],
    bank: json["BANK"],
    bankcode: json["BANKCODE"],
    branch: json["BRANCH"],
    centre: json["CENTRE"],
    city: json["CITY"],
    contact: json["CONTACT"],
    district: json["DISTRICT"],
    ifsc: json["IFSC"],
    imps: json["IMPS"],
    iso3166: json["ISO3166"],
    micr: json["MICR"],
    neft: json["NEFT"],
    rtgs: json["RTGS"],
    state: json["STATE"],
    swift: json["SWIFT"],
    upi: json["UPI"],
  );

  Map<String, dynamic> toJson() => {
    "ADDRESS": address,
    "BANK": bank,
    "BANKCODE": bankcode,
    "BRANCH": branch,
    "CENTRE": centre,
    "CITY": city,
    "CONTACT": contact,
    "DISTRICT": district,
    "IFSC": ifsc,
    "IMPS": imps,
    "ISO3166": iso3166,
    "MICR": micr,
    "NEFT": neft,
    "RTGS": rtgs,
    "STATE": state,
    "SWIFT": swift,
    "UPI": upi,
  };
}
