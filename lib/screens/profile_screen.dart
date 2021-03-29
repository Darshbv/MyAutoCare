import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_autocare/autobook_controller/post_controller.dart';
import 'package:my_autocare/autobook_controller/profile_controller.dart';
import 'package:my_autocare/main_model/like_post_model.dart';
import 'package:my_autocare/main_model/post_model.dart';
import 'package:my_autocare/main_model/post_user_likes.dart';
import 'package:my_autocare/main_model/post_user_media.dart';
import 'package:my_autocare/main_model/post_user_model.dart';
import 'package:my_autocare/main_model/profile_model.dart';
import 'package:my_autocare/post_upload/post_controller.dart';
import 'package:my_autocare/profile/extra_pages/profile_settings.dart';
import 'package:my_autocare/shared_perferences/login_user_data.dart';
import 'package:share/share.dart';
import 'package:video_player/video_player.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PostController postController;
  PostModel postModel;
  PostUserModel pum;
  ProfileModel pm;
  PostUserMedia postUserMedia;
  PostUserLikes postUserLikes;
  bool isloading1 = true;
  bool isloading2 = true;
  bool isloading3 = true;
  bool isloading4 = true;

  bool heartLike = false;
  int likeCount = 0;

  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  List<String> postDropdown = ['Delete', 'Copy Link'];

  String utf8convert(String text) {
    List<int> bytes = text.toString().codeUnits;
    return utf8.decode(bytes);
  }

  getProfileData() async {
    String userId = await getUserId();
    print(userId);
    ProfileController pc = ProfileController();
    pm = await pc.getProfileInfo(userId);
    setState(() {
      isloading1 = false;
    });
  }

  getUserPostData() async {
    String userId = await getUserId();
    String session_id = await getUserAuth();
    postController = PostController();
    pum = await postController.fetchUserPost(userId, session_id);
    setState(() {
      isloading2 = false;
    });
  }

  getUserMediaData() async {
    String userId = await getUserId();
    String session_id = await getUserAuth();
    postController = PostController();
    postUserMedia = await postController.fetchUserMedia(userId, session_id);
    setState(() {
      isloading3 = false;
    });
  }

  getUserLikedData() async {
    String userId = await getUserId();
    String session_id = await getUserAuth();
    postController = PostController();
    postUserLikes = await postController.fetchUserLikes(userId, session_id);
    setState(() {
      isloading4 = false;
    });
  }

  void showBottom() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Post Image"),
                    IconButton(
                        icon: Icon(Icons.upload_file),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PostImageex()));
                        })
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Post Video"),
                    IconButton(
                        icon: Icon(Icons.upload_file),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PostVideo()));
                        })
                  ],
                ),
              ],
            ),
          );
        });
  }

  LikePost lk;
  //Show Like Button//
  Future<LikePost> showLikeButton(String session_id, String post_id) async {
    var response = await http.post(
        "https://myautocare.in/Socialmedia/mobile_api/like_post",
        body: {"session_id": session_id, "post_id": post_id});
    if (response.statusCode == 200) {
      lk = likePostFromJson(response.body);
      return lk;
    } else {
      return null;
    }
  }

  RePost rp;
  //Show Like Button//
  Future<RePost> repostButton(String session_id, String post_id) async {
    var response = await http.post(
        "https://myautocare.in/Socialmedia/mobile_api/publication_repost",
        body: {"session_id": session_id, "post_id": post_id});
    if (response.statusCode == 200) {
      lk = likePostFromJson(response.body);
      return rp;
    } else {
      return null;
    }
  }

  //delete Post//
  Future<void> deletePost(String session_id, String post_id) async {
    print(session_id);
    print(post_id);
    var response = await http.post(
        "https://myautocare.in/Socialmedia/mobile_api/delete_post",
        body: {"session_id": session_id, "post_id": post_id});
    if (response.statusCode == 200) {
      print("Deleted");
      return null;
    } else {
      print("Not Deleted");
      return null;
    }
  }

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
    getProfileData();
    getUserPostData();
    getUserMediaData();
    getUserLikedData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isloading1
            ? Center(
                child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(
                        Colors.deepOrangeAccent)))
            : SingleChildScrollView(
                child: SafeArea(
                    child: Column(children: [
                  Stack(overflow: Overflow.visible, children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(pm.user.cover)),
                      ),
                    ),
                    Positioned(
                      top: 210,
                      left: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            color: Colors.deepOrangeAccent,
                            icon: Icon(Icons.more_vert),
                            onPressed: () {
                              showBottom();
                            },
                          ),
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                side: BorderSide(color: Colors.red)),
                            onPressed: () {},
                            color: Colors.red,
                            textColor: Colors.white,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ProfileSettings()));
                              },
                              child: Text("PROFILE SETTINGS".toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          height: 125,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: 100,
                                height: 100,
                                decoration: ShapeDecoration(
                                    shape: CircleBorder(),
                                    color: Colors.deepOrangeAccent),
                                child: Padding(
                                  padding: EdgeInsets.all(3.0),
                                  child: DecoratedBox(
                                    decoration: ShapeDecoration(
                                      shape: CircleBorder(),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(pm.user.avatar)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "${pm.user.name}",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            '${pm.user.username}',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.location_on),
                                Text(
                                  "Living in- ${pm.user.city}",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.date_range),
                                    Text(
                                      "Member Since - ${pm.user.memberSince}",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "www.myautocare.in",
                                style: TextStyle(
                                    color: Colors.blueAccent, fontSize: 14),
                              ),
                              Text(utf8convert(pm.user.about)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RichText(
                              text: new TextSpan(
                                text: '${pm.user.posts}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                children: <TextSpan>[
                                  new TextSpan(
                                      text: ' Posts',
                                      style:
                                          TextStyle(color: Colors.grey[600])),
                                ],
                              ),
                            ),
                            RichText(
                              text: new TextSpan(
                                text: '${pm.user.following}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                children: <TextSpan>[
                                  new TextSpan(
                                      text: ' Following',
                                      style:
                                          TextStyle(color: Colors.grey[600])),
                                ],
                              ),
                            ),
                            RichText(
                              text: new TextSpan(
                                text: '${pm.user.followers}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                children: <TextSpan>[
                                  new TextSpan(
                                      text: ' Followers',
                                      style:
                                          TextStyle(color: Colors.grey[600])),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          height: 5,
                          thickness: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            height: 0.43 * MediaQuery.of(context).size.height,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: 32,
                                    child: TabBar(
                                      labelColor: Colors.deepOrange,
                                      unselectedLabelStyle: TextStyle(
                                          fontWeight: FontWeight.bold),
                                      indicatorColor: Colors.deepOrangeAccent,
                                      unselectedLabelColor: Colors.grey[600],
                                      labelStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                      onTap: (index) {
                                        print(index);
                                      },
                                      tabs: [
                                        Tab(
                                          child: Center(
                                              child: Text(
                                            "POSTS",
                                            textAlign: TextAlign.center,
                                          )),
                                        ),
                                        Tab(
                                          child: Center(
                                              child: Text(
                                            "MEDIA",
                                            textAlign: TextAlign.center,
                                          )),
                                        ),
                                        Tab(
                                          child: Center(
                                              child: Text(
                                            "LIKES",
                                            textAlign: TextAlign.center,
                                          )),
                                        ),
                                      ],
                                      controller: _tabController,
                                      indicatorSize: TabBarIndicatorSize.tab,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      children: [
                                        isloading2
                                            ? Center(
                                                child:
                                                    CircularProgressIndicator())
                                            : pum.code != 200
                                                ? Center(
                                                    child: Container(
                                                        child: Text("No Post")),
                                                  )
                                                : ListView.builder(
                                                    itemCount:
                                                        pum.data.posts.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return Container(
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child:
                                                                        Container(
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          CircleAvatar(
                                                                            backgroundImage:
                                                                                NetworkImage(pum.data.posts[index].owner.avatar),
                                                                            radius:
                                                                                28,
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                12,
                                                                          ),
                                                                          Column(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    utf8convert(pum.data.posts[index].owner.name),
                                                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                                                  ),
                                                                                  Icon(
                                                                                    Icons.verified_rounded,
                                                                                    color: Colors.blueAccent,
                                                                                    size: 15,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Text(
                                                                                pum.data.posts[index].owner.username,
                                                                                style: TextStyle(color: Colors.grey),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child:
                                                                        Container(
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            children: [
                                                                              Text(
                                                                                pum.data.posts[index].time,
                                                                                style: TextStyle(color: Colors.grey),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ]),
                                                            Container(
                                                              child: Text(
                                                                utf8convert(pum
                                                                    .data
                                                                    .posts[
                                                                        index]
                                                                    .text),
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                                textAlign:
                                                                    TextAlign
                                                                        .justify,
                                                              ),
                                                            ),
                                                            pum
                                                                        .data
                                                                        .posts[
                                                                            index]
                                                                        .media
                                                                        .length ==
                                                                    0
                                                                ? Container()
                                                                : Container(
                                                                    height: 180,
                                                                    child: Padding(
                                                                        padding: const EdgeInsets.all(4.0),
                                                                        child: ListView.builder(
                                                                            scrollDirection: Axis.horizontal,
                                                                            shrinkWrap: true,
                                                                            itemCount: pum.data.posts[index].media.length,
                                                                            itemBuilder: (context, index2) {
                                                                              return pum.data.posts[index].media[index2].type == "image"
                                                                                  ? Padding(
                                                                                      padding: const EdgeInsets.all(8.0),
                                                                                      child: InkWell(
                                                                                        onTap: () {},
                                                                                        child: Container(
                                                                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
                                                                                          child: Image.network("${pum.data.posts[index].media[index2].xSrc}"),
                                                                                        ),
                                                                                      ),
                                                                                    )
                                                                                  : Stack(
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: const EdgeInsets.all(8.0),
                                                                                          child: InkWell(
                                                                                            onTap: () {},
                                                                                            child: Container(
                                                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
                                                                                              child: Image.network("${pum.data.posts[index].media[index2].xSrc}"),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Positioned(top: 10, right: 10, child: Icon(Icons.videocam, color: Colors.white))
                                                                                      ],
                                                                                    );
                                                                            })),
                                                                  ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Container(
                                                                  child: Row(
                                                                    children: [
                                                                      SizedBox(
                                                                        width:
                                                                            35,
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          Icon(
                                                                            Icons.comment,
                                                                            size:
                                                                                20,
                                                                            color:
                                                                                Colors.grey,
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                8,
                                                                          ),
                                                                          Text(
                                                                            pum.data.posts[index].replysCount,
                                                                            style:
                                                                                TextStyle(color: pum.data.posts[index].replysCount != "0" ? Colors.deepOrangeAccent : Colors.grey),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            20,
                                                                      ),
                                                                      InkWell(
                                                                        onTap:
                                                                            () async {
                                                                          String
                                                                              userAuth =
                                                                              await getUserAuth();
                                                                          print(
                                                                              userAuth);
                                                                          print(pum
                                                                              .data
                                                                              .posts[index]
                                                                              .id);
                                                                          lk = await showLikeButton(
                                                                              userAuth,
                                                                              pum.data.posts[index].id.toString());
                                                                          await getUserPostData();
                                                                          await getUserLikedData();
                                                                          await getUserMediaData();
                                                                        },
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
                                                                          children: [
                                                                            Icon(Icons.favorite,
                                                                                size: 20,
                                                                                color: pum.data.posts[index].hasLiked ? Colors.deepOrangeAccent : Colors.grey),
                                                                            SizedBox(
                                                                              width: 8,
                                                                            ),
                                                                            Text(
                                                                              pum.data.posts[index].likesCount,
                                                                              style: TextStyle(color: pum.data.posts[index].hasLiked ? Colors.deepOrangeAccent : Colors.grey),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            20,
                                                                      ),
                                                                      InkWell(
                                                                        onTap:
                                                                            () async {
                                                                          String
                                                                              userAuth =
                                                                              await getUserAuth();
                                                                          print(
                                                                              userAuth);
                                                                          print(pum
                                                                              .data
                                                                              .posts[index]
                                                                              .id);
                                                                          await deletePost(
                                                                              userAuth,
                                                                              pum.data.posts[index].id.toString());
                                                                          await getUserPostData();
                                                                          await getUserLikedData();
                                                                          await getUserMediaData();
                                                                        },
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
                                                                          children: [
                                                                            Icon(
                                                                              Icons.delete,
                                                                              size: 20,
                                                                              color: Colors.grey,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  child:
                                                                      IconButton(
                                                                    icon: Icon(
                                                                        Icons
                                                                            .share,
                                                                        size:
                                                                            20,
                                                                        color: Colors
                                                                            .grey),
                                                                    onPressed:
                                                                        () {
                                                                      Share.share(pum
                                                                          .data
                                                                          .posts[
                                                                              index]
                                                                          .url);
                                                                    },
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            Divider(
                                                              thickness: 2,
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    }),
                                        isloading3
                                            ? Center(
                                                child:
                                                    CircularProgressIndicator())
                                            : postUserMedia.code != 200
                                                ? Center(
                                                    child: Container(
                                                        child: Text(
                                                            "No Media Available")))
                                                : ListView.builder(
                                                    itemCount: postUserMedia
                                                        .data.posts.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return Container(
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child:
                                                                        Container(
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          CircleAvatar(
                                                                            backgroundImage:
                                                                                NetworkImage(postUserMedia.data.posts[index].owner.avatar),
                                                                            radius:
                                                                                28,
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                12,
                                                                          ),
                                                                          Column(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    utf8convert(postUserMedia.data.posts[index].owner.name),
                                                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                                                  ),
                                                                                  Icon(
                                                                                    Icons.verified_rounded,
                                                                                    color: Colors.blueAccent,
                                                                                    size: 15,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Text(
                                                                                postUserMedia.data.posts[index].owner.username,
                                                                                style: TextStyle(color: Colors.grey),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child:
                                                                        Container(
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            children: [
                                                                              Text(
                                                                                postUserMedia.data.posts[index].time,
                                                                                style: TextStyle(color: Colors.grey),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ]),
                                                            Container(
                                                              child: Text(
                                                                utf8convert(
                                                                    postUserMedia
                                                                        .data
                                                                        .posts[
                                                                            index]
                                                                        .text),
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                                textAlign:
                                                                    TextAlign
                                                                        .justify,
                                                              ),
                                                            ),
                                                            postUserMedia
                                                                        .data
                                                                        .posts[
                                                                            index]
                                                                        .media
                                                                        .length ==
                                                                    0
                                                                ? Container()
                                                                : Container(
                                                                    height: 180,
                                                                    child: Padding(
                                                                        padding: const EdgeInsets.all(4.0),
                                                                        child: ListView.builder(
                                                                            scrollDirection: Axis.horizontal,
                                                                            shrinkWrap: true,
                                                                            itemCount: postUserMedia.data.posts[index].media.length,
                                                                            itemBuilder: (context, index2) {
                                                                              return postUserMedia.data.posts[index].media[index2].type == "image"
                                                                                  ? Padding(
                                                                                      padding: const EdgeInsets.all(8.0),
                                                                                      child: InkWell(
                                                                                        onTap: () {},
                                                                                        child: Container(
                                                                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
                                                                                          child: Image.network("${postUserMedia.data.posts[index].media[index2].xSrc},"),
                                                                                        ),
                                                                                      ),
                                                                                    )
                                                                                  : Stack(
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: const EdgeInsets.all(8.0),
                                                                                          child: InkWell(
                                                                                            onTap: () {},
                                                                                            child: Container(
                                                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
                                                                                              child: Image.network("${postUserMedia.data.posts[index].media[index2].xSrc}"),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Positioned(top: 10, right: 10, child: Icon(Icons.videocam, color: Colors.white))
                                                                                      ],
                                                                                    );
                                                                            })),
                                                                  ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Container(
                                                                  child: Row(
                                                                    children: [
                                                                      SizedBox(
                                                                        width:
                                                                            35,
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          Icon(
                                                                              Icons.comment,
                                                                              size: 20,
                                                                              color: Colors.grey),
                                                                          SizedBox(
                                                                            width:
                                                                                8,
                                                                          ),
                                                                          Text(
                                                                            postUserMedia.data.posts[index].replysCount,
                                                                            style:
                                                                                TextStyle(color: postUserMedia.data.posts[index].replysCount != "0" ? Colors.deepOrangeAccent : Colors.grey),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            20,
                                                                      ),
                                                                      InkWell(
                                                                        onTap:
                                                                            () async {
                                                                          String
                                                                              userAuth =
                                                                              await getUserAuth();
                                                                          print(
                                                                              userAuth);
                                                                          print(postUserMedia
                                                                              .data
                                                                              .posts[index]
                                                                              .id);
                                                                          lk = await showLikeButton(
                                                                              userAuth,
                                                                              postUserMedia.data.posts[index].id.toString());
                                                                          await getUserPostData();
                                                                          await getUserLikedData();
                                                                          await getUserMediaData();
                                                                        },
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
                                                                          children: [
                                                                            Icon(Icons.favorite,
                                                                                size: 20,
                                                                                color: postUserMedia.data.posts[index].hasLiked ? Colors.deepOrangeAccent : Colors.grey),
                                                                            SizedBox(
                                                                              width: 8,
                                                                            ),
                                                                            Text(
                                                                              postUserMedia.data.posts[index].likesCount,
                                                                              style: TextStyle(color: postUserMedia.data.posts[index].hasLiked ? Colors.deepOrangeAccent : Colors.grey),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            20,
                                                                      ),
                                                                      InkWell(
                                                                        onTap:
                                                                            () async {
                                                                          String
                                                                              userAuth =
                                                                              await getUserAuth();
                                                                          print(
                                                                              userAuth);
                                                                          print(postUserMedia
                                                                              .data
                                                                              .posts[index]
                                                                              .id);
                                                                          await deletePost(
                                                                              userAuth,
                                                                              postUserMedia.data.posts[index].id.toString());
                                                                          await getUserPostData();
                                                                          await getUserLikedData();
                                                                          await getUserMediaData();
                                                                        },
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
                                                                          children: [
                                                                            Icon(
                                                                              Icons.delete,
                                                                              size: 20,
                                                                              color: Colors.grey,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  child:
                                                                      IconButton(
                                                                    icon: Icon(
                                                                      Icons
                                                                          .share,
                                                                      size: 20,
                                                                      color: Colors
                                                                          .grey,
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      Share.share(postUserMedia
                                                                          .data
                                                                          .posts[
                                                                              index]
                                                                          .url);
                                                                    },
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            Divider(
                                                              thickness: 2,
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    }),
                                        isloading4
                                            ? Center(
                                                child:
                                                    CircularProgressIndicator())
                                            : postUserLikes.code != 200
                                                ? Center(
                                                    child: Container(
                                                        child: Text(
                                                            "No Likes for the Post")))
                                                : ListView.builder(
                                                    itemCount: postUserLikes
                                                        .data.posts.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return Container(
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child:
                                                                        Container(
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          CircleAvatar(
                                                                            backgroundImage:
                                                                                NetworkImage(postUserLikes.data.posts[index].owner.avatar),
                                                                            radius:
                                                                                28,
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                12,
                                                                          ),
                                                                          Column(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    utf8convert(postUserLikes.data.posts[index].owner.name),
                                                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                                                  ),
                                                                                  Icon(
                                                                                    Icons.verified_rounded,
                                                                                    color: Colors.blueAccent,
                                                                                    size: 15,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Text(
                                                                                postUserLikes.data.posts[index].owner.username,
                                                                                style: TextStyle(color: Colors.grey),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child:
                                                                        Container(
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            children: [
                                                                              Text(
                                                                                postUserLikes.data.posts[index].time,
                                                                                style: TextStyle(color: Colors.grey),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ]),
                                                            Container(
                                                              child: Text(
                                                                utf8convert(
                                                                    postUserLikes
                                                                        .data
                                                                        .posts[
                                                                            index]
                                                                        .text),
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                              ),
                                                            ),
                                                            postUserLikes
                                                                        .data
                                                                        .posts[
                                                                            index]
                                                                        .media
                                                                        .length ==
                                                                    0
                                                                ? Container()
                                                                : Container(
                                                                    height: 180,
                                                                    child: Padding(
                                                                        padding: const EdgeInsets.all(4.0),
                                                                        child: ListView.builder(
                                                                            scrollDirection: Axis.horizontal,
                                                                            shrinkWrap: true,
                                                                            itemCount: postUserLikes.data.posts[index].media.length,
                                                                            itemBuilder: (context, index2) {
                                                                              return postUserLikes.data.posts[index].media[index2].type == "image"
                                                                                  ? Padding(
                                                                                      padding: const EdgeInsets.all(8.0),
                                                                                      child: InkWell(
                                                                                        onTap: () {},
                                                                                        child: Container(
                                                                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
                                                                                          child: Image.network(
                                                                                            "${postUserLikes.data.posts[index].media[index2].xSrc}",
                                                                                            fit: BoxFit.cover,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    )
                                                                                  : Stack(
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: const EdgeInsets.all(8.0),
                                                                                          child: InkWell(
                                                                                            onTap: () {},
                                                                                            child: Container(
                                                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
                                                                                              child: Image.network("${postUserMedia.data.posts[index].media[index2].xSrc}"),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Positioned(top: 10, right: 10, child: Icon(Icons.videocam, color: Colors.white))
                                                                                      ],
                                                                                    );
                                                                            })),
                                                                  ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Container(
                                                                  child: Row(
                                                                    children: [
                                                                      SizedBox(
                                                                        width:
                                                                            35,
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          Icon(
                                                                              Icons.comment,
                                                                              size: 20,
                                                                              color: Colors.grey),
                                                                          SizedBox(
                                                                            width:
                                                                                8,
                                                                          ),
                                                                          Text(
                                                                            postUserLikes.data.posts[index].replysCount,
                                                                            style:
                                                                                TextStyle(color: postUserLikes.data.posts[index].replysCount != "0" ? Colors.deepOrangeAccent : Colors.grey),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            20,
                                                                      ),
                                                                      InkWell(
                                                                        onTap:
                                                                            () async {
                                                                          String
                                                                              userAuth =
                                                                              await getUserAuth();
                                                                          print(
                                                                              userAuth);
                                                                          print(postUserLikes
                                                                              .data
                                                                              .posts[index]
                                                                              .id);
                                                                          lk = await showLikeButton(
                                                                              userAuth,
                                                                              postUserLikes.data.posts[index].id.toString());
                                                                          await getUserMediaData();
                                                                          await getUserPostData();
                                                                          await getUserLikedData();
                                                                        },
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
                                                                          children: [
                                                                            Icon(Icons.favorite,
                                                                                size: 20,
                                                                                color: postUserLikes.data.posts[index].hasLiked ? Colors.deepOrangeAccent : Colors.grey),
                                                                            SizedBox(
                                                                              width: 8,
                                                                            ),
                                                                            Text(
                                                                              postUserLikes.data.posts[index].likesCount,
                                                                              style: TextStyle(color: postUserLikes.data.posts[index].hasLiked ? Colors.deepOrangeAccent : Colors.grey),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            20,
                                                                      ),
                                                                      InkWell(
                                                                        onTap:
                                                                            () async {
                                                                          String
                                                                              userAuth =
                                                                              await getUserAuth();
                                                                          print(
                                                                              userAuth);
                                                                          print(postUserLikes
                                                                              .data
                                                                              .posts[index]
                                                                              .id);
                                                                          await deletePost(
                                                                              userAuth,
                                                                              postUserLikes.data.posts[index].id.toString());
                                                                          await getUserMediaData();
                                                                          await getUserPostData();
                                                                          await getUserLikedData();
                                                                        },
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
                                                                          children: [
                                                                            Icon(
                                                                              Icons.delete,
                                                                              size: 20,
                                                                              color: Colors.grey,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  child:
                                                                      IconButton(
                                                                    icon: Icon(
                                                                      Icons
                                                                          .share,
                                                                      size: 20,
                                                                      color: Colors
                                                                          .grey,
                                                                    ),
                                                                    onPressed:
                                                                        () {},
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            Divider(
                                                              thickness: 2,
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    }),
                                      ],
                                      controller: _tabController,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
                ])),
              ));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
