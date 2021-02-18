import 'package:flutter/material.dart';

class NewCarFilter extends StatefulWidget {
  @override
  _NewCarFilterState createState() => new _NewCarFilterState();
}

class _NewCarFilterState extends State<NewCarFilter> {

  //Radio//
  int _groupValue = -1;
  bool isExpanded1=false,isExpanded2=false,isExpanded3=false,
      isExpanded4=false,isExpanded5=false,isExpanded6=false;

  //RangeSlider//
  double _lowValue=2.0;
  double _highValue=100.0;

  //Check Boxes//
  bool brand1=false,brand2=false,brand3=false,
      brand4=false,brand5=false,brand6=false;
  

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Filter',style: TextStyle(
          color: Colors.white
        ),),
        centerTitle: false,
      ),
      body: Column(
        children: [

          ExpansionTile(
            title: Text("Sort By",style: TextStyle(color: Colors.grey[600]),),
            initiallyExpanded: false,
            trailing:isExpanded1?Icon(Icons.keyboard_arrow_up_outlined,
              color:Colors.grey[600]):Icon(Icons.keyboard_arrow_down_outlined,
            color: Colors.grey[600]),
            backgroundColor: Colors.grey[100],
            onExpansionChanged: (bool expanding) => setState(() => this.isExpanded1 = expanding),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  RadioListTile(
                    activeColor: Colors.red[700],
                    value: 0,
                    groupValue: _groupValue,
                    onChanged: (value){
                      setState(() {
                        _groupValue=value;
                      });
                    },
                    title: Text("Price Low to High"),
                  ),
                  RadioListTile(
                    activeColor: Colors.red[700],
                    value: 1,
                    groupValue: _groupValue,
                    onChanged: (value){
                      setState(() {
                        _groupValue=value;
                      });
                    },
                    title: Text("Price High to Low"),
                  ),
                  RadioListTile(
                    activeColor: Colors.red[700],
                    value: 2,
                    groupValue: _groupValue,
                    onChanged: (value){
                      setState(() {
                        _groupValue=value;
                      });
                    },
                    title: Text("Popular"),

                  )
                ],
              ),
            ],
          ),

          ExpansionTile(
            title:Text("Budget",style: TextStyle(color: Colors.grey[600]),),
            initiallyExpanded: false,
            trailing:isExpanded2?Icon(Icons.keyboard_arrow_up_outlined,
              color:Colors.grey[600]):Icon(Icons.keyboard_arrow_down_outlined,
                color: Colors.grey[600]),
            backgroundColor: Colors.grey[100],
            onExpansionChanged: (bool expanding) => setState(() => this.isExpanded2 = expanding),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: RangeSlider(
                        min: 0,
                        max: 100,
                        divisions: 50,
                        inactiveColor: Colors.grey,
                        activeColor: Colors.red[600],
                        values: RangeValues(_lowValue,_highValue),
                        onChanged: (_range){
                          setState(() {
                            _lowValue=_range.start;
                            _highValue=_range.end;
                          });
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(color: Colors.red,
                                  width: 1)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("${_lowValue.toInt().toString()}  Lakhs"),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(color: Colors.red,
                                  width: 1)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("${_highValue.toInt().toString()}  Lakhs"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              )


            ],
          ),

          ExpansionTile(
            title:Text("Brand Name",style: TextStyle(color: Colors.grey[600]),),
            initiallyExpanded: false,
            trailing:isExpanded3?Icon(Icons.keyboard_arrow_up_outlined,
                color:Colors.grey[600]):Icon(Icons.keyboard_arrow_down_outlined,
                color: Colors.grey[600]),
            backgroundColor: Colors.grey[100],
            onExpansionChanged: (bool expanding) => setState(() => this.isExpanded3 = expanding),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Checkbox(

                                splashRadius: 5.0,
                                activeColor: Colors.red,
                                onChanged: (value){
                                      setState(() {
                                          brand1=value;
                                      });},
                                value:brand1,
                              ),
                              Text("Maruti")
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                splashRadius: 5.0,
                                activeColor: Colors.red,
                                onChanged: (value){
                                  setState(() {
                                    brand2=value;
                                  });},
                                value:brand2,
                              ),
                              Text("Hyundai")
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                splashRadius: 5.0,
                                activeColor: Colors.red,
                                onChanged: (value){
                                  setState(() {
                                    brand3=value;
                                  });},
                                value:brand3,
                              ),
                              Text("Audi")
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                splashRadius: 5.0,
                                activeColor: Colors.red,
                                onChanged: (value){
                                  setState(() {
                                    brand4=value;
                                  });},
                                value:brand4,
                              ),
                              Text("Toyota")
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                splashRadius: 5.0,
                                activeColor: Colors.red,
                                onChanged: (value){
                                  setState(() {
                                    brand5=value;
                                  });},
                                value:brand5,
                              ),
                              Text("BMW")
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                splashRadius: 5.0,
                                activeColor: Colors.red,
                                onChanged: (value){
                                  setState(() {
                                    brand6=value;
                                  });},
                                value:brand6,
                              ),
                              Text("Kia")
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),




          ExpansionTile(
            title: Text("Sort By",style: TextStyle(color: Colors.grey[600]),),
            initiallyExpanded: false,
            trailing:isExpanded4?Icon(Icons.keyboard_arrow_up_outlined,
                color:Colors.grey[600]):Icon(Icons.keyboard_arrow_down_outlined,
                color: Colors.grey[600]),
            backgroundColor: Colors.grey[100],
            onExpansionChanged: (bool expanding) => setState(() => this.isExpanded4 = expanding),
            children: [


            ],
          ),

        ],
      )
    );
  }
}

