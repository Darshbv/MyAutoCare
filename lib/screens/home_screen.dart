import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/rendering.dart';
import 'package:my_autocare/pages/drawer.dart';
import 'package:my_autocare/new_car_details/new_car_details.dart';

import 'package:my_autocare/pages/notification.dart';
import 'package:my_autocare/used_car_details/used_car_details.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Position _currentPosition;
  String _currentAddress;

  int _current = 0;
  bool isDrawerOpen;

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  int _current2 = 0;
  final List<String> imgList2 = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  void initState() {
    isDrawerOpen = false;
    super.initState();
    _currentAddress = _getCurrentLocation();
  }

  double screenWidth, screenHeight;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              SizedBox(
                width: 0.07 * MediaQuery.of(context).size.width,
              ),

              // isDrawerOpen
              //     ? InkWell(
              //         onTap: () {
              //           setState(() {
              //             isDrawerOpen = false;
              //           });
              //           print("return");
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) => HomePage(
              //                         currentTab: 0,
              //                         left: 0.6 * screenWidth,
              //                         right: -0.4 * screenWidth,
              //                         top: 0.1 * screenHeight,
              //                         bottom: 0.1 * screenWidth,
              //                       )));
              //         },
              //         child: Image.asset(
              //           "images/back-arrow.png",
              //           fit: BoxFit.fill,
              //           width: 0.06 * MediaQuery.of(context).size.width,
              //         ),
              //       )
              //     : InkWell(
              //         onTap: () {
              //           setState(() {
              //             isDrawerOpen = true;
              //           });
              //           print("Testing");
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) => HomePage(
              //                         currentTab: 0,
              //                         left: 0.4 * screenWidth,
              //                         right: -0.4 * screenWidth,
              //                         top: 0.1 * screenHeight,
              //                         bottom: 0.1 * screenWidth,
              //                       )));
              //         },
              //         child: Image.asset(
              //           "images/menu.png",
              //           fit: BoxFit.fill,
              //           width: 0.06 * MediaQuery.of(context).size.width,
              //         ),
              //       ),
              // SizedBox(
              //   width: 0.145 * MediaQuery.of(context).size.width,
              // ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Text("Current Location",
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontFamily: "SecularOne",
                            fontSize: 16,
                            color: Colors.white)),
                  ),
                  Column(
                    children: [
                      if (_currentAddress != null)
                        Text(_currentAddress,
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontFamily: "SecularOne",
                                fontSize: 14,
                                color: Colors.white)),
                      // Row(
                      //   children: [
                      //     FlatButton(
                      //       child: Text("Get location"),
                      //       onPressed: () {
                      //         _getCurrentLocation();
                      //         print(_currentAddress);
                      //       },
                      //     ),
                      //     SizedBox(
                      //       width: 0.03 *
                      //           MediaQuery.of(context).size.width,
                      //     ),
                      //     Image.asset(
                      //       "images/down-arrow.png",
                      //       width: 0.03 *
                      //           MediaQuery.of(context).size.width,
                      //       height: 0.018 *
                      //           MediaQuery.of(context).size.height,
                      //     ),
                      //   ],
                      // ),
                    ],
                  )
                ],
              ),
              SizedBox(
                width: 0.27 * MediaQuery.of(context).size.width,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Stack(
                  overflow: Overflow.visible,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Notifications()));
                      },
                      child: Image.asset(
                        "images/bell.png",
                        fit: BoxFit.fill,
                        color: Colors.black,
                        width: 0.04 * MediaQuery.of(context).size.width,
                        height: 0.024 * MediaQuery.of(context).size.height,
                      ),
                    ),
                    Positioned(
                        right: -7,
                        top: -5,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Padding(
                            padding: const EdgeInsets.all(2.2),
                            child: Text(
                              "${"5+"}",
                              style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            ),
                          ),
                        ))
                  ],
                ),
              )
            ],
          ),
        ],
      ),
      drawer: DrawerWidget(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 0.01 * MediaQuery.of(context).size.height,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 0.07 * MediaQuery.of(context).size.width,
                  ),

                  // isDrawerOpen
                  //     ? InkWell(
                  //         onTap: () {
                  //           setState(() {
                  //             isDrawerOpen = false;
                  //           });
                  //           print("return");
                  //           Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                   builder: (context) => HomePage(
                  //                         currentTab: 0,
                  //                         left: 0.6 * screenWidth,
                  //                         right: -0.4 * screenWidth,
                  //                         top: 0.1 * screenHeight,
                  //                         bottom: 0.1 * screenWidth,
                  //                       )));
                  //         },
                  //         child: Image.asset(
                  //           "images/back-arrow.png",
                  //           fit: BoxFit.fill,
                  //           width: 0.06 * MediaQuery.of(context).size.width,
                  //         ),
                  //       )
                  //     : InkWell(
                  //         onTap: () {
                  //           setState(() {
                  //             isDrawerOpen = true;
                  //           });
                  //           print("Testing");
                  //           Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                   builder: (context) => HomePage(
                  //                         currentTab: 0,
                  //                         left: 0.4 * screenWidth,
                  //                         right: -0.4 * screenWidth,
                  //                         top: 0.1 * screenHeight,
                  //                         bottom: 0.1 * screenWidth,
                  //                       )));
                  //         },
                  //         child: Image.asset(
                  //           "images/menu.png",
                  //           fit: BoxFit.fill,
                  //           width: 0.06 * MediaQuery.of(context).size.width,
                  //         ),
                  //       ),
                  // SizedBox(
                  //   width: 0.145 * MediaQuery.of(context).size.width,
                  // ),
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   mainAxisSize: MainAxisSize.min,
                  //   children: [
                  //     Padding(
                  //       padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  //       child: Text("Current Location",
                  //           style: TextStyle(
                  //               fontWeight: FontWeight.w600,
                  //               fontFamily: "SecularOne",
                  //               fontSize: 16,
                  //               color: Colors.black)),
                  //     ),
                  //     Padding(
                  //       padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  //       child: Column(
                  //         children: [
                  //           if (_currentAddress != null) Text(_currentAddress),
                  // Row(
                  //   children: [
                  //     FlatButton(
                  //       child: Text("Get location"),
                  //       onPressed: () {
                  //         _getCurrentLocation();
                  //         print(_currentAddress);
                  //       },
                  //     ),
                  //     SizedBox(
                  //       width: 0.03 *
                  //           MediaQuery.of(context).size.width,
                  //     ),
                  //     Image.asset(
                  //       "images/down-arrow.png",
                  //       width: 0.03 *
                  //           MediaQuery.of(context).size.width,
                  //       height: 0.018 *
                  //           MediaQuery.of(context).size.height,
                  //     ),
                  //   ],
                  // ),
                  //         ],
                  //       ),
                  //     )
                  //   ],
                  // ),
                  // SizedBox(
                  //   width: 0.26 * MediaQuery.of(context).size.width,
                  // ),
                  // Stack(
                  //   overflow: Overflow.visible,
                  //   children: [
                  //     InkWell(
                  //       onTap: () {
                  //         Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => Notifications()));
                  //       },
                  //       child: Image.asset(
                  //         "images/bell.png",
                  //         fit: BoxFit.fill,
                  //         color: Colors.black,
                  //         width: 0.04 * MediaQuery.of(context).size.width,
                  //         height: 0.024 * MediaQuery.of(context).size.height,
                  //       ),
                  //     ),
                  //     Positioned(
                  //         right: -6,
                  //         top: -5,
                  //         child: Container(
                  //           decoration: BoxDecoration(
                  //               color: Colors.deepOrangeAccent,
                  //               shape: BoxShape.circle),
                  //           child: Padding(
                  //             padding: const EdgeInsets.all(2.2),
                  //             child: Text(
                  //               "${"5+"}",
                  //               style: TextStyle(
                  //                   color: Colors.white,
                  //                   fontWeight: FontWeight.bold,
                  //                   fontSize: 10),
                  //             ),
                  //           ),
                  //         ))
                  //   ],
                  // )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NewCars()));
                },
                child: Container(
                  width: 0.95 * MediaQuery.of(context).size.width,
                  height: 0.15 * MediaQuery.of(context).size.height,
                  child: Card(
                    elevation: 10,
                    color: Color(0xffff7800),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("images/new_car.png"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "New\nCars",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UsedCars()));
                },
                child: Container(
                  width: 0.95 * MediaQuery.of(context).size.width,
                  height: 0.15 * MediaQuery.of(context).size.height,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 5,
                    color: Color(0xffff5800),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Used\nCars",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("images/used_car.png"),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                width: 0.95 * MediaQuery.of(context).size.width,
                height: 0.15 * MediaQuery.of(context).size.height,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 5,
                  color: Color(0xffff3B00),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("images/new_bike.png"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "New\nBikes",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                width: 0.95 * MediaQuery.of(context).size.width,
                height: 0.15 * MediaQuery.of(context).size.height,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 5,
                  color: Color(0xffff0000),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Used\nBikes",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("images/used_bike.png"),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              CarouselSlider(
                viewportFraction: 1.0,
                height: 85,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: false,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index) {
                  setState(() {
                    _current = index;
                  });
                },
                items: imgList
                    .map((item) => Container(
                          width: 0.89 * MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Image.network(item, fit: BoxFit.cover),
                        ))
                    .toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: map<Widget>(imgList, (index, url) {
                  return Container(
                    width: 10.0,
                    height: 10.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 1.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == index
                            ? Color(0xffff3b00)
                            : Colors.grey[300]),
                  );
                }),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                width: 0.9 * MediaQuery.of(context).size.width,
                height: 0.035 * MediaQuery.of(context).size.height,
                margin: EdgeInsets.only(left: 10.0),
                child: Text(
                  "Popular Cars and Bikes",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                width: 0.9 * MediaQuery.of(context).size.width,
                height: 0.33 * MediaQuery.of(context).size.height,
                child: DefaultTabController(
                  length: 4,
                  initialIndex: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ButtonsTabBar(
                        radius: 5.0,
                        backgroundColor: Colors.grey[100],
                        unselectedBackgroundColor: Color(0xffff0000),
                        unselectedLabelStyle: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        contentPadding: EdgeInsets.fromLTRB(14, 0, 14, 0),
                        labelStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        tabs: [
                          Tab(
                            text: "New Cars",
                          ),
                          Tab(
                            text: "Used Cars",
                          ),
                          Tab(
                            text: "New Bikes",
                          ),
                          Tab(
                            text: "Used Bikes",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return index == 4
                                      ? Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: 0.42 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color:
                                                            Color(0xffff3B00)),
                                                    width: 45,
                                                    height: 45,
                                                    child: Center(
                                                        child: Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: Colors.white,
                                                    )),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "View More",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.grey[800],
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: 0.47 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Card(
                                                  child: Image.asset(
                                                      "images/new_car.png",
                                                      height: 90.0,
                                                      fit: BoxFit.fill),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: Text(
                                                    "Renault KWID",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: Text(
                                                    "₹ 3.45 - 6.30 Lakh",
                                                    style: TextStyle(
                                                        color: Colors.grey[500],
                                                        fontSize: 12),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: Text(
                                                    "On Road Price Bangalore",
                                                    style: TextStyle(
                                                        color: Colors.grey[400],
                                                        fontSize: 12),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                }),
                            ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return index == 4
                                      ? Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: 0.42 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Card(
                                              elevation: 2,
                                              child: Center(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Color(
                                                              0xffff3B00)),
                                                      width: 45,
                                                      height: 45,
                                                      child: Center(
                                                          child: Icon(
                                                        Icons.arrow_forward_ios,
                                                        color: Colors.white,
                                                      )),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      "View More",
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color:
                                                              Colors.grey[800],
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: 0.42 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Card(
                                              elevation: 2,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Image.asset(
                                                      "images/new_car.png",
                                                      fit: BoxFit.cover),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.0),
                                                    child: Text(
                                                      "Renault KWID",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.0),
                                                    child: Text(
                                                      "₹ 3.45 - 6.30 Lakh",
                                                      style: TextStyle(
                                                          color:
                                                              Colors.grey[500],
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.0),
                                                    child: Text(
                                                      "On Road Price Bangalore",
                                                      style: TextStyle(
                                                          color:
                                                              Colors.grey[400],
                                                          fontSize: 12),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                }),
                            ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return index == 4
                                      ? Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: 0.42 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Card(
                                              elevation: 2,
                                              child: Center(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Color(
                                                              0xffff3B00)),
                                                      width: 45,
                                                      height: 45,
                                                      child: Center(
                                                          child: Icon(
                                                        Icons.arrow_forward_ios,
                                                        color: Colors.white,
                                                      )),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      "View More",
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color:
                                                              Colors.grey[800],
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: 0.42 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Card(
                                              elevation: 2,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Image.asset(
                                                      "images/new_car.png",
                                                      fit: BoxFit.cover),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.0),
                                                    child: Text(
                                                      "Renault KWID",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.0),
                                                    child: Text(
                                                      "₹ 3.45 - 6.30 Lakh",
                                                      style: TextStyle(
                                                          color:
                                                              Colors.grey[500],
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.0),
                                                    child: Text(
                                                      "On Road Price Bangalore",
                                                      style: TextStyle(
                                                          color:
                                                              Colors.grey[400],
                                                          fontSize: 12),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                }),
                            ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return index == 4
                                      ? Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: 0.42 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Color(0xffff3B00)),
                                                  width: 45,
                                                  height: 45,
                                                  child: Center(
                                                      child: Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: Colors.white,
                                                  )),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "View More",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.grey[800],
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: 0.42 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Card(
                                              elevation: 2,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Image.asset(
                                                      "images/new_car.png",
                                                      fit: BoxFit.cover),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.0),
                                                    child: Text(
                                                      "Renault KWID",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.0),
                                                    child: Text(
                                                      "₹ 3.45 - 6.30 Lakh",
                                                      style: TextStyle(
                                                          color:
                                                              Colors.grey[500],
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.0),
                                                    child: Text(
                                                      "On Road Price Bangalore",
                                                      style: TextStyle(
                                                          color:
                                                              Colors.grey[400],
                                                          fontSize: 12),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Column(
                  children: [
                    Text(
                      "All Major Cities",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                      width: 50,
                      height: 5,
                      color: Color(0xffff3B00),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 0.9 * MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Stack(overflow: Overflow.visible, children: [
                              CircleAvatar(
                                radius: 36,
                                backgroundImage: AssetImage("images/bang.jpg"),
                              ),
                              Positioned(
                                top: 2,
                                right: -5,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red[600],
                                  ),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "New",
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.white),
                                    ),
                                  )),
                                ),
                              ),
                            ]),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Bangalore",
                              style: TextStyle(),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 36,
                              backgroundImage: AssetImage("images/bang.jpg"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Bangalore",
                              style: TextStyle(),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 36,
                              backgroundImage: AssetImage("images/bang.jpg"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Bangalore",
                              style: TextStyle(),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 36,
                              backgroundImage: AssetImage("images/bang.jpg"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Bangalore",
                              style: TextStyle(),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Stack(overflow: Overflow.visible, children: [
                              CircleAvatar(
                                radius: 36,
                                backgroundImage: AssetImage("images/bang.jpg"),
                              ),
                              Positioned(
                                top: 2,
                                right: -5,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red[600],
                                  ),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "New",
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.white),
                                    ),
                                  )),
                                ),
                              ),
                            ]),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Bangalore",
                              style: TextStyle(),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 36,
                              backgroundImage: AssetImage("images/bang.jpg"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Bangalore",
                              style: TextStyle(),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 36,
                              backgroundImage: AssetImage("images/bang.jpg"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Bangalore",
                              style: TextStyle(),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 36,
                              backgroundImage: AssetImage("images/bang.jpg"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Bangalore",
                              style: TextStyle(),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Stack(overflow: Overflow.visible, children: [
                              CircleAvatar(
                                radius: 36,
                                backgroundImage: AssetImage("images/bang.jpg"),
                              ),
                              Positioned(
                                top: 2,
                                right: -5,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red[600],
                                  ),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Coming\nSoon",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 6,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                                ),
                              ),
                            ]),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Bangalore",
                              style: TextStyle(),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 36,
                              backgroundImage: AssetImage("images/bang.jpg"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Bangalore",
                              style: TextStyle(),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 36,
                              backgroundImage: AssetImage("images/bang.jpg"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Bangalore",
                              style: TextStyle(),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 36,
                              backgroundImage: AssetImage("images/bang.jpg"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Bangalore",
                              style: TextStyle(),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 0.07 * MediaQuery.of(context).size.width,
                  ),
                  CircleAvatar(
                      backgroundColor: Colors.deepOrangeAccent,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "images/news.png",
                          width: 20,
                          height: 20,
                        ),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Auto NEWS",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(
                    0.07 * MediaQuery.of(context).size.width,
                    5,
                    0.07 * MediaQuery.of(context).size.width,
                    2),
                height: 0.300 * screenHeight,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 0.5 * screenWidth,
                        child: Card(
                          elevation: 5.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.deepOrangeAccent,
                                      radius: 15,
                                      child: Image.asset(
                                        "images/news.png",
                                        width: 15,
                                        height: 15,
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              4, 2, 2, 0),
                                          child: Text(
                                            "Maruti Swift",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              4, 0, 2, 2),
                                          child: Text(
                                            "01 March 2021",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 8),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              CarouselSlider(
                                viewportFraction: 0.8,
                                height: 90,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: true,
                                enlargeCenterPage: true,
                                aspectRatio: 16 / 9,
                                autoPlayInterval: Duration(seconds: 3),
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 800),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                scrollDirection: Axis.horizontal,
                                onPageChanged: (index) {
                                  setState(() {
                                    _current2 = index;
                                  });
                                },
                                items: imgList2
                                    .map((item) => Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(3.0),
                                                image: DecorationImage(
                                                    image: NetworkImage(item),
                                                    fit: BoxFit.cover)),
                                          ),
                                        ))
                                    .toList(),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                    "Facelifted Maruti Swift Launched at Rs6.55 Lac,"
                                    "New More Efficient than Before",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      height: 1.0,
                                    ),
                                    maxLines: 2,
                                    textAlign: TextAlign.justify),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  "Given the increasing demand for SUV's,March"
                                  "too will witness a majority of cars from "
                                  "this category along with a couple of sedans",
                                  maxLines: 3,
                                  style: TextStyle(height: 1.0, fontSize: 8),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                      "View More >>",
                                      style: TextStyle(
                                          color: Colors.deepOrangeAccent,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    print("dispose");
    setState(() {
      isDrawerOpen = true;
    });
    super.dispose();
  }

  _getCurrentLocation() {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        _getAddressFromLatLng();
      });
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = placemarks[0];

      setState(() {
        _currentAddress = "${place.subLocality}, ${place.locality},";
      });
    } catch (e) {
      print(e);
    }
  }
}
