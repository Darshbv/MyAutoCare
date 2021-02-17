import 'package:flutter/material.dart';
import 'package:my_autocare/chat/chat_screen.dart';
import 'package:my_autocare/chat/models/message_model.dart';

class FavoriteContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 2, 2, 2),
      child: Column(
        children: [
          Text('Messages',
              style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
              ),),
        ],
      ),

    );
  }
}
