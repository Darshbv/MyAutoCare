import 'dart:convert';

PostImage postImageFromJson(String str) => PostImage.fromJson(json.decode(str));

String postImageToJson(PostImage data) => json.encode(data.toJson());

class PostImage {
  PostImage({
    this.errCode,
    this.message,
    this.code,
    this.data,
  });

  int errCode;
  String message;
  int code;
  Data data;

  factory PostImage.fromJson(Map<String, dynamic> json) => PostImage(
    errCode: json["err_code"],
    message: json["message"],
    code: json["code"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "err_code": errCode,
    "message": message,
    "code": code,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.mediaId,
    this.url,
    this.type,
  });

  int mediaId;
  String url;
  String type;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    mediaId: json["media_id"],
    url: json["url"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "media_id": mediaId,
    "url": url,
    "type": type,
  };
}
