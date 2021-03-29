import 'package:flutter/material.dart';
import 'package:my_autocare/compare/edit_compare_car.dart';

class CarVsCar extends StatefulWidget {
  @override
  _CarVsCarState createState() => _CarVsCarState();
}

class _CarVsCarState extends State<CarVsCar> with SingleTickerProviderStateMixin{
  TabController _tabController;
  @override
  void initState() {
    _tabController = new TabController(length: 4, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:SafeArea(
        child: SingleChildScrollView(
          child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                Text("COMPARE CARS",style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),),

              ],
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                elevation: 10,
                child: Container(
                  child: Container(
                    child: Column(
                      children: [
                        Stack(
                          overflow: Overflow.visible,
                          children:[
                            Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                  child: Stack(
                                    overflow: Overflow.visible,
                                    children: [
                                      Image.asset("images/img.jpg",height: 150),
                                      Positioned(
                                        right: 1,
                                          child:IconButton(
                                        onPressed: (){},
                                        icon: Icon(Icons.edit),
                                      ))
                                    ],
                                  ),
                              ),
                              Expanded(child: Image.asset("images/img.jpg",height: 150,)),
                            ],
                          ),
                            Positioned(
                              left: 190,
                              top: 86,
                              child:CircleAvatar(
                                backgroundColor: Colors.deepOrangeAccent,
                                radius: 20,
                                child: Text("Vs",style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),),
                              ) ,
                            )
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Honda City",style: TextStyle(
                                      color: Colors.grey[900],
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold
                                    ),),
                                    Text("₹9.99 - 17.2 Lakh*",style: TextStyle(
                                        fontWeight: FontWeight.bold,fontSize: 18,
                                      color: Colors.grey
                                    ),),
                                    Text("On Road Price",style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                    ),),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Swift",style: TextStyle(
                                        color: Colors.grey[900],
                                        fontSize: 17,
                                      fontWeight: FontWeight.bold
                                    ),),
                                    Text("₹9.99 - 17.2 Lakh*",style: TextStyle(
                                        fontWeight: FontWeight.bold,fontSize: 18,
                                      color: Colors.grey
                                    ),),
                                    Text("On Road Price",style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold
                                    ),),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),


            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                height:5000,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.grey[100],
                        ),
                        height: 32,
                        child: TabBar(
                            unselectedLabelColor:Colors.grey[900],
                            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                            indicator: BoxDecoration(
                           borderRadius: BorderRadius.circular(5),
                           color:Colors.deepOrangeAccent
                            ),
                            labelStyle: TextStyle(
                           fontSize: 9,
                           fontWeight: FontWeight.bold,
                            ),
                            tabs: [
                         Tab(
                           child: Center(child: Text("SPECIFICATION",textAlign: TextAlign.center,)),
                         ),
                         Tab(
                           child: Center(child: Text("FEATURES",textAlign: TextAlign.center,)),
                         ),
                         Tab(
                           child: Center(child: Text("COLOURS",textAlign: TextAlign.center,)),
                         ),
                         Tab(
                           child: Center(child: Text("GALLERY",textAlign: TextAlign.center,)),
                         ),
                            ],
                            controller: _tabController,
                            indicatorSize: TabBarIndicatorSize.tab,
                          ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                           child: TabBarView(
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:[
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                                    child: Text(
                                      "ENGINE AND TRANSMISSION",style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.bold
                                    ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8,2, 8, 0),
                                    child: Container(
                                      color: Colors.deepOrangeAccent,
                                      width: 60,
                                      height: 4,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: 0.3*MediaQuery.of(context).size.height,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: 3,
                                        itemBuilder: (context,index)
                                    {
                                      return Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Container(
                                          color: Colors.grey[200],
                                          height: 100,
                                          width: MediaQuery.of(context).size.width,
                                          child: Column(
                                            children: [
                                              Container(
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Text("Engine",style: TextStyle(
                                                        fontWeight: FontWeight.bold
                                                    ),),
                                                  )),
                                              Expanded(
                                                child: Container(
                                                  color: Colors.white,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      Expanded(
                                                        child:Card(
                                                          elevation: 8,
                                                          child:Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Text(
                                                              "1996cc,4Cylinders Inline,4valves/Cyclinder"
                                                            ),
                                                          ) ,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Card(
                                                        elevation: 8,
                                                          child:Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Text(
                                                                "1996cc,4Cylinders Inline,4valves/Cyclinder",
                                                              maxLines: 2,
                                                            ),
                                                          ) ,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ) ;
                                    }),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                                    child: Text(
                                      "DIMENSION AND WEIGHT",style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.bold
                                    ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8,2, 8, 0),
                                    child: Container(
                                      color: Colors.deepOrangeAccent,
                                      width: 70,
                                      height: 4,
                                    ),
                                  ),
                                  Container(
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: 3,
                                        itemBuilder: (context,index)
                                        {
                                          return Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Container(
                                              color: Colors.grey[200],
                                              height: 100,
                                              width: MediaQuery.of(context).size.width,
                                              child: Column(
                                                children: [
                                                  Container(
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("Engine",style: TextStyle(
                                                          fontWeight: FontWeight.bold
                                                        ),),
                                                      )),
                                                  Expanded(
                                                    child: Container(
                                                      color: Colors.white,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Expanded(
                                                            child:Card(
                                                              elevation: 8,
                                                              child:Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Text(
                                                                    "1996cc,4Cylinders Inline,4valves/Cyclinder"
                                                                ),
                                                              ) ,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Card(
                                                              elevation: 8,
                                                              child:Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Text(
                                                                  "1996cc,4Cylinders Inline,4valves/Cyclinder",
                                                                  maxLines: 2,
                                                                ),
                                                              ) ,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ) ;
                                        }),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:[
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                                    child: Text(
                                      "SAFETY",style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.bold
                                    ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8,2, 8, 0),
                                    child: Container(
                                      color: Colors.deepOrangeAccent,
                                      width: 60,
                                      height: 4,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: 0.3*MediaQuery.of(context).size.height,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: 3,
                                        itemBuilder: (context,index)
                                        {
                                          return Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Container(
                                              color: Colors.grey[200],
                                              height: 100,
                                              width: MediaQuery.of(context).size.width,
                                              child: Column(
                                                children: [
                                                  Container(
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("Engine",style: TextStyle(
                                                            fontWeight: FontWeight.bold
                                                        ),),
                                                      )),
                                                  Expanded(
                                                    child: Container(
                                                      color: Colors.white,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Expanded(
                                                            child:Card(
                                                              elevation: 8,
                                                              child:Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Text(
                                                                    "1996cc,4Cylinders Inline,4valves/Cyclinder"
                                                                ),
                                                              ) ,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Card(
                                                              elevation: 8,
                                                              child:Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Text(
                                                                  "1996cc,4Cylinders Inline,4valves/Cyclinder",
                                                                  maxLines: 2,
                                                                ),
                                                              ) ,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ) ;
                                        }),
                                  ),



                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                                    child: Text(
                                      "BREAKING AND TRACTION",style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.bold
                                    ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8,2, 8, 0),
                                    child: Container(
                                      color: Colors.deepOrangeAccent,
                                      width: 70,
                                      height: 4,
                                    ),
                                  ),
                                  Container(
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: 3,
                                        itemBuilder: (context,index)
                                        {
                                          return Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Container(
                                              color: Colors.grey[200],
                                              height: 100,
                                              width: MediaQuery.of(context).size.width,
                                              child: Column(
                                                children: [
                                                  Container(
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("Engine",style: TextStyle(
                                                            fontWeight: FontWeight.bold
                                                        ),),
                                                      )),
                                                  Expanded(
                                                    child: Container(
                                                      color: Colors.white,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Expanded(
                                                            child:Card(
                                                              elevation: 8,
                                                              child:Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Text(
                                                                    "1996cc,4Cylinders Inline,4valves/Cyclinder"
                                                                ),
                                                              ) ,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Card(
                                                              elevation: 8,
                                                              child:Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Text(
                                                                  "1996cc,4Cylinders Inline,4valves/Cyclinder",
                                                                  maxLines: 2,
                                                                ),
                                                              ) ,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ) ;
                                        }),
                                  ),


                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                                    child: Text(
                                      "LOCK AND SECURITY",style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.bold
                                    ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8,2, 8, 0),
                                    child: Container(
                                      color: Colors.deepOrangeAccent,
                                      width: 70,
                                      height: 4,
                                    ),
                                  ),
                                  Container(
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: 3,
                                        itemBuilder: (context,index)
                                        {
                                          return Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Container(
                                              color: Colors.grey[200],
                                              height: 100,
                                              width: MediaQuery.of(context).size.width,
                                              child: Column(
                                                children: [
                                                  Container(
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("Engine",style: TextStyle(
                                                            fontWeight: FontWeight.bold
                                                        ),),
                                                      )),
                                                  Expanded(
                                                    child: Container(
                                                      color: Colors.white,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Expanded(
                                                            child:Card(
                                                              elevation: 8,
                                                              child:Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Text(
                                                                    "1996cc,4Cylinders Inline,4valves/Cyclinder"
                                                                ),
                                                              ) ,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Card(
                                                              elevation: 8,
                                                              child:Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Text(
                                                                  "1996cc,4Cylinders Inline,4valves/Cyclinder",
                                                                  maxLines: 2,
                                                                ),
                                                              ) ,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ) ;
                                        }),
                                  ),



                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                                    child: Text(
                                      "COMFORT AND CONVENIENCE",style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.bold
                                    ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8,2, 8, 0),
                                    child: Container(
                                      color: Colors.deepOrangeAccent,
                                      width: 70,
                                      height: 4,
                                    ),
                                  ),
                                  Container(
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: 3,
                                        itemBuilder: (context,index)
                                        {
                                          return Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Container(
                                              color: Colors.grey[200],
                                              height: 100,
                                              width: MediaQuery.of(context).size.width,
                                              child: Column(
                                                children: [
                                                  Container(
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("Engine",style: TextStyle(
                                                            fontWeight: FontWeight.bold
                                                        ),),
                                                      )),
                                                  Expanded(
                                                    child: Container(
                                                      color: Colors.white,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Expanded(
                                                            child:Card(
                                                              elevation: 8,
                                                              child:Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Text(
                                                                    "1996cc,4Cylinders Inline,4valves/Cyclinder"
                                                                ),
                                                              ) ,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Card(
                                                              elevation: 8,
                                                              child:Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Text(
                                                                  "1996cc,4Cylinders Inline,4valves/Cyclinder",
                                                                  maxLines: 2,
                                                                ),
                                                              ) ,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ) ;
                                        }),
                                  ),


                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                                    child: Text(
                                      "SEATS AND UPHOLSTERY",style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.bold
                                    ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8,2, 8, 0),
                                    child: Container(
                                      color: Colors.deepOrangeAccent,
                                      width: 70,
                                      height: 4,
                                    ),
                                  ),
                                  Container(
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: 3,
                                        itemBuilder: (context,index)
                                        {
                                          return Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Container(
                                              color: Colors.grey[200],
                                              height: 100,
                                              width: MediaQuery.of(context).size.width,
                                              child: Column(
                                                children: [
                                                  Container(
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("Engine",style: TextStyle(
                                                            fontWeight: FontWeight.bold
                                                        ),),
                                                      )),
                                                  Expanded(
                                                    child: Container(
                                                      color: Colors.white,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Expanded(
                                                            child:Card(
                                                              elevation: 8,
                                                              child:Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Text(
                                                                    "1996cc,4Cylinders Inline,4valves/Cyclinder"
                                                                ),
                                                              ) ,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Card(
                                                              elevation: 8,
                                                              child:Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Text(
                                                                  "1996cc,4Cylinders Inline,4valves/Cyclinder",
                                                                  maxLines: 2,
                                                                ),
                                                              ) ,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ) ;
                                        }),
                                  ),



                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                                    child: Text(
                                      "STORAGE",style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.bold
                                    ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8,2, 8, 0),
                                    child: Container(
                                      color: Colors.deepOrangeAccent,
                                      width: 70,
                                      height: 4,
                                    ),
                                  ),
                                  Container(
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: 3,
                                        itemBuilder: (context,index)
                                        {
                                          return Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Container(
                                              color: Colors.grey[200],
                                              height: 100,
                                              width: MediaQuery.of(context).size.width,
                                              child: Column(
                                                children: [
                                                  Container(
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("Engine",style: TextStyle(
                                                            fontWeight: FontWeight.bold
                                                        ),),
                                                      )),
                                                  Expanded(
                                                    child: Container(
                                                      color: Colors.white,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Expanded(
                                                            child:Card(
                                                              elevation: 8,
                                                              child:Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Text(
                                                                    "1996cc,4Cylinders Inline,4valves/Cyclinder"
                                                                ),
                                                              ) ,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Card(
                                                              elevation: 8,
                                                              child:Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Text(
                                                                  "1996cc,4Cylinders Inline,4valves/Cyclinder",
                                                                  maxLines: 2,
                                                                ),
                                                              ) ,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ) ;
                                        }),
                                  ),


                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                                    child: Text(
                                      "DOORS,WINDOW,MIRRORS AND WIPERS",style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.bold
                                    ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8,2, 8, 0),
                                    child: Container(
                                      color: Colors.deepOrangeAccent,
                                      width: 70,
                                      height: 4,
                                    ),
                                  ),
                                  Container(
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: 3,
                                        itemBuilder: (context,index)
                                        {
                                          return Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Container(
                                              color: Colors.grey[200],
                                              height: 100,
                                              width: MediaQuery.of(context).size.width,
                                              child: Column(
                                                children: [
                                                  Container(
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("Engine",style: TextStyle(
                                                            fontWeight: FontWeight.bold
                                                        ),),
                                                      )),
                                                  Expanded(
                                                    child: Container(
                                                      color: Colors.white,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Expanded(
                                                            child:Card(
                                                              elevation: 8,
                                                              child:Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Text(
                                                                    "1996cc,4Cylinders Inline,4valves/Cyclinder"
                                                                ),
                                                              ) ,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Card(
                                                              elevation: 8,
                                                              child:Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Text(
                                                                  "1996cc,4Cylinders Inline,4valves/Cyclinder",
                                                                  maxLines: 2,
                                                                ),
                                                              ) ,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ) ;
                                        }),
                                  ),


                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                                    child: Text(
                                      "EXTERIOR",style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.bold
                                    ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8,2, 8, 0),
                                    child: Container(
                                      color: Colors.deepOrangeAccent,
                                      width: 70,
                                      height: 4,
                                    ),
                                  ),
                                  Container(
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: 3,
                                        itemBuilder: (context,index)
                                        {
                                          return Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Container(
                                              color: Colors.grey[200],
                                              height: 100,
                                              width: MediaQuery.of(context).size.width,
                                              child: Column(
                                                children: [
                                                  Container(
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("Engine",style: TextStyle(
                                                            fontWeight: FontWeight.bold
                                                        ),),
                                                      )),
                                                  Expanded(
                                                    child: Container(
                                                      color: Colors.white,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Expanded(
                                                            child:Card(
                                                              elevation: 8,
                                                              child:Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Text(
                                                                    "1996cc,4Cylinders Inline,4valves/Cyclinder"
                                                                ),
                                                              ) ,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Card(
                                                              elevation: 8,
                                                              child:Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Text(
                                                                  "1996cc,4Cylinders Inline,4valves/Cyclinder",
                                                                  maxLines: 2,
                                                                ),
                                                              ) ,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ) ;
                                        }),
                                  ),


                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                                    child: Text(
                                      "LIGHTING",style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.bold
                                    ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8,2, 8, 0),
                                    child: Container(
                                      color: Colors.deepOrangeAccent,
                                      width: 70,
                                      height: 4,
                                    ),
                                  ),
                                  Container(
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: 3,
                                        itemBuilder: (context,index)
                                        {
                                          return Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Container(
                                              color: Colors.grey[200],
                                              height: 100,
                                              width: MediaQuery.of(context).size.width,
                                              child: Column(
                                                children: [
                                                  Container(
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("Engine",style: TextStyle(
                                                            fontWeight: FontWeight.bold
                                                        ),),
                                                      )),
                                                  Expanded(
                                                    child: Container(
                                                      color: Colors.white,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Expanded(
                                                            child:Card(
                                                              elevation: 8,
                                                              child:Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Text(
                                                                    "1996cc,4Cylinders Inline,4valves/Cyclinder"
                                                                ),
                                                              ) ,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Card(
                                                              elevation: 8,
                                                              child:Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Text(
                                                                  "1996cc,4Cylinders Inline,4valves/Cyclinder",
                                                                  maxLines: 2,
                                                                ),
                                                              ) ,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ) ;
                                        }),
                                  ),



                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                                    child: Text(
                                      "INSTRUMENTATION",style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.bold
                                    ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8,2, 8, 0),
                                    child: Container(
                                      color: Colors.deepOrangeAccent,
                                      width: 70,
                                      height: 4,
                                    ),
                                  ),
                                  Container(
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: 3,
                                        itemBuilder: (context,index)
                                        {
                                          return Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Container(
                                              color: Colors.grey[200],
                                              height: 100,
                                              width: MediaQuery.of(context).size.width,
                                              child: Column(
                                                children: [
                                                  Container(
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("Engine",style: TextStyle(
                                                            fontWeight: FontWeight.bold
                                                        ),),
                                                      )),
                                                  Expanded(
                                                    child: Container(
                                                      color: Colors.white,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Expanded(
                                                            child:Card(
                                                              elevation: 8,
                                                              child:Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Text(
                                                                    "1996cc,4Cylinders Inline,4valves/Cyclinder"
                                                                ),
                                                              ) ,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Card(
                                                              elevation: 8,
                                                              child:Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Text(
                                                                  "1996cc,4Cylinders Inline,4valves/Cyclinder",
                                                                  maxLines: 2,
                                                                ),
                                                              ) ,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ) ;
                                        }),
                                  ),


                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                                    child: Text(
                                      "ENTERTAINMENT,INFORMATION AND COMMUNICATION",style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.bold
                                    ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8,2, 8, 0),
                                    child: Container(
                                      color: Colors.deepOrangeAccent,
                                      width: 70,
                                      height: 4,
                                    ),
                                  ),
                                  Container(
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: 3,
                                        itemBuilder: (context,index)
                                        {
                                          return Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Container(
                                              color: Colors.grey[200],
                                              height: 100,
                                              width: MediaQuery.of(context).size.width,
                                              child: Column(
                                                children: [
                                                  Container(
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("Engine",style: TextStyle(
                                                            fontWeight: FontWeight.bold
                                                        ),),
                                                      )),
                                                  Expanded(
                                                    child: Container(
                                                      color: Colors.white,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Expanded(
                                                            child:Card(
                                                              elevation: 8,
                                                              child:Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Text(
                                                                    "1996cc,4Cylinders Inline,4valves/Cyclinder"
                                                                ),
                                                              ) ,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Card(
                                                              elevation: 8,
                                                              child:Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Text(
                                                                  "1996cc,4Cylinders Inline,4valves/Cyclinder",
                                                                  maxLines: 2,
                                                                ),
                                                              ) ,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ) ;
                                        }),
                                  ),



                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                                    child: Text(
                                      "MANUFACTURER WARRANTY",style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.bold
                                    ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8,2, 8, 0),
                                    child: Container(
                                      color: Colors.deepOrangeAccent,
                                      width: 70,
                                      height: 4,
                                    ),
                                  ),
                                  Container(
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: 3,
                                        itemBuilder: (context,index)
                                        {
                                          return Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Container(
                                              color: Colors.grey[200],
                                              height: 100,
                                              width: MediaQuery.of(context).size.width,
                                              child: Column(
                                                children: [
                                                  Container(
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("Engine",style: TextStyle(
                                                            fontWeight: FontWeight.bold
                                                        ),),
                                                      )),
                                                  Expanded(
                                                    child: Container(
                                                      color: Colors.white,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Expanded(
                                                            child:Card(
                                                              elevation: 8,
                                                              child:Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Text(
                                                                    "1996cc,4Cylinders Inline,4valves/Cyclinder"
                                                                ),
                                                              ) ,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Card(
                                                              elevation: 8,
                                                              child:Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Text(
                                                                  "1996cc,4Cylinders Inline,4valves/Cyclinder",
                                                                  maxLines: 2,
                                                                ),
                                                              ) ,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ) ;
                                        }),
                                  ),



                                ],
                              ),
                            ),


                            ListView(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Card(
                                            elevation: 5,
                                            color: Colors.grey[200],
                                            child: Container(
                                              width: 120,
                                              height: 60,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text("Grey")
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Card(
                                            elevation: 5,
                                            color: Colors.white,
                                            child: Container(
                                              width: 120,
                                              height: 60,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text("White")
                                        ],
                                      ),
                                    )

                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Card(
                                            elevation: 5,
                                            color: Colors.black,
                                            child: Container(
                                              width: 120,
                                              height: 60,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text("Black")
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Card(
                                            elevation: 5,
                                            color: Colors.red,
                                            child: Container(
                                              width: 120,
                                              height: 60,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text("Red")
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Card(
                                            elevation: 5,
                                            color: Colors.grey[700],
                                            child: Container(
                                              width: 120,
                                              height: 60,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text("Dark Grey")
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Card(
                                            elevation: 5,
                                            color: Colors.brown,
                                            child: Container(
                                              width: 120,
                                              height: 60,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text("Brown")
                                        ],
                                      ),
                                    ),

                                  ],
                                )
                              ],
                            ),

                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:[
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                                    child: Text(
                                      "FONT",style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.bold
                                    ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8,2, 8, 0),
                                    child: Container(
                                      color: Colors.deepOrangeAccent,
                                      width: 30,
                                      height: 4,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: 0.3*MediaQuery.of(context).size.height,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Expanded(
                                              child: Card(
                                                elevation: 2,
                                                child: Image.asset("images/img.jpg")
                                              ),
                                            ),
                                            Expanded(
                                              child: Card(
                                                elevation: 2,
                                                child: Image.asset("images/img.jpg")
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Expanded(
                                              child: Card(
                                                elevation: 2,
                                                child: Image.asset("images/img.jpg")
                                              ),
                                            ),
                                            Expanded(
                                              child: Card(
                                                elevation: 2,
                                                child:Image.asset("images/img.jpg")
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ),


                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                                    child: Text(
                                      "INTERIOR",style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.bold
                                    ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8,2, 8, 0),
                                    child: Container(
                                      color: Colors.deepOrangeAccent,
                                      width: 70,
                                      height: 4,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                      height: 0.3*MediaQuery.of(context).size.height,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Expanded(
                                                child: Card(
                                                    elevation: 2,
                                                    child: Image.asset("images/img.jpg")
                                                ),
                                              ),
                                              Expanded(
                                                child: Card(
                                                    elevation: 2,
                                                    child: Image.asset("images/img.jpg")
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Expanded(
                                                child: Card(
                                                    elevation: 2,
                                                    child: Image.asset("images/img.jpg")
                                                ),
                                              ),
                                              Expanded(
                                                child: Card(
                                                    elevation: 2,
                                                    child:Image.asset("images/img.jpg")
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                  ),




                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                                    child: Text(
                                      "EXTERIOR",style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.bold
                                    ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8,2, 8, 0),
                                    child: Container(
                                      color: Colors.deepOrangeAccent,
                                      width: 70,
                                      height: 4,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                      height: 0.3*MediaQuery.of(context).size.height,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Expanded(
                                                child: Card(
                                                    elevation: 2,
                                                    child: Image.asset("images/img.jpg")
                                                ),
                                              ),
                                              Expanded(
                                                child: Card(
                                                    elevation: 2,
                                                    child: Image.asset("images/img.jpg")
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Expanded(
                                                child: Card(
                                                    elevation: 2,
                                                    child: Image.asset("images/img.jpg")
                                                ),
                                              ),
                                              Expanded(
                                                child: Card(
                                                    elevation: 2,
                                                    child:Image.asset("images/img.jpg")
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                  ),

                                ],
                              ),
                            ),
                          ],
                          controller: _tabController,
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),

          ],
            ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.deepOrangeAccent,
          ),

          height: 40,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Text("HIDE COMMON FEATURE",style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
