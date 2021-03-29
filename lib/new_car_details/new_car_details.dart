import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_autocare/compare/car_vs_car.dart';
import 'package:my_autocare/new_car_details/all_car_brand.dart';
import 'package:my_autocare/new_car_details/newCar_fliter.dart';
import 'package:my_autocare/new_car_details/new_car_controller/new_car_model_controller.dart';
import 'package:my_autocare/new_car_details/new_car_model/new_car_model.dart';
import 'package:my_autocare/new_car_details/new_car_search.dart';
import 'package:my_autocare/new_car_details/perticular_brand.dart';

class NewCars extends StatefulWidget {
  @override
  _NewCarsState createState() => _NewCarsState();
}

class _NewCarsState extends State<NewCars> with SingleTickerProviderStateMixin {
  bool heightOfList = false;
  bool budget1 = false,
      budget2 = false,
      budget3 = false,
      budget4 = false,
      budget5 = false,
      budget6 = false;

  int _current = 0;
  List imgList = [
    'images/img.png',
    'images/img.png',
    'images/img.png',
    'images/img.png',
    'images/img.png'
  ];

  List item = [
    'images/ad.jpg',
    'images/ad.jpg',
    'images/ad.jpg',
    'images/ad.jpg',
    'images/ad.jpg'
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  NewCarModel newCarModelList;
  bool isLoading1 = true;

  getBrands() async {
    var newCarController = new NewCarController();
    newCarModelList = await newCarController.getCarModel();
    setState(() {
      isLoading1 = false;
    });
  }

  TabController _tabController;
  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    getBrands();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 0.01 * height,
            ),
            Row(
              children: [
                IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "New Cars",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 0.01 * height,
            ),
            CarouselSlider(
              viewportFraction: 1.0,
              height: 120,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
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
                        width: 0.95 * MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0.0),
                            image: DecorationImage(
                                image: AssetImage(item), fit: BoxFit.fill)),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          // child: Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: map<Widget>(imgList, (index, url) {
                          //     return Container(
                          //       width: _current == index ? 22 : 10,
                          //       height: 6.0,
                          //       margin: EdgeInsets.symmetric(
                          //           vertical: 8.0, horizontal: 1.0),
                          //       decoration: BoxDecoration(
                          //           borderRadius: _current == index
                          //               ? BorderRadius.circular(8.0)
                          //               : null,
                          //           shape: _current == index
                          //               ? BoxShape.rectangle
                          //               : BoxShape.circle,
                          //           color: _current == index
                          //               ? Color(0xffff3b00)
                          //               : Colors.grey[300]),
                          //     );
                          //   }),
                          // ),
                        ),
                      ))
                  .toList(),
            ),
            SizedBox(
              height: 0.02 * height,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Lets Explore about New cars information",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 0.008 * height,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchNewCarList()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                width: 1, color: Colors.deepOrangeAccent)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                "images/search.png",
                                width: 15,
                                height: 15,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(2, 2, 10, 2),
                              child: Text(
                                "Search By Model",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewCarFilter()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                width: 1, color: Colors.deepOrangeAccent)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                "images/filter.png",
                                width: 15,
                                height: 15,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(2, 2, 10, 2),
                              child: Text(
                                "Filters",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
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
              height: 0.025 * height,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
              child: Text(
                "WHAT'S YOUR BUDGET ?",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 2, 8, 0),
              child: Container(
                color: Colors.deepOrangeAccent,
                width: 0.3 * width,
                height: 0.004 * height,
              ),
            ),
            SizedBox(
              height: 0.01 * height,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        budget1 = !budget1;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: budget1 ? Colors.grey[200] : Color(0xffff7800),
                          boxShadow: [
                            new BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5.0,
                            ),
                          ]),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.fromLTRB(22, 10, 22, 10),
                        child: Text(
                          "01 to 05 lakh",
                          style: TextStyle(
                              color: budget1 ? Colors.black : Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        budget2 = !budget2;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: budget2 ? Colors.grey[200] : Color(0xffff7800),
                          boxShadow: [
                            new BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5.0,
                            ),
                          ]),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.fromLTRB(22, 10, 22, 10),
                        child: Text(
                          "05 to 10 lakh",
                          style: TextStyle(
                              color: budget2 ? Colors.black : Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        budget3 = !budget3;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: budget3 ? Colors.grey[200] : Color(0xffff7800),
                          boxShadow: [
                            new BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5.0,
                            ),
                          ]),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.fromLTRB(22, 10, 22, 10),
                        child: Text(
                          "10 to 15 lakh",
                          style: TextStyle(
                              color: budget3 ? Colors.black : Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 0.003 * height,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        budget4 = !budget4;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: budget4 ? Colors.grey[200] : Color(0xffff7800),
                          boxShadow: [
                            new BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5.0,
                            ),
                          ]),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.fromLTRB(22, 10, 22, 10),
                        child: Text(
                          "15 to 20 lakh",
                          style: TextStyle(
                              color: budget4 ? Colors.black : Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        budget5 = !budget5;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: budget5 ? Colors.grey[200] : Color(0xffff7800),
                          boxShadow: [
                            new BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5.0,
                            ),
                          ]),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Text(
                          "20 to 30 lakh",
                          style: TextStyle(
                              color: budget5 ? Colors.black : Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        budget6 = !budget6;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: budget6 ? Colors.grey[200] : Color(0xffff7800),
                          boxShadow: [
                            new BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5.0,
                            ),
                          ]),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.fromLTRB(17, 10, 17, 10),
                        child: Text(
                          "30 lakh & Above",
                          style: TextStyle(
                              color: budget6 ? Colors.black : Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 11),
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 0.02 * height,
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
              child: Text(
                "POPULAR BRAND",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 2, 8, 0),
              child: Container(
                color: Colors.deepOrange,
                width: 0.3 * width,
                height: 0.004 * height,
              ),
            ),
            SizedBox(
              height: 0.015 * height,
            ),

            //Car Brands//
            isLoading1
                ? Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 0.50 * height,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PerticularBrand(
                                            carBrandId: newCarModelList
                                                .brands[index].id)));
                              },
                              child: Container(
                                height: 30,
                                child: Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.network(
                                        newCarModelList.brands[index].image,
                                        width: 45,
                                        height: 45,
                                        fit: BoxFit.cover,
                                      ),
                                      SizedBox(height: 10),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xffff7800),
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                              topLeft: Radius.circular(12),
                                              topRight: Radius.circular(12)),
                                        ),
                                        height: height * 0.04,
                                        child: Center(
                                          child: Text(
                                            newCarModelList
                                                .brands[index].carBrandName,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 11,
                                            ),
                                            maxLines: 2,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: 9,
                        )),
                  ),
            /*isLoading1?Center(child: CircularProgressIndicator()):Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(newCarModelList.brands[0].image,
                            width: 35,
                            height: 35,),
                            Text(newCarModelList.brands[0].carBrandName,style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10
                            ),)
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(newCarModelList.brands[1].image,
                              width: 35,
                              height: 35,),
                            Text(newCarModelList.brands[1].carBrandName,style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 8
                            ),)
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(newCarModelList.brands[2].image,
                              width: 35,
                              height: 35,),
                            Text(newCarModelList.brands[2].carBrandName,style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10
                            ),)
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(newCarModelList.brands[3].image,
                              width: 35,
                              height: 35),
                            Text(newCarModelList.brands[3].carBrandName,style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10
                            ),)
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(newCarModelList.brands[4].image,
                              width: 35,
                              height: 35,),
                            Text(newCarModelList.brands[4].carBrandName,style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12
                            ),)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              isLoading1?Center(child: CircularProgressIndicator()):Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(newCarModelList.brands[5].image,
                              width: 35,
                              height: 35,),
                           */ /* Text(newCarModelList.brands[5].carBrandName,style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10
                            ),)*/ /*
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(newCarModelList.brands[6].image,
                              width: 35,
                              height: 35,),
                            */ /*Text(newCarModelList.brands[6].carBrandName,style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10
                            ),)*/ /*
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(newCarModelList.brands[7].image,
                              width: 35,
                              height: 35,),
                           */ /* Text(newCarModelList.brands[7].carBrandName,style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 9
                            ),)*/ /*
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(newCarModelList.brands[8].image,
                              width: 35,
                              height: 35,),
                           */ /* Text(newCarModelList.brands[8].carBrandName,style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10
                            ),)*/ /*
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(newCarModelList.brands[9].image,
                              width: 35,
                              height: 35,),
                           */ /* Text(newCarModelList.brands[9].carBrandName,style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10
                            ),)*/ /*
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),*/

            SizedBox(
              height: 0.002 * height,
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AllCarBrands()));
                    },
                    child: Text(
                      "View all Brands >>",
                      style: TextStyle(
                          color: Colors.deepOrangeAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  )),
                ),
              ),
            ),

            SizedBox(
              height: 0.002 * height,
            ),
            // Container(
            //   height: 120,
            //   child: CarouselSlider(
            //     viewportFraction: 1.0,
            //     height: 110,
            //     initialPage: 0,
            //     enableInfiniteScroll: true,
            //     reverse: false,
            //     autoPlay: false,
            //     autoPlayInterval: Duration(seconds: 3),
            //     autoPlayAnimationDuration: Duration(milliseconds: 800),
            //     autoPlayCurve: Curves.fastOutSlowIn,
            //     scrollDirection: Axis.horizontal,
            //     onPageChanged: (index) {
            //       setState(() {
            //         _current = index;
            //       });
            //     },
            //     items: item
            //         .map((item) => Container(
            //               width: MediaQuery.of(context).size.width,
            //               child: Image.asset(item, fit: BoxFit.cover),
            //             ))
            //         .toList(),
            //   ),
            // ),
            // SizedBox(
            //   height: 0.002 * height,
            // ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 0.28 * height,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.grey[100],
                        ),
                        height: 35,
                        child: TabBar(
                          unselectedLabelColor: Colors.deepOrange,
                          indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.deepOrange),
                          labelStyle: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                          tabs: [
                            Tab(
                              child: Center(child: Text("LATEST CARS")),
                            ),
                            Tab(
                              child: Center(child: Text("UPCOMING CARS")),
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
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      elevation: 5.0,
                                      child: Container(
                                        width: 0.36 * width,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Stack(
                                              overflow: Overflow.visible,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  child: Image.asset(
                                                    "images/img.jpg",
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Positioned(
                                                  right: -10,
                                                  top: -5,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors
                                                            .deepOrangeAccent,
                                                        shape: BoxShape.circle),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Image.asset(
                                                        "images/noti.png",
                                                        width: 15,
                                                        height: 15,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8, 8, 2, 1),
                                              child: Text(
                                                "Honda city",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8, 2, 2, 1),
                                              child: Text(
                                                "₹${3.45} - ₹${6.50} Lakh",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8, 2, 2, 1),
                                              child: Text(
                                                "On Road Price Bangalore",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 10),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                            ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      elevation: 5.0,
                                      child: Container(
                                        width: 0.36 * width,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Stack(
                                              overflow: Overflow.visible,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  child: Image.asset(
                                                    "images/img.jpg",
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Positioned(
                                                  right: -10,
                                                  top: -5,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors
                                                            .deepOrangeAccent,
                                                        shape: BoxShape.circle),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Image.asset(
                                                        "images/noti.png",
                                                        width: 15,
                                                        height: 15,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8, 8, 2, 1),
                                              child: Text(
                                                "Honda city",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8, 2, 2, 1),
                                              child: Text(
                                                "₹${3.45} - ₹${6.50} Lakh",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8, 2, 2, 1),
                                              child: Text(
                                                "On Road Price Bangalore",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 10),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
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
                "COMPARISON",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 2, 8, 0),
              child: Container(
                color: Colors.deepOrangeAccent,
                width: 0.3 * width,
                height: 0.004 * height,
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
                height: 0.26 * height,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return index == 4
                        ? Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Column(
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side: BorderSide(
                                        width: 1, color: Colors.grey),
                                  ),
                                  elevation: 5.0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 0.6 * width,
                                      height: 0.13 * height,
                                      child: Center(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  RawMaterialButton(
                                                    onPressed: () {},
                                                    elevation: 2.0,
                                                    fillColor:
                                                        Colors.deepOrangeAccent,
                                                    child: Icon(
                                                      Icons.add,
                                                      color: Colors.white,
                                                      size: 30.0,
                                                    ),
                                                    padding:
                                                        EdgeInsets.all(5.0),
                                                    shape: CircleBorder(),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      "ADD CAR",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            CircleAvatar(
                                              backgroundColor:
                                                  Colors.deepOrangeAccent,
                                              radius: 10,
                                              child: Text(
                                                "Vs",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  RawMaterialButton(
                                                    onPressed: () {},
                                                    elevation: 2.0,
                                                    fillColor:
                                                        Colors.deepOrangeAccent,
                                                    child: Icon(
                                                      Icons.add,
                                                      color: Colors.white,
                                                      size: 30.0,
                                                    ),
                                                    padding:
                                                        EdgeInsets.all(5.0),
                                                    shape: CircleBorder(),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      "ADD CAR",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => CarVsCar()));
                                  },
                                  child: Container(
                                    width: 0.625 * width,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        color: Colors.deepOrangeAccent),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          "COMPARE CARS",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Column(
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side: BorderSide(
                                        width: 1, color: Colors.grey),
                                  ),
                                  elevation: 5.0,
                                  child: Container(
                                    //width: 0.45*width,
                                    height: 0.15 * height,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 0.3 * width,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Image.asset(
                                                    "images/img.jpg",
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        8, 2, 2, 1),
                                                child: Text(
                                                  "Honda city",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 10),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        8, 2, 2, 1),
                                                child: Text(
                                                  "₹${3.45} - ₹${6.50} Lakh",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 8),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        8, 2, 2, 1),
                                                child: Text(
                                                  "On Road Price Bangalore",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 8),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        CircleAvatar(
                                          backgroundColor:
                                              Colors.deepOrangeAccent,
                                          radius: 10,
                                          child: Text(
                                            "Vs",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          width: 0.3 * width,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Image.asset(
                                                    "images/img.jpg",
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        8, 2, 2, 1),
                                                child: Text(
                                                  "Honda city",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 10),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        8, 2, 2, 1),
                                                child: Text(
                                                  "₹${3.45} - ₹${6.50} Lakh",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 8),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        8, 2, 2, 4),
                                                child: Text(
                                                  "On Road Price Bangalore",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 8),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      color: Colors.transparent),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        "",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
