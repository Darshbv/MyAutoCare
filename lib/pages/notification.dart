import 'dart:ui';

import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('Notifications', style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        child: Center(
            child: Text(
          'Notifications',
          style: TextStyle(fontSize: 20),
        )),
      ),
    );
  }
}
