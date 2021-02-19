import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_autocare/details/new_car_details.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:my_autocare/services/admob_service.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin
{
  final ams=AdMobService();
  @override
  void initState() {
    super.initState();
    Admob.initialize(ams.getAdMobAppId());

  }
  
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          children: [
            Icon(Icons.location_on,color: Colors.white,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Your Location",style: TextStyle(color: Colors.white,fontSize: 15),),
                Text("Bangalore India",style: TextStyle(color: Colors.white,fontSize: 15),)
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search), onPressed:(){

          },color: Colors.white,),
          IconButton(
            icon: Icon(Icons.notification_important_outlined), onPressed:(){

          },color: Colors.white,),
        ],
      ),
      drawer: Drawer(
        elevation: 16,
        child: ListView(
          children: [
            DrawerHeader(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage(
                        "images/logo.png"
                      ),
                    ),
                    Text("Username",style: TextStyle(
                      color: Colors.black,
                      fontSize: 20
                    ),
                    ),
                    Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,)
                  ],
                )
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text("Upcoming Cars"),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text("Upcoming Bikes"),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text("Business Page"),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text("Invite Friends"),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text("Support"),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text("Feedback"),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text("Report"),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text("Rate Us"),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text("More"),
            ),
          ],
        )
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>NewCars()));                },
                    child: _getCollection(title: "New Cars",img: "images/img.png")),
                _getCollection(title: "Used Cars",img: "images/img.png")
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _getCollection(title: "New Bike",img: "images/img.png"),
                _getCollection(title: "Used Bike",img: "images/img.png")
              ],
            ),
            SizedBox(
              height: 20,
            ),

            //Decoration//
            Container(
              height: 225,
              child:DefaultTabController(
                length: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    ButtonsTabBar(
                      backgroundColor: Colors.red,
                      unselectedBackgroundColor: Colors.red[300],
                      unselectedLabelStyle: TextStyle(color: Colors.black),
                      contentPadding: EdgeInsets.fromLTRB(14, 0, 14, 0),
                      labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                    Expanded(
                      child: TabBarView(
                        children: <Widget>[
                          _tabViewItem(),
                          _tabViewItem(),
                          _tabViewItem(),
                          _tabViewItem(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //banner add//
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AdmobBanner(
                  adUnitId: ams.getBannerAdId(),
                  adSize: AdmobBannerSize.LEADERBOARD),
            ),


            CarouselSlider(
              height: 120,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              viewportFraction: 0.8,
              items: [
                Container(
                    margin: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: AssetImage('images/loginlogo.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    )
              ]
            ),


          ],
        ),
      ),
    );
  }
}

Widget _getCollection({String img,String title})
{
  return Center(
    child: Stack(
      overflow: Overflow.visible,
      children: [
        Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            height: 120,
            width: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                image: AssetImage(img),
                fit: BoxFit.cover
              )
            ),
          ),
        ),
        Positioned(
          top: 110,
            left: 3.5,
            child: Center(
              child: Container(
                width: 180,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.red
                ),
                child: Center(
                  child: Text(
                    title,style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                ),
        ),
            )
        ),
      ],
    ),
  );
}




Widget _tabViewItem()
{
  return  Container(
    child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Image.asset("images/img.png",fit: BoxFit.cover,)),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 2, 2,2),
                      child: Text("Tata Tiago",style: TextStyle(
                          fontSize: 20
                      ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,2,2,2),
                      child: Text("4.85 - 6.84 Lakh",style:
                      TextStyle(color: Colors.black,
                          fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,2,2,2),
                      child: Row(
                        children: [
                          Icon(Icons.star,color: Colors.orangeAccent,size: 16,),
                          Text("4.3",style: TextStyle(
                              color: Colors.black
                          ),),
                          Text("(236)",style: TextStyle(
                              color: Colors.grey
                          ),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }),
  );
}
