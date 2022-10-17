// To parse this JSON data, do
//
//     final relationShipModel = relationShipModelFromJson(jsonString);

import 'dart:convert';

List<RelationShipModel> relationShipModelFromJson(String str) => List<RelationShipModel>.from(json.decode(str).map((x) => RelationShipModel.fromJson(x)));

String relationShipModelToJson(List<RelationShipModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RelationShipModel {
  RelationShipModel({
    required this.relationshipWithApplicationId,
    required this.relationshipWithApplicationName,
  });

  int relationshipWithApplicationId;
  String relationshipWithApplicationName;

  factory RelationShipModel.fromJson(Map<String, dynamic> json) => RelationShipModel(
    relationshipWithApplicationId: json["relationship_with_application_id"],
    relationshipWithApplicationName: json["relationship_with_application_name"],
  );

  Map<String, dynamic> toJson() => {
    "relationship_with_application_id": relationshipWithApplicationId,
    "relationship_with_application_name": relationshipWithApplicationName,
  };
}
