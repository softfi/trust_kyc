
import 'dart:convert';

PanStatusModel panStatusModelFromJson(String str) => PanStatusModel.fromJson(json.decode(str));

String panStatusModelToJson(PanStatusModel data) => json.encode(data.toJson());

class PanStatusModel {
  PanStatusModel({
    required this.aadharVerifyStatus,
    required this.panFname,
    required this.panLname,
    required this.panMname,
    required this.panStatus,
    required this.personVideoVerificationStatus,
  });

  int aadharVerifyStatus;
  String panFname;
  String panLname;
  String panMname;
  String panStatus;
  int personVideoVerificationStatus;

  factory PanStatusModel.fromJson(Map<String, dynamic> json) => PanStatusModel(
    aadharVerifyStatus: json["aadhar_verify_status"],
    panFname: json["pan_fname"],
    panLname: json["pan_lname"],
    panMname: json["pan_mname"],
    panStatus: json["pan_status"],
    personVideoVerificationStatus: json["person_video_verification_status"],
  );

  Map<String, dynamic> toJson() => {
    "aadhar_verify_status": aadharVerifyStatus,
    "pan_fname": panFname,
    "pan_lname": panLname,
    "pan_mname": panMname,
    "pan_status": panStatus,
    "person_video_verification_status": personVideoVerificationStatus,
  };
}
