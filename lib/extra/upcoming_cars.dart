import 'package:flutter/material.dart';
import 'package:my_autocare/pages/main_page.dart';

class UpcomingCars extends StatefulWidget{
  @override
  _UpcomingCarsState createState() => _UpcomingCarsState();
}

class _UpcomingCarsState extends State<UpcomingCars> {
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
          title: Text("Upcoming Cars"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text("Cars", style: TextStyle(fontSize: 24, color: Colors.white)),
                Icon(Icons.settings, color: Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
