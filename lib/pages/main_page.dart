import 'package:flutter/material.dart';
import 'package:my_autocare/screens/autobook_screen.dart';
import 'package:my_autocare/screens/home_screen.dart';
import 'package:my_autocare/screens/notification_screen.dart';
import 'package:my_autocare/screens/profile_screen.dart';

// ignore: must_be_immutable
class Pages extends StatefulWidget{
  int currentTab;
  Pages({this.currentTab});

  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {

  final List<Widget> screens = [
    HomeScreen(),
    AutoBookScreen(),
    ShopScreen(),
    ProfileScreen()
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeScreen(); // Our first view in viewport


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton:Image.asset("images/camera.png",fit: BoxFit.cover,width: 65,height: 65,),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 12,
        child: Container(
          height: 55,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              //left Tab bar Icons
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = HomeScreen();
                        widget.currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.home,
                          color: widget.currentTab == 0 ? Colors.red : Colors.grey,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            color: widget.currentTab == 0 ? Colors.red : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            AutoBookScreen(); // if user taps on this dashboard tab will be active
                        widget.currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.book,
                          color: widget.currentTab == 1 ? Colors.red : Colors.grey,
                        ),
                        Text(
                          'AutoBook',
                          style: TextStyle(
                            color: widget.currentTab == 1 ? Colors.red : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              // Right Tab bar icons
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            ShopScreen(); // if user taps on this dashboard tab will be active
                        widget.currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.notifications,
                          color: widget.currentTab == 2 ? Colors.red : Colors.grey,
                        ),
                        Text(
                          'Notification',
                          style: TextStyle(
                            color: widget.currentTab == 2 ? Colors.red : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            ProfileScreen(); // if user taps on this dashboard tab will be active
                        widget.currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.settings,
                          color: widget.currentTab == 3 ? Colors.red : Colors.grey,
                        ),
                        Text(
                          'profile',
                          style: TextStyle(
                            color: widget.currentTab == 3 ? Colors.red : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )

            ],
          ),
        ),
      ),

    );
  }
}