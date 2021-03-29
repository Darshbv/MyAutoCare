import 'dart:convert';

LoginUser loginUserFromJson(String str) => LoginUser.fromJson(json.decode(str));

String loginUserToJson(LoginUser data) => json.encode(data.toJson());

class LoginUser {
  LoginUser({
    this.methodname,
    this.userId,
    this.code,
    this.codemessage,
    this.codedescription,
  });

  String methodname;
  int userId;
  int code;
  String codemessage;
  String codedescription;

  factory LoginUser.fromJson(Map<String, dynamic> json) => LoginUser(
    methodname: json["METHODNAME"],
    userId: json["user_id"],
    code: json["CODE"],
    codemessage: json["CODEMESSAGE"],
    codedescription: json["CODEDESCRIPTION"],
  );

  Map<String, dynamic> toJson() => {
    "METHODNAME": methodname,
    "user_id": userId,
    "CODE": code,
    "CODEMESSAGE": codemessage,
    "CODEDESCRIPTION": codedescription,
  };
}
