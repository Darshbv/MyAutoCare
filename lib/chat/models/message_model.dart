import 'dart:convert';

MessageModel messageModelFromJson(String str) => MessageModel.fromJson(json.decode(str));

String messageModelToJson(MessageModel data) => json.encode(data.toJson());

class MessageModel {
  MessageModel({
    this.valid,
    this.code,
    this.data,
  });

  bool valid;
  int code;
  List<Datum> data;

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
    valid: json["valid"],
    code: json["code"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "valid": valid,
    "code": code,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.sentBy,
    this.sentTo,
    this.owner,
    this.message,
    this.mediaFile,
    this.mediaType,
    this.seen,
    this.deletedFs1,
    this.deletedFs2,
    this.time,
    this.side,
    this.mediaName,
  });

  int id;
  int sentBy;
  int sentTo;
  bool owner;
  String message;
  String mediaFile;
  String mediaType;
  String seen;
  String deletedFs1;
  String deletedFs2;
  String time;
  String side;
  String mediaName;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    sentBy: json["sent_by"],
    sentTo: json["sent_to"],
    owner: json["owner"],
    message: json["message"],
    mediaFile: json["media_file"],
    mediaType: json["media_type"],
    seen: json["seen"],
    deletedFs1: json["deleted_fs1"],
    deletedFs2: json["deleted_fs2"],
    time: json["time"],
    side: json["side"],
    mediaName: json["media_name"] == null ? null : json["media_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sent_by": sentBy,
    "sent_to": sentTo,
    "owner": owner,
    "message": message,
    "media_file": mediaFile,
    "media_type": mediaType,
    "seen": seen,
    "deleted_fs1": deletedFs1,
    "deleted_fs2": deletedFs2,
    "time": time,
    "side": side,
    "media_name": mediaName == null ? null : mediaName,
  };
}
