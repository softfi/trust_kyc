
import 'dart:convert';

UploadVideoModal uploadVideoModalFromJson(String str) => UploadVideoModal.fromJson(json.decode(str));

String uploadVideoModalToJson(UploadVideoModal data) => json.encode(data.toJson());

class UploadVideoModal {
  UploadVideoModal({
    required this.video,
  });

  String video;

  factory UploadVideoModal.fromJson(Map<String, dynamic> json) => UploadVideoModal(
    video: json["video"],
  );

  Map<String, dynamic> toJson() => {
    "video": video,
  };
}
