import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_autocare/autobook_controller/profile_controller.dart';
import 'package:my_autocare/chat/chat_screen.dart';
import 'package:my_autocare/chat/controller/user_model_controller.dart';
import 'package:my_autocare/chat/models/user_model.dart';
import 'package:my_autocare/chat/widgets/category_selector.dart';
import 'package:my_autocare/chat/widgets/favorite_contacts.dart';
import 'package:my_autocare/main_model/profile_model.dart';
import 'package:my_autocare/shared_perferences/login_user_data.dart';

class ChatConsole extends StatefulWidget {
  @override
  _ChatConsoleState createState() => _ChatConsoleState();
}

class _ChatConsoleState extends State<ChatConsole> {
  UserChatModel userChatModel;
  ProfileModel pm;
  bool isLoading = true;
  bool isLoading1 = true;

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
      isLoading1 = false;
    });
  }

  getUserModel() async {
    String sessionId = await getUserAuth();
    print(sessionId);
    ChatController chatController = ChatController();
    userChatModel = await chatController.getUserChat(sessionId: sessionId);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getProfileData();
    getUserModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading1
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.red,
                ),
                splashColor: Colors.black,
              ),
              title: Row(
                children: [
                  CircleAvatar(
                    radius: 25.5,
                    backgroundImage: NetworkImage(pm.user.avatar),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 1, 1, 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pm.user.username,
                          style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                        Container(
                          alignment: Alignment.topCenter,
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.green),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              centerTitle: false,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red),
                    child: Center(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Center(child: CategorySelector()),
                        SizedBox(
                          height: 20,
                        ),
                        FavoriteContacts(),
                        SizedBox(
                          height: 20,
                        ),
                        isLoading
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: ClipRRect(
                                    child: ListView.builder(
                                        itemCount: userChatModel.data.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Container(
                                            margin: EdgeInsets.only(bottom: 5),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10.0,
                                                horizontal: 10.0),
                                            decoration: BoxDecoration(
                                                color: Colors.white),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Stack(children: [
                                                      CircleAvatar(
                                                        radius: 30.0,
                                                        backgroundImage:
                                                            NetworkImage(
                                                                userChatModel
                                                                    .data[index]
                                                                    .avatar),
                                                      ),
                                                      Positioned(
                                                          top: 40,
                                                          left: 40,
                                                          child: Container(
                                                            alignment: Alignment
                                                                .topCenter,
                                                            width: 15,
                                                            height: 15,
                                                            decoration: BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Colors
                                                                    .red //change the user activate here//
                                                                ),
                                                          ))
                                                    ]),
                                                    SizedBox(
                                                      width: 13.0,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () async {
                                                        String sessionId =
                                                            await getUserAuth();
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        ChatScreen(
                                                                          sessionId:
                                                                              sessionId,
                                                                          otherUserId: userChatModel
                                                                              .data[index]
                                                                              .userId
                                                                              .toString(),
                                                                          otherUserAvatar: userChatModel
                                                                              .data[index]
                                                                              .avatar,
                                                                          otherUsername: utf8convert(userChatModel
                                                                              .data[index]
                                                                              .username),
                                                                          otherUserLastSeen: userChatModel
                                                                              .data[index]
                                                                              .time,
                                                                        )));
                                                      },
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            userChatModel
                                                                .data[index]
                                                                .name,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 5.0,
                                                          ),
                                                          Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.45,
                                                            child: Text(
                                                              utf8convert(
                                                                  userChatModel
                                                                      .data[
                                                                          index]
                                                                      .lastMessage),
                                                              style: TextStyle(
                                                                  color: Colors
                                                                          .grey[
                                                                      700],
                                                                  fontSize:
                                                                      15.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      userChatModel
                                                          .data[index].time,
                                                      style: TextStyle(
                                                        color: Colors.grey[400],
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5.0,
                                                    ),
                                                    userChatModel.data[index]
                                                                    .newMessages ==
                                                                0 ||
                                                            userChatModel
                                                                .data[index]
                                                                .newMessages
                                                                .toString()
                                                                .isEmpty
                                                        ? Text('')
                                                        : Container(
                                                            width: 35.0,
                                                            height: 35.0,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                                color: Theme
                                                                        .of(
                                                                            context)
                                                                    .primaryColor),
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                              "${userChatModel.data[index].newMessages}\u{207A}",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            )),
                                                  ],
                                                )
                                              ],
                                            ),
                                          );
                                        }),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
