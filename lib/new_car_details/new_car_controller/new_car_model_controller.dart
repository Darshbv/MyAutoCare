import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_autocare/new_car_details/new_car_model/car_model_type.dart';
import 'package:my_autocare/new_car_details/new_car_model/new_car_model.dart';

class NewCarController
{
  Future<NewCarModel> getCarModel() async
  {
    var response=await http.get("http://myautocare.in/admin/api/brands");
    if(response.statusCode==200)
      {
        return newCarModelFromJson(response.body);
      }
    else{
      throw Exception("Error");
    }
  }

  Future<CarModelTypes> getModelType(int carBrandId) async
  {
    CarModelTypes carModelTypes;
    var response=await http.get("http://myautocare.in/admin/api/car_models/$carBrandId");
    if(response.statusCode==200)
    {
      carModelTypes=carModelTypesFromJson((response.body));
      print("Checking the code: ${carModelTypes.code}");
      if(carModelTypes.code!=0)
        {
          return carModelTypesFromJson(response.body);
        }
      else{
        var jsonData = jsonDecode(response.body);
        jsonData.forEach((element){
          return CarModelTypes(code: element['CODE'],
          codedescription: element['CODEDESCRIPTION'],
          brandName: null,
          codemessage: element['CODEMESSAGE'],
          methodname: element['METHODNAME']);
        });
      }

    }
    else{
      throw Exception("Error");
    }
  }
}