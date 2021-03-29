import 'dart:convert';

MessageSentModel messageSentModelFromJson(String str) => MessageSentModel.fromJson(json.decode(str));

String messageSentModelToJson(MessageSentModel data) => json.encode(data.toJson());

class MessageSentModel {
  MessageSentModel({
    this.valid,
    this.code,
    this.message,
    this.data,
  });

  bool valid;
  int code;
  String message;
  Data data;

  factory MessageSentModel.fromJson(Map<String, dynamic> json) => MessageSentModel(
    valid: json["valid"],
    code: json["code"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "valid": valid,
    "code": code,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
  };
}
