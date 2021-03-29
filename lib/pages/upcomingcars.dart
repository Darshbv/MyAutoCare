import 'package:flutter/material.dart';
import 'package:my_autocare/pages/Upcomingcarsdetails.dart';

class upcomingcars extends StatefulWidget {
  @override
  _upcomingcarsState createState() => _upcomingcarsState();
}

class _upcomingcarsState extends State<upcomingcars> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upcoming cars"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Upcomingcarsdetails()));
              },
              child: Card(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("images/bmw_demo.png"),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "Audi New Q3",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "Estimated Price:22L-32L",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "Expected Date: July 2021",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  )
                ],
              )),
            ),
            Card(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("images/bmw_demo.png"),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "Audi New Q3",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "Estimated Price:22L-32L",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "Expected Date: July 2021",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 15,
                )
              ],
            )),
            Card(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("images/bmw_demo.png"),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "Audi New Q3",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "Estimated Price:22L-32L",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "Expected Date: July 2021",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 15,
                )
              ],
            )),
            Card(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("images/bmw_demo.png"),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "Audi New Q3",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "Estimated Price:22L-32L",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "Expected Date: July 2021",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 15,
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}
