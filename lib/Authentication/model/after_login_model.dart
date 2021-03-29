import 'dart:convert';

AfterLogin afterLoginFromJson(String str) => AfterLogin.fromJson(json.decode(str));

String afterLoginToJson(AfterLogin data) => json.encode(data.toJson());

class AfterLogin {
  AfterLogin({
    this.methodname,
    this.auth,
    this.user,
    this.code,
    this.codemessage,
    this.codedescription,
  });

  String methodname;
  Auth auth;
  User user;
  int code;
  String codemessage;
  String codedescription;

  factory AfterLogin.fromJson(Map<String, dynamic> json) => AfterLogin(
    methodname: json["METHODNAME"],
    auth: Auth.fromJson(json["auth"]),
    user: User.fromJson(json["user"]),
    code: json["CODE"],
    codemessage: json["CODEMESSAGE"],
    codedescription: json["CODEDESCRIPTION"],
  );

  Map<String, dynamic> toJson() => {
    "METHODNAME": methodname,
    "auth": auth.toJson(),
    "user": user.toJson(),
    "CODE": code,
    "CODEMESSAGE": codemessage,
    "CODEDESCRIPTION": codedescription,
  };
}

class Auth {
  Auth({
    this.authToken,
    this.refreshToken,
    this.authTokenExpiry,
  });

  String authToken;
  String refreshToken;
  int authTokenExpiry;

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
    authToken: json["auth_token"],
    refreshToken: json["refresh_token"],
    authTokenExpiry: json["auth_token_expiry"],
  );

  Map<String, dynamic> toJson() => {
    "auth_token": authToken,
    "refresh_token": refreshToken,
    "auth_token_expiry": authTokenExpiry,
  };
}

class User {
  User({
    this.id,
    this.username,
    this.fname,
    this.lname,
    this.about,
    this.gender,
    this.email,
    this.emCode,
    this.password,
    this.joined,
    this.lastActive,
    this.ipAddress,
    this.language,
    this.avatar,
    this.cover,
    this.coverOrig,
    this.active,
    this.verified,
    this.admin,
    this.posts,
    this.followers,
    this.following,
    this.website,
    this.countryId,
    this.lastPost,
    this.lastSwift,
    this.lastAd,
    this.profilePrivacy,
    this.followPrivacy,
    this.contactPrivacy,
    this.indexPrivacy,
    this.affBonuses,
    this.wallet,
    this.pnotifToken,
    this.refreshToken,
    this.settings,
    this.swift,
    this.swiftUpdate,
    this.infoFile,
    this.mobileNo,
    this.otp,
    this.expiry,
    this.otpVerified,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  dynamic username;
  String fname;
  String lname;
  String about;
  String gender;
  String email;
  String emCode;
  String password;
  int joined;
  int lastActive;
  String ipAddress;
  String language;
  String avatar;
  String cover;
  String coverOrig;
  int active;
  int verified;
  int admin;
  int posts;
  int followers;
  int following;
  String website;
  int countryId;
  int lastPost;
  String lastSwift;
  int lastAd;
  String profilePrivacy;
  String followPrivacy;
  String contactPrivacy;
  String indexPrivacy;
  int affBonuses;
  int wallet;
  String pnotifToken;
  int refreshToken;
  String settings;
  dynamic swift;
  int swiftUpdate;
  String infoFile;
  int mobileNo;
  int otp;
  String expiry;
  int otpVerified;
  DateTime createdAt;
  DateTime updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    username: json["username"],
    fname: json["fname"],
    lname: json["lname"],
    about: json["about"],
    gender: json["gender"],
    email: json["email"],
    emCode: json["em_code"],
    password: json["password"],
    joined: json["joined"],
    lastActive: json["last_active"],
    ipAddress: json["ip_address"],
    language: json["language"],
    avatar: json["avatar"],
    cover: json["cover"],
    coverOrig: json["cover_orig"],
    active: json["active"],
    verified: json["verified"],
    admin: json["admin"],
    posts: json["posts"],
    followers: json["followers"],
    following: json["following"],
    website: json["website"],
    countryId: json["country_id"],
    lastPost: json["last_post"],
    lastSwift: json["last_swift"],
    lastAd: json["last_ad"],
    profilePrivacy: json["profile_privacy"],
    followPrivacy: json["follow_privacy"],
    contactPrivacy: json["contact_privacy"],
    indexPrivacy: json["index_privacy"],
    affBonuses: json["aff_bonuses"],
    wallet: json["wallet"],
    pnotifToken: json["pnotif_token"],
    refreshToken: json["refresh_token"],
    settings: json["settings"],
    swift: json["swift"],
    swiftUpdate: json["swift_update"],
    infoFile: json["info_file"],
    mobileNo: json["mobile_no"],
    otp: json["otp"],
    expiry: json["expiry"],
    otpVerified: json["otp_verified"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "fname": fname,
    "lname": lname,
    "about": about,
    "gender": gender,
    "email": email,
    "em_code": emCode,
    "password": password,
    "joined": joined,
    "last_active": lastActive,
    "ip_address": ipAddress,
    "language": language,
    "avatar": avatar,
    "cover": cover,
    "cover_orig": coverOrig,
    "active": active,
    "verified": verified,
    "admin": admin,
    "posts": posts,
    "followers": followers,
    "following": following,
    "website": website,
    "country_id": countryId,
    "last_post": lastPost,
    "last_swift": lastSwift,
    "last_ad": lastAd,
    "profile_privacy": profilePrivacy,
    "follow_privacy": followPrivacy,
    "contact_privacy": contactPrivacy,
    "index_privacy": indexPrivacy,
    "aff_bonuses": affBonuses,
    "wallet": wallet,
    "pnotif_token": pnotifToken,
    "refresh_token": refreshToken,
    "settings": settings,
    "swift": swift,
    "swift_update": swiftUpdate,
    "info_file": infoFile,
    "mobile_no": mobileNo,
    "otp": otp,
    "expiry": expiry,
    "otp_verified": otpVerified,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
