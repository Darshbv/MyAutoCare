import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:my_autocare/pages/main_page.dart';
import 'package:my_autocare/shared_perferences/login_user_data.dart';

class ProfileSettings extends StatefulWidget {
  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = true;
  TextEditingController firstName = new TextEditingController();
  TextEditingController lastName = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController about = new TextEditingController();
  TextEditingController location = new TextEditingController();
  //bool _hidePassword = true;
  bool isloading = false;
  File _coverImage, _profileImage;
  final picker = ImagePicker();

  String utf8convert(String text) {
    List<int> bytes = text.toString().codeUnits;
    return utf8.decode(bytes);
  }

  getProfileUpdatedDetails(
      {String fname,
      String lname,
      String id,
      String about,
      String city,
      String email,
      File cover,
      File avatar}) async {
    setState(() {
      isloading = true;
    });

    var request = http.MultipartRequest(
        'POST', Uri.parse('http://myautocare.in/admin/api/updateuser'));
    request.fields.addAll({
      'fname': fname,
      'lname': lname,
      'id': id,
      'about': about,
      'city': city,
      'email': email
    });
    request.files
        .add(await http.MultipartFile.fromPath('cover', _coverImage.path));
    request.files
        .add(await http.MultipartFile.fromPath('avatar', _profileImage.path));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      setState(() {
        isloading = false;
      });
      await setAlreadyVisited();
      print(await response.stream.bytesToString());
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Pages()));
    } else {
      setState(() {
        isloading = false;
      });
      print(response.reasonPhrase);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ProfileSettings()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Enter Your Details',
          ),
          centerTitle: true,
        ),
        body: isloading
            ? Center(child: CircularProgressIndicator())
            : Form(
                key: _formKey,
                autovalidate: _autoValidate,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      Text("Upload Cover Image"),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          IconButton(
                                              icon: Icon(Icons.image),
                                              onPressed: () async {
                                                final pickedFile =
                                                    await picker.getImage(
                                                        source: ImageSource
                                                            .gallery);

                                                setState(() {
                                                  if (pickedFile != null) {
                                                    _coverImage =
                                                        File(pickedFile.path);
                                                  } else {
                                                    print('No image selected');
                                                  }
                                                });
                                              }),
                                          IconButton(
                                              icon: Icon(Icons.camera),
                                              onPressed: () async {
                                                final pickedFile =
                                                    await picker.getImage(
                                                        source:
                                                            ImageSource.camera);
                                                setState(() {
                                                  if (pickedFile != null) {
                                                    _coverImage =
                                                        File(pickedFile.path);
                                                  } else {
                                                    print('No image selected');
                                                  }
                                                });
                                              }),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: _coverImage == null
                                      ? Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('No image Selected'),
                                        )
                                      : Image.file(
                                          _coverImage,
                                          width: 0.4 *
                                              MediaQuery.of(context).size.width,
                                          height: 0.1 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      Text("Upload Profile Image"),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          IconButton(
                                              icon: Icon(Icons.image),
                                              onPressed: () async {
                                                final pickedFile =
                                                    await picker.getImage(
                                                        source: ImageSource
                                                            .gallery);

                                                setState(() {
                                                  if (pickedFile != null) {
                                                    _profileImage =
                                                        File(pickedFile.path);
                                                  } else {
                                                    print('No image selected');
                                                  }
                                                });
                                              }),
                                          IconButton(
                                              icon: Icon(Icons.camera),
                                              onPressed: () async {
                                                final pickedFile =
                                                    await picker.getImage(
                                                        source:
                                                            ImageSource.camera);

                                                setState(() {
                                                  if (pickedFile != null) {
                                                    _profileImage =
                                                        File(pickedFile.path);
                                                  } else {
                                                    print('No image selected');
                                                  }
                                                });
                                              }),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: _profileImage == null
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text('No image selected'),
                                            )
                                          : CircleAvatar(
                                              radius: 30,
                                              backgroundImage:
                                                  FileImage(_profileImage),
                                            ),
                                    ),
                                    _profileImage == null
                                        ? Container()
                                        : SizedBox(
                                            width: 0.12 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width,
                                          )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: firstName,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.person),
                                labelText: 'First Name',
                              ),
                              keyboardType: TextInputType.text,
                              validator: (String value) {
                                return value.isEmpty
                                    ? 'First Name cannot be empty'
                                    : null;
                              },
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            TextFormField(
                              controller: lastName,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.person),
                                labelText: 'Last Name',
                              ),
                              keyboardType: TextInputType.text,
                              validator: (String value) {
                                return value.isEmpty
                                    ? 'Last Name cannot be empty'
                                    : null;
                              },
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            TextFormField(
                              controller: email,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.email),
                                  labelText: 'Email'),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                Pattern pattern =
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                RegExp regex = new RegExp(pattern);
                                return !regex.hasMatch(value)
                                    ? 'Enter Valid Email'
                                    : null;
                              },
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            TextFormField(
                              controller: location,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.location_on),
                                labelText: 'Location',
                              ),
                              keyboardType: TextInputType.text,
                              validator: (String value) {
                                return value.isEmpty
                                    ? 'Location cannot be empty'
                                    : null;
                              },
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            TextFormField(
                              controller: about,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'About'),
                              keyboardType: TextInputType.text,
                              validator: (String value) {
                                return value.isEmpty
                                    ? 'About cannot be Empty'
                                    : null;
                              },
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: RaisedButton(
                                color: Colors.blue,
                                onPressed: () async {
                                  print(
                                      "First Name: ${firstName.text}\n Second Name: ${lastName.text}\n "
                                      "Location: ${location.text}\n Email: ${email.text}\n About: ${about.text}\n "
                                      "Cover Image path: ${_coverImage.path}\n Profile Image Path: ${_profileImage.path}");
                                  String user_id = await getUserId();
                                  print(user_id);
                                  await getProfileUpdatedDetails(
                                      fname: firstName.text,
                                      lname: lastName.text,
                                      id: user_id,
                                      about: utf8convert(about.text),
                                      city: location.text,
                                      email: email.text,
                                      cover: _coverImage,
                                      avatar: _profileImage);

                                  firstName.clear();
                                  lastName.clear();
                                  about.clear();
                                  location.clear();
                                  email.clear();
                                },
                                textColor: Colors.white,
                                elevation: 2.0,
                                padding: EdgeInsets.all(20.0),
                                child: Text(
                                  'Lets Start',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ));
  }

  /*String validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{11}$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }*/

  // regex method to validate email
  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }
}
