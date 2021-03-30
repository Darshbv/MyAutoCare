import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:my_autocare/new_car_details/new_car_controller/new_car_model_controller.dart';
import 'package:my_autocare/new_car_details/new_car_model/new_car_model.dart';
import 'package:my_autocare/new_car_details/perticular_brand.dart';

class AllCarBrands extends StatefulWidget {
  @override
  _AllCarBrandsState createState() => _AllCarBrandsState();
}

class _AllCarBrandsState extends State<AllCarBrands> {
  bool selected=false;
  NewCarModel newCarModelList;
  bool isLoading1=true;

  getBrands() async
  {
    var newCarController=new NewCarController();
    newCarModelList=await newCarController.getCarModel();
    setState(() {
      isLoading1=false;
    });
  }

  @override
  void initState() {
    getBrands();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  isLoading1?Center(child: CircularProgressIndicator()):
      SingleChildScrollView(
        child: SafeArea(
          child:ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(icon:Icon(Icons.arrow_back),
                      onPressed: (){
                        Navigator.pop(context);
                      }),
                  SizedBox(
                    width: 5,
                  ),
                  Text("All Brands",style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      return  InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>
                              PerticularBrand(carBrandId:newCarModelList.brands[index].id,)));
                        },
                        child: Container(
                          height: 30,
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.network(newCarModelList.brands[index].image,
                                  width: 45,
                                  height: 45,
                                  fit: BoxFit.fill,),
                                Text(newCarModelList.brands[index].carBrandName,style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                ),
                                  maxLines: 2,
                                  textAlign: TextAlign.justify,)
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: newCarModelList.brands.length,
                  ),
                ),
              ),
              /*Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    overflow: Overflow.visible,
                    children: [
                      InkWell(
                          onTap: ()=> this.setState(() {
                            this.selected= !this.selected ;
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>PerticularBrand()));
                          }),
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(
                              width: 1,
                              color: selected?Colors.deepOrangeAccent:Colors.white
                            )
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
                                    fontSize: 12
                                ),)
                              ],
                            ),
                          ),
                        ),
                      ),
                      selected?Positioned(
                        right: -4,
                          top: -4,
                          child:CircularCheckBox(
                              value: this.selected,
                              checkColor: Colors.white  ,
                              activeColor: Colors.deepOrangeAccent,
                              onChanged: (val) => this.setState(() {
                                this.selected= !this.selected ;
                              }) )):Text(""),
                    ],
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
                              fontSize: 12
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
                              fontSize: 12
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
                            height: 35,),
                          Text(newCarModelList.brands[3].carBrandName,style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    overflow: Overflow.visible,
                    children: [
                      InkWell(
                        onTap: ()=> this.setState(() {
                          this.selected= !this.selected ;
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PerticularBrand()));
                        }),
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                  width: 1,
                                  color: selected?Colors.deepOrangeAccent:Colors.white
                              )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(newCarModelList.brands[5].image,
                                  width: 35,
                                  height: 35,),
                                Text(newCarModelList.brands[5].carBrandName,style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12
                                ),)
                              ],
                            ),
                          ),
                        ),
                      ),
                      selected?Positioned(
                          right: -4,
                          top: -4,
                          child:CircularCheckBox(
                              value: this.selected,
                              checkColor: Colors.white  ,
                              activeColor: Colors.deepOrangeAccent,
                              onChanged: (val) => this.setState(() {
                                this.selected= !this.selected ;
                              }) )):Text(""),
                    ],
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
                          Text(newCarModelList.brands[6].carBrandName,style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12
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
                          Image.network(newCarModelList.brands[7].image,
                            width: 35,
                            height: 35,),
                          Text(newCarModelList.brands[7].carBrandName,style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12
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
                          Image.network(newCarModelList.brands[8].image,
                            width: 35,
                            height: 35,),
                          Text(newCarModelList.brands[8].carBrandName,style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12
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
                          Image.network(newCarModelList.brands[9].image,
                            width: 35,
                            height: 35,),
                          Text(newCarModelList.brands[9].carBrandName,style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12
                          ),)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    overflow: Overflow.visible,
                    children: [
                      InkWell(
                        onTap: ()=> this.setState(() {
                          this.selected= !this.selected ;
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PerticularBrand()));
                        }),
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                  width: 1,
                                  color: selected?Colors.deepOrangeAccent:Colors.white
                              )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(newCarModelList.brands[10].image,
                                  width: 35,
                                  height: 35,),
                                Text(newCarModelList.brands[110].carBrandName,style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12
                                ),)
                              ],
                            ),
                          ),
                        ),
                      ),
                      selected?Positioned(
                          right: -4,
                          top: -4,
                          child:CircularCheckBox(
                              value: this.selected,
                              checkColor: Colors.white  ,
                              activeColor: Colors.deepOrangeAccent,
                              onChanged: (val) => this.setState(() {
                                this.selected= !this.selected ;
                              }) )):Text(""),
                    ],
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
                          Image.network(newCarModelList.brands[11].image,
                            width: 35,
                            height: 35,),
                          Text(newCarModelList.brands[11].carBrandName,style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12
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
                          Image.network(newCarModelList.brands[12].image,
                            width: 35,
                            height: 35,),
                          Text(newCarModelList.brands[12].carBrandName,style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12
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
                          Image.network(newCarModelList.brands[13].image,
                            width: 35,
                            height: 35,),
                          Text(newCarModelList.brands[13].carBrandName,style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12
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
                          Image.network(newCarModelList.brands[14].image,
                            width: 35,
                            height: 35,),
                          Text(newCarModelList.brands[14].carBrandName,style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12
                          ),)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    overflow: Overflow.visible,
                    children: [
                      InkWell(
                        onTap: ()=> this.setState(() {
                          this.selected= !this.selected ;
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PerticularBrand()));
                        }),
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                  width: 1,
                                  color: selected?Colors.deepOrangeAccent:Colors.white
                              )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(newCarModelList.brands[15].image,
                                  width: 35,
                                  height: 35,),
                                Text(newCarModelList.brands[15].carBrandName,style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12
                                ),)
                              ],
                            ),
                          ),
                        ),
                      ),
                      selected?Positioned(
                          right: -4,
                          top: -4,
                          child:CircularCheckBox(
                              value: this.selected,
                              checkColor: Colors.white  ,
                              activeColor: Colors.deepOrangeAccent,
                              onChanged: (val) => this.setState(() {
                                this.selected= !this.selected ;
                              }) )):Text(""),
                    ],
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
                          Image.network(newCarModelList.brands[16].image,
                            width: 35,
                            height: 35,),
                          Text(newCarModelList.brands[16].carBrandName,style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12
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
                          Image.network(newCarModelList.brands[17].image,
                            width: 35,
                            height: 35,),
                          Text(newCarModelList.brands[17].carBrandName,style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12
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
                          Image.network(newCarModelList.brands[18].image,
                            width: 35,
                            height: 35,),
                          Text(newCarModelList.brands[18].carBrandName,style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12
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
                          Image.network(newCarModelList.brands[19].image,
                            width: 35,
                            height: 35,),
                          Text(newCarModelList.brands[19].carBrandName,style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12
                          ),)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    overflow: Overflow.visible,
                    children: [
                      InkWell(
                        onTap: ()=> this.setState(() {
                          this.selected= !this.selected ;
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PerticularBrand()));
                        }),
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                  width: 1,
                                  color: selected?Colors.deepOrangeAccent:Colors.white
                              )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(newCarModelList.brands[20].image,
                                  width: 35,
                                  height: 35,),
                                Text(newCarModelList.brands[20].carBrandName,style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12
                                ),)
                              ],
                            ),
                          ),
                        ),
                      ),
                      selected?Positioned(
                          right: -4,
                          top: -4,
                          child:CircularCheckBox(
                              value: this.selected,
                              checkColor: Colors.white  ,
                              activeColor: Colors.deepOrangeAccent,
                              onChanged: (val) => this.setState(() {
                                this.selected= !this.selected ;
                              }) )):Text(""),
                    ],
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
                          Image.network(newCarModelList.brands[21].image,
                            width: 35,
                            height: 35,),
                          Text(newCarModelList.brands[21].carBrandName,style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12
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
                          Image.network(newCarModelList.brands[22].image,
                            width: 35,
                            height: 35,),
                          Text(newCarModelList.brands[22].carBrandName,style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12
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
                          Image.network(newCarModelList.brands[23].image,
                            width: 35,
                            height: 35,),
                          Text(newCarModelList.brands[23].carBrandName,style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12
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
                          Image.network(newCarModelList.brands[24].image,
                            width: 35,
                            height: 35,),
                          Text(newCarModelList.brands[24].carBrandName,style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12
                          ),)
                        ],
                      ),
                    ),
                  ),
                ],
              ),*/
            ],
          )
        ),
      ),
    );
  }
}
