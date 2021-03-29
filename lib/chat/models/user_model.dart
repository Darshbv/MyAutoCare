// To parse this JSON data, do
//
//     final userChatModel = userChatModelFromJson(jsonString);

import 'dart:convert';

UserChatModel userChatModelFromJson(String str) => UserChatModel.fromJson(json.decode(str));

String userChatModelToJson(UserChatModel data) => json.encode(data.toJson());

class UserChatModel {
  UserChatModel({
    this.code,
    this.valid,
    this.message,
    this.data,
  });

  int code;
  bool valid;
  String message;
  List<Datum> data;

  factory UserChatModel.fromJson(Map<String, dynamic> json) => UserChatModel(
    code: json["code"],
    valid: json["valid"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "valid": valid,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.userId,
    this.username,
    this.name,
    this.avatar,
    this.verified,
    this.chatId,
    this.time,
    this.lastMessage,
    this.newMessages,
    this.chatUrl,
  });

  int userId;
  String username;
  String name;
  String avatar;
  String verified;
  int chatId;
  String time;
  String lastMessage;
  dynamic newMessages;
  String chatUrl;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    userId: json["user_id"],
    username: json["username"],
    name: json["name"],
    avatar: json["avatar"],
    verified: json["verified"],
    chatId: json["chat_id"],
    time: json["time"],
    lastMessage: json["last_message"],
    newMessages: json["new_messages"],
    chatUrl: json["chat_url"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "username": username,
    "name": name,
    "avatar": avatar,
    "verified": verified,
    "chat_id": chatId,
    "time": time,
    "last_message": lastMessage,
    "new_messages": newMessages,
    "chat_url": chatUrl,
  };
}
