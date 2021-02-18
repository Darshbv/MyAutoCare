import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_autocare/details/newCar_fliter.dart';
import 'package:my_autocare/details/new_car_search.dart';

class NewCars extends StatefulWidget {
  @override
  _NewCarsState createState() => _NewCarsState();
}

class _NewCarsState extends State<NewCars> with SingleTickerProviderStateMixin{

  int _current = 0;
  List imgList = [
    'images/img.png',
    'images/img.png',
    'images/img.png',
    'images/img.png',
    'images/img.png'
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }


  TabController _tabController;
  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Cars",style: TextStyle(
          color: Colors.white
        ),),
        centerTitle: false,
      ),
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
                height: 200,
                autoPlay: true,
                aspectRatio: 2,
                enlargeCenterPage: true,
                autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(seconds: 4),
              onPageChanged: (index) {
                setState(() {
                  _current = index;
                });
              },
              pauseAutoPlayOnTouch: Duration(seconds: 5),
              items: imgList.map((imgUrl) {
                return Builder(builder: (BuildContext context) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        image: DecorationImage(
                            image: AssetImage(imgUrl), fit: BoxFit.cover)),
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(10.0),
                  );
                });
              }).toList(),
            ),
            SizedBox(
              height: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(imgList, (index, url) {
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == index ? Colors.red : Colors.black38),
                );
              }),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchNewCarList()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            width: 1,
                            color: Colors.red
                          )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:Image.asset("images/search.png",width: 15,height: 15,),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(2, 2, 10, 2),
                              child: Text("Search By Model"),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>NewCarFilter()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                width: 1,
                                color: Colors.red
                            )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset("images/filter.png",width: 15,height: 15,),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(2, 2, 10, 2),
                              child: Text("Filters"),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
              child: Text(
                "WHAT IS YOUR BUDGET?",style: TextStyle(
                fontSize: 18,fontWeight: FontWeight.bold
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8,2, 8, 0),
              child: Container(
                color: Colors.blue,
                width: 70,
                height: 4,
              ),
            ),
            SizedBox(
              height: 5,
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OutlineButton(
                            onPressed: (){},
                            child: Center(child: Text("2Lakhs",style: TextStyle(
                              color: Colors.black,fontWeight: FontWeight.bold
                            ),)),
                          ),
                          OutlineButton(
                            onPressed: (){},
                            child: Center(child: Text("5-10Lakhs",style: TextStyle(
                                color: Colors.black,fontWeight: FontWeight.bold
                            ),)),
                          ),
                          OutlineButton(
                            onPressed: (){},
                            child: Center(child: Text("15-02Lakhs",style: TextStyle(
                                color: Colors.black,fontWeight: FontWeight.bold
                            ),)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          OutlineButton(
                            onPressed: (){},
                            child: Center(child: Text("2-5Lakhs",style: TextStyle(
                                color: Colors.black,fontWeight: FontWeight.bold
                            ),)),
                          ),
                          OutlineButton(
                            onPressed: (){},
                            child: Center(child: Text("10-15Lakhs",style: TextStyle(
                                color: Colors.black,fontWeight: FontWeight.bold
                            ),)),
                          ),
                          OutlineButton(
                            onPressed: (){},
                            child: Center(child: Text("View More >",style: TextStyle(
                                color: Colors.red,fontWeight: FontWeight.bold
                            ),)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 3,
            ),


            Padding(
              padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
              child: Text(
                "POPULAR BRAND",style: TextStyle(
                  fontSize: 18,fontWeight: FontWeight.bold
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8,2, 8, 0),
              child: Container(
                color: Colors.blue,
                width: 70,
                height: 4,
              ),
            ),



            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:Colors.grey,
                                width: 1
                              )
                            ),
                            child: Column(
                              children: [
                                Image.asset("images/tata.png"),
                                Text("Maruti Suzuki")
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:Colors.grey,
                                    width: 1
                                )
                            ),
                            child: Column(
                              children: [
                                Image.asset("images/tata.png"),
                                Text("Mahindra")
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:Colors.grey,
                                    width: 1
                                )
                            ),
                            child: Column(
                              children: [
                                Image.asset("images/tata.png"),
                                Text("Skoda")
                              ],
                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:Colors.grey,
                                    width: 1
                                )
                            ),
                            child: Column(
                              children: [
                                Image.asset("images/tata.png"),
                                Text("AUDI")
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:Colors.grey,
                                    width: 1
                                )
                            ),
                            child: Column(
                              children: [
                                Image.asset("images/tata.png"),
                                Text("Tata")
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:Colors.grey,
                                    width: 1
                                )
                            ),
                            child: Column(
                              children: [
                                Image.asset("images/tata.png"),
                                Text("BMW")
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:Colors.grey,
                                    width: 1
                                )
                            ),
                            child: Column(
                              children: [
                                Image.asset("images/tata.png"),
                                Text("Hyundai")
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:Colors.grey,
                                    width: 1
                                )
                            ),
                            child: Column(
                              children: [
                                Image.asset("images/tata.png"),
                                Text("Toyota")
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:Colors.grey,
                                    width: 1
                                )
                            ),
                            child: Column(
                              children: [
                                Image.asset("images/tata.png"),
                                Text("Renault")
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Container(
                  width: 350,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    color: Colors.red
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text("View all Brands",
                      style: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.bold,fontSize: 15),)),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 313,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.red[100],
                        ),
                        height: 35,
                        child: TabBar(
                          unselectedLabelColor:Colors.grey[700],
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color:Colors.red
                          ),
                          labelStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold
                          ),
                          tabs: [
                            Tab(
                              child: Center(child: Text("POPULAR CARS")),
                            ),
                            Tab(
                              child: Center(child: Text("NEW LAUNCH CARS")),
                            ),
                          ],
                          controller: _tabController,
                          indicatorSize: TabBarIndicatorSize.tab,
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            ListView.builder(
                              scrollDirection: Axis.horizontal,
                                  itemCount: 5
                                ,itemBuilder: (context,index)
                                {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5)
                                        ),
                                        elevation: 5.0,
                                        child: index==4?Container(
                                          width: 270,
                                          child:Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              RawMaterialButton(
                                                onPressed: () {},
                                                elevation: 2.0,
                                                fillColor: Colors.red,
                                                child: Icon(
                                                  Icons.arrow_forward_ios_rounded,
                                                  color: Colors.white,
                                                  size: 20.0,
                                                ),
                                                padding: EdgeInsets.all(15.0),
                                                shape: CircleBorder(),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text("View More",style: TextStyle(
                                                  fontWeight: FontWeight.bold,fontSize: 16
                                                ),),
                                              )
                                            ],
                                          ),
                                      ):Container(
                                          width: 270,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(8,16,2,1),
                                                child: Text("Honda city",
                                                style: TextStyle(
                                                  color: Colors.black,fontWeight: FontWeight.bold
                                                ),),
                                              ),
                                              Image.asset("images/img.jpg",
                                                fit: BoxFit.cover,),
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(8,2,2,1),
                                                child: Text("₹8,24,898",
                                                  style: TextStyle(
                                                      color: Colors.black,fontWeight: FontWeight.bold
                                                  ),),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(8,2,2,1),
                                                child: Text("On Road Price Bangalore",
                                                  style: TextStyle(
                                                      color: Colors.black
                                                  ),),
                                              ),

                                            ],
                                          ),
                                        ),

                              ),
                                    ) ;
                            }),
                            ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 5
                                ,itemBuilder: (context,index)
                            {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                  elevation: 5.0,
                                  child: index==4?Container(
                                    width: 270,
                                    child:Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        RawMaterialButton(
                                          onPressed: () {},
                                          elevation: 2.0,
                                          fillColor: Colors.red,
                                          child: Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: Colors.white,
                                            size: 20.0,
                                          ),
                                          padding: EdgeInsets.all(15.0),
                                          shape: CircleBorder(),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("View More",style: TextStyle(
                                              fontWeight: FontWeight.bold,fontSize: 16
                                          ),),
                                        )
                                      ],
                                    ),
                                  ):Container(
                                    width: 270,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(8,16,2,1),
                                          child: Text("Honda city",
                                            style: TextStyle(
                                                color: Colors.black,fontWeight: FontWeight.bold
                                            ),),
                                        ),
                                        Image.asset("images/img.jpg",
                                          fit: BoxFit.cover,),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(8,2,2,1),
                                          child: Text("₹8,24,898",
                                            style: TextStyle(
                                                color: Colors.black,fontWeight: FontWeight.bold
                                            ),),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(8,2,2,1),
                                          child: Text("On Road Price Bangalore",
                                            style: TextStyle(
                                                color: Colors.black
                                            ),),
                                        ),

                                      ],
                                    ),
                                  ),

                                ),
                              ) ;
                            }),
                          ],
                          controller: _tabController,
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
              child: Text(
                "COMPARISON",style: TextStyle(
                  fontSize: 18,fontWeight: FontWeight.bold
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8,2, 8, 0),
              child: Container(
                color: Colors.blue,
                width: 70,
                height: 4,
              ),
            ),


            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: Container(
                height: 200,
                child:ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)
                        ),
                        elevation: 5.0,
                        child: index==4?Container(
                          width: 370,
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RawMaterialButton(
                                onPressed: () {},
                                elevation: 2.0,
                                fillColor: Colors.red,
                                child: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.white,
                                  size: 20.0,
                                ),
                                padding: EdgeInsets.all(15.0),
                                shape: CircleBorder(),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("View More",style: TextStyle(
                                    fontWeight: FontWeight.bold,fontSize: 16
                                ),),
                              )
                            ],
                          ),
                        ):Container(
                          width: 370,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Stack(
                                overflow: Overflow.visible,
                                children:[ Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Image.asset("images/img.jpg"),
                                    )),
                                    Expanded(child:
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Image.asset("images/img.jpg"),
                                    )),
                                  ],
                                ),
                                  Positioned(
                                    left: 165,
                                    top: 68,
                                    child:CircleAvatar(
                                      backgroundColor: Colors.black,
                                      radius: 20,
                                      child: Text("Vs",style: TextStyle(
                                        color: Colors.white,
                                          fontWeight: FontWeight.bold
                                      ),),
                                    ) ,
                                  )
                          ],
                              ),

                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Text("Honda City"),
                                      Text("₹8,24,898",style: TextStyle(
                                          fontWeight: FontWeight.bold
                                      ),)
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text("Swift"),
                                      Text("₹8,24,898",style: TextStyle(
                                          fontWeight: FontWeight.bold
                                      ),)
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),

                      ),
                    );
                  },
                ),
              ),
            )

          ],
        ),
      )
    );
  }
}
