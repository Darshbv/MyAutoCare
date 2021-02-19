import 'package:flutter/material.dart';
import 'dart:async';
import 'package:my_autocare/Authentication/signin.dart';
import 'package:my_autocare/pages/main_page.dart';



void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner:false ,
    theme: ThemeData(
        primaryColor: Color(0xFFF62E2E),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: Pages(),
  ));
}

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3),(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset("images/splash_logo.png",
              height: 100,
              width: 200,),
              Text("Perfection Reinvented",style: TextStyle(
                color: Colors.white,fontStyle: FontStyle.italic,
                fontSize: 18,fontWeight: FontWeight.bold
              ),)
            ],
          ),
        ),
      )

    );
  }
}






