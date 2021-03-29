import 'package:flutter/material.dart';
import 'package:my_autocare/pages/main_page.dart';

class UpcomingBikes extends StatefulWidget{
  @override
  _UpcomingBikesState createState() => _UpcomingBikesState();
}

class _UpcomingBikesState extends State<UpcomingBikes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(icon:Icon(Icons.arrow_back),
          onPressed:(){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Pages()));
          }),
          title: Text("Upcoming Bikes"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text("Bikes", style: TextStyle(fontSize: 24, color: Colors.white)),
                Icon(Icons.settings, color: Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
