import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*saveLoginUserDetails({userId,userAuth}) async
{
  SharedPreferences prefs=await SharedPreferences.getInstance();
  prefs.setInt("user_id", userId);
  prefs.setString("user_auth", userAuth);
}*/

setUserId(id) async
{
  SharedPreferences prefs=await SharedPreferences.getInstance();
  prefs.setString("userid", id);
}

setUserAuth({String user_auth})async
{
  SharedPreferences prefs=await SharedPreferences.getInstance();
  prefs.setString("userauth",user_auth);
}


getUserId() async
{
  SharedPreferences prefs=await SharedPreferences.getInstance();
  String userId=prefs.getString("userid");
  return userId;
}

getUserAuth() async
{
  SharedPreferences prefs=await SharedPreferences.getInstance();
  String _userAuth=prefs.getString("userauth");
  return _userAuth;
}

clearUserID() async
{
  SharedPreferences prefs=await SharedPreferences.getInstance();
  prefs.remove("user_id");
}

clearUserAuth() async
{
  SharedPreferences prefs=await SharedPreferences.getInstance();
  prefs.remove("user_auth");
}

setAlreadyVisited() async
{
  SharedPreferences prefs=await SharedPreferences.getInstance();
  prefs.setBool("visited",true);
}

getAlreadyVisited() async
{
  SharedPreferences prefs=await SharedPreferences.getInstance();
  return prefs.getBool("visited")??false;
}