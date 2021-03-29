class AutoServices
{
  String img,name;
  AutoServices({this.img,this.name});

  List<AutoServices> getAutoServices()
  {
    List<AutoServices> as=[
      AutoServices(img: "images/new_car.png",name: "Car and Bike Cleaning"),
      AutoServices(img: "images/new_car.png",name: "Car denting"),
      AutoServices(img: "images/new_car.png",name: "Book Driver"),
      AutoServices(img: "images/new_car.png",name: "Car and Bike Cleaning"),
      AutoServices(img: "images/new_car.png",name: "Car denting"),
      AutoServices(img: "images/new_car.png",name: "Book Driver"),
    ];
    return as;
  }
}

