import 'package:flutter/material.dart';
import 'package:my_autocare/chat/widgets/category_selector.dart';
import 'package:my_autocare/chat/widgets/favorite_contacts.dart';
import 'package:my_autocare/chat/widgets/recent_chats.dart';

class ChatConsole extends StatefulWidget {
  @override
  _ChatConsoleState createState() => _ChatConsoleState();
}

class _ChatConsoleState extends State<ChatConsole> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage(
                  "images/logos.png"
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 1, 1, 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Samvinod Sam",
                    style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold,
                    color: Colors.red),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red
              ),
              child: Center(
                child: IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.add,color: Colors.white),
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
                  RecentChats(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
