import 'dart:convert';


//Like Post//
LikePost likePostFromJson(String str) => LikePost.fromJson(json.decode(str));

String likePostToJson(LikePost data) => json.encode(data.toJson());

class LikePost {
  LikePost({
    this.postLikes,
    this.valid,
    this.message,
    this.code,
    this.data,
  });

  int postLikes;
  bool valid;
  String message;
  int code;
  Data data;

  factory LikePost.fromJson(Map<String, dynamic> json) => LikePost(
    postLikes: json["post_likes"],
    valid: json["valid"],
    message: json["message"],
    code: json["code"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "post_likes": postLikes,
    "valid": valid,
    "message": message,
    "code": code,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.like,
  });

  bool like;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    like: json["like"],
  );

  Map<String, dynamic> toJson() => {
    "like": like,
  };
}





//Retweet Post//
RePost rePostFromJson(String str) => RePost.fromJson(json.decode(str));

String rePostToJson(RePost data) => json.encode(data.toJson());

class RePost {
  RePost({
    this.postReposts,
    this.valid,
    this.message,
    this.code,
    this.dataRepost,
  });

  int postReposts;
  bool valid;
  String message;
  int code;
  DataRepost dataRepost;

  factory RePost.fromJson(Map<String, dynamic> json) => RePost(
    postReposts: json["post_reposts"],
    valid: json["valid"],
    message: json["message"],
    code: json["code"],
    dataRepost: DataRepost.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "post_reposts": postReposts,
    "valid": valid,
    "message": message,
    "code": code,
    "data": dataRepost.toJson(),
  };
}

class DataRepost {
  DataRepost({
    this.repost,
  });

  bool repost;

  factory DataRepost.fromJson(Map<String, dynamic> json) => DataRepost(
    repost: json["repost"],
  );

  Map<String, dynamic> toJson() => {
    "repost": repost,
  };
}
