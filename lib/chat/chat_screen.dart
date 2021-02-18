import 'package:flutter/material.dart';
import 'package:my_autocare/chat/models/message_model.dart';
import 'package:my_autocare/chat/models/user_model.dart';

class ChatScreen extends StatefulWidget {
  final User user;
  ChatScreen({this.user});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _chatBubble(Message message, bool isMe, bool isSameUser) {
    if (isMe) {
      return Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topRight,
            child: Container(
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
              child: Text(
                message.text,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          !isSameUser
              ? Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                message.time,
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
                      image: AssetImage(message.sender.imageUrl),
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
            child: Container(
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
                message.text,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
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
                    image: AssetImage(message.sender.imageUrl),
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
                message.time,
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
      margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
      padding: EdgeInsets.all(8.0),
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
      height: 60,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.message),
            iconSize: 25,
            color: Colors.white,
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              maxLines: 10,
              decoration: InputDecoration.collapsed(
                hintText: 'Type a message..',
              ),
              textCapitalization: TextCapitalization.sentences,
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int prevUserId;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
                icon:Icon(Icons.arrow_left,
                    color: Colors.white,size: 40)),
            CircleAvatar(
              radius: 24.0,
              backgroundImage: AssetImage("images/logos.png"),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
                  child: Text(
                    widget.user.name,
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 0, 4, 2),
                  child: Text("Last seen ${3} min ago",style: TextStyle(
                      fontSize: 15
                  ),),
                )
              ],
            )
          ],
        ),
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: EdgeInsets.all(20),
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                final Message message = messages[index];
                final bool isMe = message.sender.id == currentUser.id;
                final bool isSameUser = prevUserId == message.sender.id;
                prevUserId = message.sender.id;
                return _chatBubble(message, isMe, isSameUser);
              },
            ),
          ),
          _sendMessageArea(),
        ],
      ),
    );
  }
}