import 'dart:convert';

AutobookModel autobookModelFromJson(String str) => AutobookModel.fromJson(json.decode(str));

String autobookModelToJson(AutobookModel data) => json.encode(data.toJson());

class AutobookModel {
  AutobookModel({
    this.errCode,
    this.code,
    this.message,
    this.data,
  });

  int errCode;
  int code;
  String message;
  Data data;

  factory AutobookModel.fromJson(Map<String, dynamic> json) => AutobookModel(
    errCode: json["err_code"],
    code: json["code"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "err_code": errCode,
    "code": code,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.feeds,
  });

  List<Feed> feeds;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    feeds: List<Feed>.from(json["feeds"].map((x) => Feed.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "feeds": List<dynamic>.from(feeds.map((x) => x.toJson())),
  };
}

class Feed {
  Feed({
    this.id,
    this.userId,
    this.text,
    this.type,
    this.replysCount,
    this.repostsCount,
    this.likesCount,
    this.status,
    this.threadId,
    this.target,
    this.ogData,
    this.pollData,
    this.privWcs,
    this.privWcr,
    this.time,
    this.approval,
    this.offsetId,
    this.isRepost,
    this.isReposter,
    this.attrs,
    this.advertising,
    this.timeRaw,
    this.ogText,
    this.ogImage,
    this.htags,
    this.url,
    this.canDelete,
    this.media,
    this.isOwner,
    this.hasLiked,
    this.hasSaved,
    this.hasReposted,
    this.isBlocked,
    this.meBlocked,
    this.canSee,
    this.replyTo,
    this.owner,
  });

  int id;
  int userId;
  String text;
  String type;
  String replysCount;
  String repostsCount;
  String likesCount;
  String status;
  int threadId;
  String target;
  String ogData;
  dynamic pollData;
  String privWcs;
  String privWcr;
  String time;
  int approval;
  int offsetId;
  bool isRepost;
  bool isReposter;
  String attrs;
  bool advertising;
  String timeRaw;
  String ogText;
  String ogImage;
  List<dynamic> htags;
  String url;
  bool canDelete;
  List<Media> media;
  bool isOwner;
  bool hasLiked;
  bool hasSaved;
  bool hasReposted;
  bool isBlocked;
  bool meBlocked;
  bool canSee;
  List<dynamic> replyTo;
  Owner owner;

  factory Feed.fromJson(Map<String, dynamic> json) => Feed(
    id: json["id"],
    userId: json["user_id"],
    text: json["text"],
    type: json["type"],
    replysCount: json["replys_count"],
    repostsCount: json["reposts_count"],
    likesCount: json["likes_count"],
    status: json["status"],
    threadId: json["thread_id"],
    target: json["target"],
    ogData: json["og_data"],
    pollData: json["poll_data"],
    privWcs: json["priv_wcs"],
    privWcr: json["priv_wcr"],
    time: json["time"],
    approval: json["approval"],
    offsetId: json["offset_id"],
    isRepost: json["is_repost"],
    isReposter: json["is_reposter"],
    attrs: json["attrs"],
    advertising: json["advertising"],
    timeRaw: json["time_raw"],
    ogText: json["og_text"],
    ogImage: json["og_image"],
    htags: List<dynamic>.from(json["htags"].map((x) => x)),
    url: json["url"],
    canDelete: json["can_delete"],
    media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
    isOwner: json["is_owner"],
    hasLiked: json["has_liked"],
    hasSaved: json["has_saved"],
    hasReposted: json["has_reposted"],
    isBlocked: json["is_blocked"],
    meBlocked: json["me_blocked"],
    canSee: json["can_see"],
    replyTo: List<dynamic>.from(json["reply_to"].map((x) => x)),
    owner: Owner.fromJson(json["owner"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "text": text,
    "type": type,
    "replys_count": replysCount,
    "reposts_count": repostsCount,
    "likes_count": likesCount,
    "status": status,
    "thread_id": threadId,
    "target": target,
    "og_data": ogData,
    "poll_data": pollData,
    "priv_wcs": privWcs,
    "priv_wcr": privWcr,
    "time": time,
    "approval": approval,
    "offset_id": offsetId,
    "is_repost": isRepost,
    "is_reposter": isReposter,
    "attrs": attrs,
    "advertising": advertising,
    "time_raw": timeRaw,
    "og_text": ogText,
    "og_image": ogImage,
    "htags": List<dynamic>.from(htags.map((x) => x)),
    "url": url,
    "can_delete": canDelete,
    "media": List<dynamic>.from(media.map((x) => x.toJson())),
    "is_owner": isOwner,
    "has_liked": hasLiked,
    "has_saved": hasSaved,
    "has_reposted": hasReposted,
    "is_blocked": isBlocked,
    "me_blocked": meBlocked,
    "can_see": canSee,
    "reply_to": List<dynamic>.from(replyTo.map((x) => x)),
    "owner": owner.toJson(),
  };
}

class Media {
  Media({
    this.id,
    this.pubId,
    this.type,
    this.src,
    this.jsonData,
    this.time,
    this.x,
    this.xSrc,
    this.xImg,
  });

  int id;
  int pubId;
  String type;
  String src;
  String jsonData;
  String time;
  X x;
  String xSrc;
  String xImg;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
    id: json["id"],
    pubId: json["pub_id"],
    type: json["type"],
    src: json["src"],
    jsonData: json["json_data"],
    time: json["time"],
    x: X.fromJson(json["x"]),
    xSrc: json["x_src"],
    xImg: json["x_img"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "pub_id": pubId,
    "type": type,
    "src": src,
    "json_data": jsonData,
    "time": time,
    "x": x.toJson(),
    "x_src": xSrc,
    "x_img": xImg,
  };
}

class X {
  X({
    this.posterThumb,
    this.imageThumb,
  });

  String posterThumb;
  String imageThumb;

  factory X.fromJson(Map<String, dynamic> json) => X(
    posterThumb: json["poster_thumb"] == null ? null : json["poster_thumb"],
    imageThumb: json["image_thumb"] == null ? null : json["image_thumb"],
  );

  Map<String, dynamic> toJson() => {
    "poster_thumb": posterThumb == null ? null : posterThumb,
    "image_thumb": imageThumb == null ? null : imageThumb,
  };
}

class Owner {
  Owner({
    this.id,
    this.url,
    this.avatar,
    this.username,
    this.name,
    this.verified,
  });

  int id;
  String url;
  String avatar;
  String username;
  String name;
  String verified;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
    id: json["id"],
    url: json["url"],
    avatar: json["avatar"],
    username: json["username"],
    name: json["name"],
    verified: json["verified"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
    "avatar": avatar,
    "username": username,
    "name": name,
    "verified": verified,
  };
}
