import 'package:flutter/material.dart';

class NewCarFilter extends StatefulWidget {
  @override
  _NewCarFilterState createState() => new _NewCarFilterState();
}

class _NewCarFilterState extends State<NewCarFilter> {

  //Radio//
  int _groupValue = -1;
  bool isExpanded1=false,isExpanded2=false,isExpanded3=false,
      isExpanded4=false,isExpanded5=false,isExpanded6=false,isExpanded7=false;

  //RangeSlider//
  double _lowValue=2.0;
  double _highValue=100.0;

  //Check Boxes//
  bool brand1=false,brand2=false,brand3=false,
      brand4=false,brand5=false,brand6=false;

  //Fuel Type//
  bool petrol=false,electric=false,cng=false,diesel=false;


  //Transmission Type//
  bool automatic=false,manual=false,semi_automatic=false;

  //BodyType//
  bool sedan=false,couple=false,hatchback=false,van=false,
      convertible=false,suv=false,truck=false,wagon=false,csedan=false;

  //Color Checkboxes//
  bool color1=false,color2=false,color3=false,
      color4=false,color5=false,color6=false;
  

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        IconButton(icon: Icon(Icons.arrow_back),
                        onPressed: (){
                          Navigator.pop(context);
                        },),
                        Text("Search New Cars",style: TextStyle(
                            color: Colors.black,
                          fontSize: 18,fontWeight: FontWeight.bold
                        ),)
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Reset All",style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,fontWeight: FontWeight.bold
                      ),),
                    ),
                  )
                ],
              ),

              //Sort By Expansion Tile//
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

              //Budget Expansion Tile
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

              //Brand Name Expansion Tile//
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


              //Fuel type//
              ExpansionTile(
                title: Text("Fuel Type",style: TextStyle(color: Colors.grey[600]),),
                initiallyExpanded: false,
                trailing:isExpanded4?Icon(Icons.keyboard_arrow_up_outlined,
                    color:Colors.grey[600]):Icon(Icons.keyboard_arrow_down_outlined,
                    color: Colors.grey[600]),
                backgroundColor: Colors.grey[100],
                onExpansionChanged: (bool expanding) => setState(() => this.isExpanded4 = expanding),
                children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    petrol=!petrol;
                                  });
                                },
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset("images/petrol.png",
                                        color: petrol?Colors.red[600]:null,
                                        fit: BoxFit.fill,
                                        width: 75,
                                        height: 55,),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Petrol",style: TextStyle(color:petrol?Colors.red[300]:Colors.grey[600]),),
                                    )
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: ()
                                {
                                  setState(() {
                                    electric=!electric;
                                  });
                                },
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset("images/electric.png",
                                          color: electric?Colors.red[600]:null,
                                          fit:BoxFit.fill,
                                      width: 75,
                                      height: 55,),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Electric",style:
                                      TextStyle(color:electric?Colors.red[300]:Colors.grey[600]),),
                                    )
                                  ],
                                ),
                              )

                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    cng=!cng;
                                  });
                                },
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset("images/cng.png",
                                        color: cng?Colors.red[600]:null,
                                        fit: BoxFit.fill,
                                        width: 75,
                                        height: 55,),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("CNG",style:
                                      TextStyle(color:cng?Colors.red[300]:Colors.grey[600]),),
                                    )
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    diesel=!diesel;
                                  });
                                },
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset("images/diesel.png",
                                        color:diesel?Colors.red[600]:null,
                                        fit: BoxFit.fill,
                                        width: 75,
                                        height: 55,),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Diesel",style: TextStyle(color:diesel? Colors.red[300]:Colors.grey[600]),),
                                    )
                                  ],
                                ),
                              )


                            ],
                          )
                        ],
                      ),


                ],
              ),


              //Transmission Type//
              ExpansionTile(
                title:Text("TransMission Type",style: TextStyle(color: Colors.grey[600]),),
                initiallyExpanded: false,
                trailing:isExpanded5?Icon(Icons.keyboard_arrow_up_outlined,
                    color:Colors.grey[600]):Icon(Icons.keyboard_arrow_down_outlined,
                    color: Colors.grey[600]),
                backgroundColor: Colors.grey[100],
                onExpansionChanged: (bool expanding) => setState(() =>
                this.isExpanded5 = expanding),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                            automatic=!automatic;
                          });
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset("images/automatic_black.png",
                                color: automatic?Colors.red[600]:Colors.grey[600],
                                fit: BoxFit.fill,
                                width: 30,
                                height: 50,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Automatic",style: TextStyle(color:automatic?Colors.red[300]:Colors.grey[600]),),
                            )
                          ],
                        ),
                      ),

                      InkWell(
                        onTap: (){
                          setState(() {
                            manual=!manual;
                          });
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset("images/manual.png",
                                color: manual?Colors.red[600]:Colors.grey[600],
                                fit: BoxFit.fill,
                                width: 45,
                                height: 50,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Manual",style: TextStyle(color:manual?Colors.red[300]:Colors.grey[600]),),
                            )
                          ],
                        ),
                      ),

                      InkWell(
                        onTap: (){
                          setState(() {
                            semi_automatic=!semi_automatic;
                          });
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset("images/automatic_black.png",
                                color: semi_automatic?Colors.red[600]:Colors.grey[600],
                                fit: BoxFit.fill,
                                width: 30,
                                height: 50,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Semi-Auto",style: TextStyle(color:semi_automatic?Colors.red[300]:Colors.grey[600]),),
                            )
                          ],
                        ),
                      )

                    ],
                  )
                ],
              ),


              //Body Type//
              ExpansionTile(
                title:Text("Body Type",style: TextStyle(color: Colors.grey[600]),),
                initiallyExpanded: false,
                trailing:isExpanded6?Icon(Icons.keyboard_arrow_up_outlined,
                    color:Colors.grey[600]):Icon(Icons.keyboard_arrow_down_outlined,
                    color: Colors.grey[600]),
                backgroundColor: Colors.grey[100],
                onExpansionChanged: (bool expanding) => setState(() =>
                this.isExpanded6 = expanding),
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: (){
                              setState(() {
                                      sedan=!sedan;
                              });
                            },
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset("images/sedan_car_model.png",
                                    color: sedan?Colors.red[600]:Colors.grey[600],
                                    fit: BoxFit.fill,
                                    width: 77,
                                    height: 27,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Sedan",style: TextStyle(color:sedan?Colors.red[300]:Colors.grey[600]),),
                                )
                              ],
                            ),
                          ),

                          InkWell(
                            onTap: (){
                              setState(() {
                                      couple=!couple;
                              });
                            },
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset("images/coupe.png",
                                    color: couple?Colors.red[600]:Colors.grey[600],
                                    fit: BoxFit.fill,
                                    width: 77,
                                    height: 27,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Couple",style:
                                  TextStyle(color:couple?Colors.red[300]:Colors.grey[600]),),
                                )
                              ],
                            ),
                          ),

                          InkWell(
                            onTap: (){
                              setState(() {
                                hatchback=!hatchback;
                              });
                            },
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset("images/hatchback.png",
                                    color: hatchback?Colors.red[600]:Colors.grey[600],
                                    fit: BoxFit.fill,
                                    width: 77,
                                    height: 27,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Hatchback",style:
                                  TextStyle(color:hatchback?Colors.red[300]:Colors.grey[600]),),
                                )
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
                          InkWell(
                            onTap: (){
                              setState(() {
                                    van=!van;
                              });
                            },
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset("images/mini_van.png",
                                    color: van?Colors.red[600]:Colors.grey[600],
                                    fit: BoxFit.fill,
                                    width: 77,
                                    height: 27,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("MiniVan/Van",style: TextStyle(color:van?Colors.red[300]:Colors.grey[600]),),
                                )
                              ],
                            ),
                          ),

                          InkWell(
                            onTap: (){
                              setState(() {
                                    convertible=!convertible;
                              });
                            },
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset("images/cabriolet.png",
                                    color: convertible?Colors.red[600]:Colors.grey[600],
                                    fit: BoxFit.fill,
                                    width: 77,
                                    height: 27,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Convertible",style:
                                  TextStyle(color:convertible?Colors.red[300]:Colors.grey[600]),),
                                )
                              ],
                            ),
                          ),

                          InkWell(
                            onTap: (){
                              setState(() {
                                        suv=!suv;
                              });
                            },
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset("images/suv_car.png",
                                    color: suv?Colors.red[600]:Colors.grey[600],
                                    fit: BoxFit.fill,
                                    width: 77,
                                    height: 27,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("SUV/MUV",style: TextStyle(color:suv?Colors.red[300]:Colors.grey[600]),),
                                )
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: (){
                              setState(() {
                                    truck=!truck;
                              });
                            },
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset("images/truck.png",
                                    color: truck?Colors.red[600]:Colors.grey[600],
                                    fit: BoxFit.fill,
                                    width: 77,
                                    height: 27,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Truck",style:
                                  TextStyle(color:truck?Colors.red[300]:Colors.grey[600]),),
                                )
                              ],
                            ),
                          ),

                          InkWell(
                            onTap: (){
                              setState(() {
                                  wagon=!wagon;
                              });
                            },
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset("images/wagon.png",
                                    color: wagon?Colors.red[600]:Colors.grey[600],
                                    fit: BoxFit.fill,
                                    width: 77,
                                    height: 27,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Station Wagon",style: TextStyle(color:wagon?Colors.red[300]:Colors.grey[600]),),
                                )
                              ],
                            ),
                          ),

                          InkWell(
                            onTap: (){
                              setState(() {
                                        csedan=!csedan;
                              });
                            },
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset("images/sedan_car_model.png",
                                    color: csedan?Colors.red[600]:Colors.grey[600],
                                    fit: BoxFit.fill,
                                    width: 77,
                                    height: 27,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Compact Sedan",style:
                                  TextStyle(color:csedan?Colors.red[300]:Colors.grey[600]),),
                                )
                              ],
                            ),
                          )

                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  )

                ],
              ),


              //Color Expansion tile
              ExpansionTile(
                title:Text("Color",style: TextStyle(color: Colors.grey[600]),),
                initiallyExpanded: false,
                trailing:isExpanded7?Icon(Icons.keyboard_arrow_up_outlined,
                    color:Colors.grey[600]):Icon(Icons.keyboard_arrow_down_outlined,
                    color: Colors.grey[600]),
                backgroundColor: Colors.grey[100],
                onExpansionChanged: (bool expanding) => setState(() =>
                this.isExpanded7 = expanding),
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
                                    activeColor: Colors.red,
                                    onChanged: (value){
                                      setState(() {
                                        color1=value;
                                      });},
                                    value:color1,
                                  ),
                                  Text("Red")
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    activeColor: Colors.red,
                                    onChanged: (value){
                                      setState(() {
                                        color2=value;
                                      });},
                                    value:color2,
                                  ),
                                  Text("Blue")
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    activeColor: Colors.red,
                                    onChanged: (value){
                                      setState(() {
                                        color3=value;
                                      });},
                                    value:color3,
                                  ),
                                  Text("Green")
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
                                    activeColor: Colors.red,
                                    onChanged: (value){
                                      setState(() {
                                        color4=value;
                                      });},
                                    value:color4,
                                  ),
                                  Text("White")
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    activeColor: Colors.red,
                                    onChanged: (value){
                                      setState(() {
                                        color5=value;
                                      });},
                                    value:color5,
                                  ),
                                  Text("Silver")
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    activeColor: Colors.red,
                                    onChanged: (value){
                                      setState(() {
                                        color6=value;
                                      });},
                                    value:color6,
                                  ),
                                  Text("Yellow")
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
            ],
          ),
        ),
      ),
      bottomNavigationBar:  Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 10),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.red,
            ),
            width: 100,
            height: 50,
            child: Center(
              child: Text("Show ${456} Cars",
                style: TextStyle(
                    color: Colors.white,fontWeight: FontWeight.bold
                ),),
            ),
          ),
        ),
      ),
    );
  }
}

