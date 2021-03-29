import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_autocare/autobook_controller/profile_controller.dart';
import 'package:my_autocare/chat/chat_console.dart';
import 'package:my_autocare/chat/controller/user_model_controller.dart';
import 'package:my_autocare/chat/extra_pages/upload_chat_images.dart';
import 'package:my_autocare/chat/models/message_model.dart';
import 'package:my_autocare/chat/models/message_sent_model.dart';
import 'package:my_autocare/main_model/profile_model.dart';
import 'package:my_autocare/shared_perferences/login_user_data.dart';

class ChatScreen extends StatefulWidget {
  final otherUserId,sessionId,otherUserAvatar,otherUsername,otherUserLastSeen;
  ChatScreen({this.otherUserId,this.sessionId,this.otherUserAvatar,this.otherUsername,this.otherUserLastSeen});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  Timer timer;
  MessageModel messageModel;
  ProfileModel pm;

  MessageSentModel messageSentModel;


  bool isloading=true;
  bool isloading1=true;

  TextEditingController comment_chat=TextEditingController();
  ScrollController _scrollController = new ScrollController();

  String utf8convert(String text) {
    List<int> bytes = text.toString().codeUnits;
    return utf8.decode(bytes);
  }

  getmessage() async{
    ChatController chatController=ChatController();
    print(widget.sessionId);
    print(widget.otherUserId.toString());
    messageModel=await chatController.getUserMessageChat(widget.sessionId, widget.otherUserId.toString());
    setState(() {
      isloading=false;
    });
  }

  getProfileData() async
  {
    String userId=await getUserId();
    print(userId);
    ProfileController pc=ProfileController();
    pm=await pc.getProfileInfo(userId);
    setState(() {
      isloading1=false;
    });
  }

  _chatBubble({message,time,bool isMe, bool isSameUser,image}) {
    if (isMe) {
      return Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topRight,
            child:image.toString().isEmpty?Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.80,
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.fromLTRB(40, 10, 10, 5),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Text(
                message,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ):
            Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.80,
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.fromLTRB(40, 10, 10, 10),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(image)),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    message,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          !isSameUser
              ? Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                time,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 30,
              height: 30,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: NetworkImage(pm.user.avatar),
                    ),
                    boxShadow: [
                             BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                ),
                              ],
                            ),
                              ),

            ],
          )
              : Container(
            child: null,
          ),
        ],
      );
    }
    else
      {
      return Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child:image.toString().isEmpty?Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.80,
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Text(
                message,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ):Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.80,
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(image)),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    message,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            )
          ),
          !isSameUser
              ? Row(
            children: <Widget>[
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: NetworkImage(widget.otherUserAvatar),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                time,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          )
              : Container(
            child: null,
          ),
        ],
      );
    }
  }

  _sendMessageArea() {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Icon(Icons.message,
            size: 25,
            color: Theme.of(context).primaryColor,
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: TextField(
              controller: comment_chat,
              decoration: InputDecoration(
                hintText: 'Type a message..',
                border: InputBorder.none,
                suffixIcon:IconButton(
                      icon: Icon(Icons.attach_file),
                      onPressed: (){
                            showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                                context: context, builder:(builder)=>bottomSheet(
                              otherUserAvatar:widget.otherUserAvatar,
                              typedMessage:comment_chat.text,
                              sessionId: widget.sessionId,
                              otherUserId: widget.otherUserId.toString()
                            ));
                      },
                    ),
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25,
            color: Theme.of(context).primaryColor,
            onPressed: () async{
              String msg=comment_chat.text;
              ChatController chatController=ChatController();
              messageSentModel=await chatController.getSentMessageInfo(
                sessionId: widget.sessionId,
                otherUserId: widget.otherUserId.toString(),
                message: msg);
              print(messageSentModel.message);
              await getProfileData();
              await getmessage();
              comment_chat.clear();


            },
          ),
        ],
      ),
    );
  }


  @override
  void initState() {
    print(widget.sessionId);
    print(widget.otherUserId);
    getProfileData();
    //getmessage();
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) => getmessage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int prevUserId;
    return isloading1?Center(child: CircularProgressIndicator(
      valueColor: new AlwaysStoppedAnimation<Color>(Colors.orange),
    )):
    Scaffold(
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: ()async{
                Navigator.pop(context);
                },
                icon:Icon(Icons.arrow_left,
                    color: Colors.white,size: 40)),
            CircleAvatar(
              radius: 24.0,
              backgroundImage: NetworkImage(widget.otherUserAvatar),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
                  child: Text(
                    utf8convert(widget.otherUsername),
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 0, 4, 2),
                  child: Text(widget.otherUserLastSeen,style: TextStyle(
                      fontSize: 12
                  ),),
                )
              ],
            )
          ],
        ),
        elevation: 0.0,
      ),
      body: isloading?Center(child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.orange),
      )):
      Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              reverse: false,
              shrinkWrap: false,
              padding: EdgeInsets.all(20),
              itemCount:messageModel.data.length,
              itemBuilder: (BuildContext context, int index) {
                final bool isSameUser = prevUserId == messageModel.data[index].id;
                prevUserId = messageModel.data[index].id;



                return _chatBubble(message:messageModel.data[index].message,
                    time:messageModel.data[index].time,
                    isMe:messageModel.data[index].owner,
                isSameUser: isSameUser,
                image: messageModel.data[index].mediaFile);
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _sendMessageArea(),
        ],
      ),
    );
  }


  Widget bottomSheet({String otherUserAvatar,String typedMessage,String sessionId,String otherUserId})
  {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MultipleImageChat(
                        otherUserAvatar:otherUserAvatar,
                        typeMessage: typedMessage,
                        otherUserId: widget.otherUserId,
                        sessionId: widget.sessionId,
                      )));
                    },
                    child: iconCreation(Icons.perm_media,Colors.deepOrangeAccent,
                    "Gallery"),
                  ),
                  iconCreation(Icons.camera_alt,Colors.deepOrangeAccent,
                      "Camera"),
                ],
              )
            ],
          ),
        ),
      ),

    );
  }

  Widget iconCreation(IconData icon,Color color,String title)
  {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 30,
          child: Icon(icon,
            size: 29,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text("$title")
      ],
    );
  }
}


