import 'package:flutter/material.dart';
import 'package:my_autocare/pages/upcomingcars.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xffff5800),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: new ListView(
            children: [
              new CircleAvatar(
                radius: 60,
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                  child: Text('Darshan',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontFamily: "SecularOne",
                          fontSize: 16,
                          color: Colors.white))),
              Center(
                  child: Text('@Darsh',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontFamily: "SecularOne",
                          fontSize: 12,
                          color: Colors.white))),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 20),
                child: Row(
                  children: [
                    Icon(Icons.car_rental, size: 30, color: Colors.white),
                    SizedBox(width: 5),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => upcomingcars()));
                      },
                      child: Text('Upcoming Cars',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontFamily: "SecularOne",
                              fontSize: 16,
                              color: Colors.white)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 20),
                child: Row(
                  children: [
                    Icon(Icons.bike_scooter, size: 30, color: Colors.white),
                    SizedBox(width: 5),
                    Text('Upcoming Bikes',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontFamily: "SecularOne",
                            fontSize: 16,
                            color: Colors.white))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 20),
                child: Row(
                  children: [
                    Icon(Icons.shopping_bag, size: 30, color: Colors.white),
                    SizedBox(width: 5),
                    Text('My Orders',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontFamily: "SecularOne",
                            fontSize: 16,
                            color: Colors.white))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 20),
                child: Row(
                  children: [
                    Icon(Icons.favorite, size: 30, color: Colors.white),
                    SizedBox(width: 5),
                    Text('Wishlist',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontFamily: "SecularOne",
                            fontSize: 16,
                            color: Colors.white))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 20),
                child: Row(
                  children: [
                    Icon(Icons.wallet_giftcard_outlined,
                        size: 30, color: Colors.white),
                    SizedBox(width: 5),
                    Text('Invite Friends',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontFamily: "SecularOne",
                            fontSize: 16,
                            color: Colors.white))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 20),
                child: Row(
                  children: [
                    Icon(Icons.feedback, size: 30, color: Colors.white),
                    SizedBox(width: 5),
                    Text('Feedback',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontFamily: "SecularOne",
                            fontSize: 16,
                            color: Colors.white))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 20),
                child: Row(
                  children: [
                    Icon(Icons.info, size: 30, color: Colors.white),
                    SizedBox(width: 5),
                    Text('About MyAutoCare',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontFamily: "SecularOne",
                            fontSize: 16,
                            color: Colors.white))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 20),
                child: Row(
                  children: [
                    Icon(Icons.feedback, size: 30, color: Colors.white),
                    SizedBox(width: 5),
                    Text('Customer Support',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontFamily: "SecularOne",
                            fontSize: 16,
                            color: Colors.white))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 20),
                child: Row(
                  children: [
                    Icon(Icons.logout, size: 30, color: Colors.white),
                    SizedBox(width: 5),
                    Text('LogOut',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontFamily: "SecularOne",
                            fontSize: 16,
                            color: Colors.white))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
