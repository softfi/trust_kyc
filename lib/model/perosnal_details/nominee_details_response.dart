// To parse this JSON data, do
//
//     final nomineeDetails = nomineeDetailsFromJson(jsonString);

import 'dart:convert';

//Nominee model
List<NomineeDetailModel> nomineeDetailsFromJson(String str) => List<NomineeDetailModel>.from(json.decode(str).map((x) => NomineeDetailModel.fromJson(x)));

String nomineeDetailsToJson(List<NomineeDetailModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NomineeDetailModel {
  NomineeDetailModel({
    this.column1,
    this.column2,
   required this.id,
   required this.nomineeDetailsAddressCity,
   required this.nomineeDetailsAddressLine1,
   required this.nomineeDetailsAddressLine2,
   required this.nomineeDetailsAddressLine3,
   required this.nomineeDetailsAddressState,
   required this.nomineeDetailsAddressStateCode,
   required this.nomineeDetailsAddressZip,
   required this.nomineeDetailsAllocation,
   required this.nomineeDetailsCitySequenceNo,
   required this.nomineeDetailsCreatedAt,
   required this.nomineeDetailsCurrentAddressCity,
   required this.nomineeDetailsCurrentAddressLine1,
   required this.nomineeDetailsCurrentAddressLine2,
   required this.nomineeDetailsCurrentAddressLine3,
   required this.nomineeDetailsCurrentAddressState,
   required this.nomineeDetailsCurrentAddressStateCodecurrent,
   required this.nomineeDetailsCurrentAddressZip,
   required this.nomineeDetailsCurrentCitySequenceNo,
   required this.nomineeDetailsDob,
   required this.nomineeDetailsFname,
   required this.nomineeDetailsIdentification,
   required this.nomineeDetailsIdentificationNumber,
   required this.nomineeDetailsLname,
   required this.nomineeDetailsMname,
   required this.nomineeDetailsMobileNumber,
   required this.nomineeDetailsRelationship,
   required this.nomineeDetailsTitle,
   required this.nomineeDetailsUpdatedAt,
  });

  dynamic column1;
  dynamic column2;
  int id;
  String nomineeDetailsAddressCity;
  String nomineeDetailsAddressLine1;
  String nomineeDetailsAddressLine2;
  String nomineeDetailsAddressLine3;
  String nomineeDetailsAddressState;
  String nomineeDetailsAddressStateCode;
  String nomineeDetailsAddressZip;
  int nomineeDetailsAllocation;
  String nomineeDetailsCitySequenceNo;
  DateTime nomineeDetailsCreatedAt;
  String nomineeDetailsCurrentAddressCity;
  String nomineeDetailsCurrentAddressLine1;
  String nomineeDetailsCurrentAddressLine2;
  String nomineeDetailsCurrentAddressLine3;
  String nomineeDetailsCurrentAddressState;
  String nomineeDetailsCurrentAddressStateCodecurrent;
  String nomineeDetailsCurrentAddressZip;
  String nomineeDetailsCurrentCitySequenceNo;
  String nomineeDetailsDob;
  String nomineeDetailsFname;
  int nomineeDetailsIdentification;
  String nomineeDetailsIdentificationNumber;
  String nomineeDetailsLname;
  String nomineeDetailsMname;
  String nomineeDetailsMobileNumber;
  String nomineeDetailsRelationship;
  String nomineeDetailsTitle;
  String nomineeDetailsUpdatedAt;

  factory NomineeDetailModel.fromJson(Map<String, dynamic> json) => NomineeDetailModel(
    column1: json["column_1"],
    column2: json["column_2"],
    id: json["id"],
    nomineeDetailsAddressCity: json["nominee_details_address_city"],
    nomineeDetailsAddressLine1: json["nominee_details_address_line_1"],
    nomineeDetailsAddressLine2: json["nominee_details_address_line_2"],
    nomineeDetailsAddressLine3: json["nominee_details_address_line_3"],
    nomineeDetailsAddressState: json["nominee_details_address_state"],
    nomineeDetailsAddressStateCode: json["nominee_details_address_state_code"],
    nomineeDetailsAddressZip: json["nominee_details_address_zip"],
    nomineeDetailsAllocation: json["nominee_details_allocation"],
    nomineeDetailsCitySequenceNo: json["nominee_details_city_sequence_no"],
    nomineeDetailsCreatedAt: DateTime.parse(json["nominee_details_created_at"]),
    nomineeDetailsCurrentAddressCity: json["nominee_details_current_address_city"],
    nomineeDetailsCurrentAddressLine1: json["nominee_details_current_address_line_1"],
    nomineeDetailsCurrentAddressLine2: json["nominee_details_current_address_line_2"],
    nomineeDetailsCurrentAddressLine3: json["nominee_details_current_address_line_3"],
    nomineeDetailsCurrentAddressState: json["nominee_details_current_address_state"],
    nomineeDetailsCurrentAddressStateCodecurrent: json["nominee_details_current_address_state_codecurrent"],
    nomineeDetailsCurrentAddressZip: json["nominee_details_current_address_zip"],
    nomineeDetailsCurrentCitySequenceNo: json["nominee_details_current_city_sequence_no"],
    nomineeDetailsDob: json["nominee_details_dob"],
    nomineeDetailsFname: json["nominee_details_fname"],
    nomineeDetailsIdentification: json["nominee_details_identification"],
    nomineeDetailsIdentificationNumber: json["nominee_details_identification_number"],
    nomineeDetailsLname: json["nominee_details_lname"],
    nomineeDetailsMname: json["nominee_details_mname"],
    nomineeDetailsMobileNumber: json["nominee_details_mobile_number"],
    nomineeDetailsRelationship: json["nominee_details_relationship"],
    nomineeDetailsTitle: json["nominee_details_title"],
    nomineeDetailsUpdatedAt: json["nominee_details_updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "column_1": column1,
    "column_2": column2,
    "id": id,
    "nominee_details_address_city": nomineeDetailsAddressCity,
    "nominee_details_address_line_1": nomineeDetailsAddressLine1,
    "nominee_details_address_line_2": nomineeDetailsAddressLine2,
    "nominee_details_address_line_3": nomineeDetailsAddressLine3,
    "nominee_details_address_state": nomineeDetailsAddressState,
    "nominee_details_address_state_code": nomineeDetailsAddressStateCode,
    "nominee_details_address_zip": nomineeDetailsAddressZip,
    "nominee_details_allocation": nomineeDetailsAllocation,
    "nominee_details_city_sequence_no": nomineeDetailsCitySequenceNo,
    "nominee_details_created_at": nomineeDetailsCreatedAt.toIso8601String(),
    "nominee_details_current_address_city": nomineeDetailsCurrentAddressCity,
    "nominee_details_current_address_line_1": nomineeDetailsCurrentAddressLine1,
    "nominee_details_current_address_line_2": nomineeDetailsCurrentAddressLine2,
    "nominee_details_current_address_line_3": nomineeDetailsCurrentAddressLine3,
    "nominee_details_current_address_state": nomineeDetailsCurrentAddressState,
    "nominee_details_current_address_state_codecurrent": nomineeDetailsCurrentAddressStateCodecurrent,
    "nominee_details_current_address_zip": nomineeDetailsCurrentAddressZip,
    "nominee_details_current_city_sequence_no": nomineeDetailsCurrentCitySequenceNo,
    "nominee_details_dob": nomineeDetailsDob,
    "nominee_details_fname": nomineeDetailsFname,
    "nominee_details_identification": nomineeDetailsIdentification,
    "nominee_details_identification_number": nomineeDetailsIdentificationNumber,
    "nominee_details_lname": nomineeDetailsLname,
    "nominee_details_mname": nomineeDetailsMname,
    "nominee_details_mobile_number": nomineeDetailsMobileNumber,
    "nominee_details_relationship": nomineeDetailsRelationship,
    "nominee_details_title": nomineeDetailsTitle,
    "nominee_details_updated_at": nomineeDetailsUpdatedAt,
  };
}
