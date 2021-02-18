import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchNewCarList extends StatefulWidget {
  @override
  _SearchNewCarListState createState() => _SearchNewCarListState();
}

class _SearchNewCarListState extends State<SearchNewCarList> {

    List<String> carList=["Kia Sonet",
      "Maruti Ciaz",
      "Maruti Suzuki Swift",
      "Honda City",
      "Hyundai Venue",
      "Tata Altos",
      "Toyota Urban",
      "Cruiser"];

    List<String> tempList = List<String>();

  _filterList(String text)
  {
    if(text.isNotEmpty){
      setState(() {
        carList = carList;
      });
    }
    else
      {
      final List<String> cars = [];
      tempList.map((c){
        if(c.contains(text.toString().toUpperCase())){
          cars.add(c);
        }
      }).toList();
      setState(() {
        carList.clear();
        carList.addAll(cars);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Search Near by Car Name",
        style: TextStyle(
          color: Colors.white
        ),),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            SizedBox(
              height: 40,
            ),
            _searchBar(),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("TRENDING SEARCHES",style: TextStyle(
                color: Colors.grey[600]
              ),),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 1,
              child: _mainData(),
            )
          ],
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        padding: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(color:Colors.red,width: 1.0)
        ),
        child: Center(
          child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: "What are you looking for?",
                hintStyle: TextStyle(fontSize: 18),
                hintTextDirection: TextDirection.ltr,
                prefixIcon: Icon(Icons.search,color: Colors.grey[600],)
              ),
              onChanged: (text) {
                _filterList(text);
              }
          ),
        ),
      ),
    );
  }

  Widget _mainData() {
    return Center(
      child: ListView.builder(
        itemCount: carList.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Container(
                height: 50,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage("images/bmw_demo.png"),
                    fit: BoxFit.fill
                  )
                ),
              ),
              title:Text(carList[index],style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 18
              ),
              ),
              trailing: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 15,
                child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,size: 15,),
              ),
            );
          }
      ),
    );
  }
}


/*

Text(carList[index],style: TextStyle(
color: Colors.grey[600],
fontSize: 18
),
),*/
