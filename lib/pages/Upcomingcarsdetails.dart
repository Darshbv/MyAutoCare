import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Upcomingcarsdetails extends StatefulWidget {
  @override
  _UpcomingcarsdetailsState createState() => _UpcomingcarsdetailsState();
}

class _UpcomingcarsdetailsState extends State<Upcomingcarsdetails> {
  int _current = 0;
  List imgList = [
    'images/img.png',
    'images/img.png',
    'images/img.png',
    'images/img.png',
    'images/img.png',
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 2,
            ),
            CarouselSlider(
              viewportFraction: 1.0,
              height: 150,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: true,
              autoPlay: true,
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
                        width: 1 * MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0.0),
                            image: DecorationImage(
                                image: AssetImage(item), fit: BoxFit.fill)),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                        ),
                      ))
                  .toList(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 0.035 * height,
                    width: 0.3 * width,
                    color: Colors.orange,
                    child: Center(child: Text("UPCOMING")),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Audi New Q3",
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      Text(
                        "₹22L- 32L",
                        style: TextStyle(fontSize: 25),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text("Estimated price"),
                      ),
                    ],
                  ),
                  Text(
                    "Expected Launch July 2021",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
