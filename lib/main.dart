import 'package:flutter/material.dart';
import 'dart:async';
import 'package:my_autocare/Authentication/signin.dart';
import 'package:my_autocare/drawer_screen/drawer_screen.dart';
import 'package:my_autocare/pages/main_page.dart';
import 'package:my_autocare/shared_perferences/login_user_data.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizerUtil().init(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primaryColor: Colors.deepOrangeAccent,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: Welcome(),
            );
          },
        );
      },
    );
  }
}

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  chosseNavigation() async {
    clearUserID();
    clearUserAuth();
    print("Started");
    setUserId("3");
    String userId = await getUserId();
    print("User id is: $userId");
    setUserAuth(
        user_auth:
            "455d3bb0cf995108e35f36fe6b3b1d49d4f168771616578200d0269d2fe34d100f356fbaaf69660658");
    String userAuth = await getUserAuth();
    print("User auth is:$userAuth");

    if (userId == null) {
      Future.delayed(Duration(seconds: 3), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignIn()));
      });
    } else {
      Future.delayed(Duration(seconds: 3), () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(
                      currentTab: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      top: 0,
                    )));
      });
    }
  }

  @override
  void initState() {
    super.initState();
    chosseNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  "images/splash_logo.png",
                  height: 100,
                  width: 200,
                ),
                Text(
                  "Perfection Reinvented",
                  style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ));
  }
}

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  double left, top, bottom, right;
  int currentTab;
  HomePage({this.currentTab, this.left, this.bottom, this.right, this.top});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Scaffold(
        body: Stack(
          children: [
            // DrawerScreen(),
            Positioned(
              top: widget.top,
              bottom: widget.bottom,
              right: widget.right,
              left: widget.left,
              child: Pages(currentTab: widget.currentTab),
            ),
          ],
        ),
      ),
    );
  }
}
