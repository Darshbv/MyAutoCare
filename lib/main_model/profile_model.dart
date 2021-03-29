import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    this.methodname,
    this.user,
    this.code,
    this.codemessage,
    this.codedescription,
  });

  String methodname;
  User user;
  int code;
  String codemessage;
  String codedescription;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    methodname: json["METHODNAME"],
    user: User.fromJson(json["user"]),
    code: json["CODE"],
    codemessage: json["CODEMESSAGE"],
    codedescription: json["CODEDESCRIPTION"],
  );

  Map<String, dynamic> toJson() => {
    "METHODNAME": methodname,
    "user": user.toJson(),
    "CODE": code,
    "CODEMESSAGE": codemessage,
    "CODEDESCRIPTION": codedescription,
  };
}

class User {
  User({
    this.id,
    this.username,
    this.fname,
    this.lname,
    this.name,
    this.city,
    this.about,
    this.avatar,
    this.cover,
    this.memberSince,
    this.isUpdated,
    this.posts,
    this.followers,
    this.following,
  });

  int id;
  String username;
  String fname;
  String lname;
  String name;
  String city;
  String about;
  String avatar;
  String cover;
  String memberSince;
  int isUpdated;
  int posts;
  int followers;
  int following;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    username: json["username"],
    fname: json["fname"],
    lname: json["lname"],
    name: json["name"],
    city: json["city"],
    about: json["about"],
    avatar: json["avatar"],
    cover: json["cover"],
    memberSince: json["member_since"],
    isUpdated: json["is_updated"],
    posts: json["posts"],
    followers: json["followers"],
    following: json["following"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "fname": fname,
    "lname": lname,
    "name": name,
    "city": city,
    "about": about,
    "avatar": avatar,
    "cover": cover,
    "member_since": memberSince,
    "is_updated": isUpdated,
    "posts": posts,
    "followers": followers,
    "following": following,
  };
}
