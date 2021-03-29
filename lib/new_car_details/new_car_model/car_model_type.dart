import 'dart:convert';

CarModelTypes carModelTypesFromJson(String str) => CarModelTypes.fromJson(json.decode(str));

String carModelTypesToJson(CarModelTypes data) => json.encode(data.toJson());

class CarModelTypes {
  CarModelTypes({
    this.methodname,
    this.carModels,
    this.brandName,
    this.code,
    this.codemessage,
    this.codedescription,
  });

  String methodname;
  List<CarModel> carModels;
  String brandName;
  int code;
  String codemessage;
  String codedescription;

  factory CarModelTypes.fromJson(Map<String, dynamic> json) => CarModelTypes(
    methodname: json["METHODNAME"],
    carModels: List<CarModel>.from(json["car_models"].map((x) => CarModel.fromJson(x))),
    brandName: json["brandName"],
    code: json["CODE"],
    codemessage: json["CODEMESSAGE"],
    codedescription: json["CODEDESCRIPTION"],
  );

  Map<String, dynamic> toJson() => {
    "METHODNAME": methodname,
    "car_models": List<dynamic>.from(carModels.map((x) => x.toJson())),
    "brandName": brandName,
    "CODE": code,
    "CODEMESSAGE": codemessage,
    "CODEDESCRIPTION": codedescription,
  };
}

class CarModel {
  CarModel({
    this.id,
    this.brandId,
    this.carModelName,
    this.bodyType,
    this.fuelType,
    this.transmission,
    this.stars,
    this.titleImage,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.carBrandName,
    this.fuel,
  });

  int id;
  int brandId;
  String carModelName;
  String bodyType;
  String fuelType;
  String transmission;
  double stars;
  String titleImage;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  int createdBy;
  String carBrandName;
  String fuel;

  factory CarModel.fromJson(Map<String, dynamic> json) => CarModel(
    id: json["id"],
    brandId: json["brand_id"],
    carModelName: json["car_model_name"],
    bodyType: json["body_type"],
    fuelType: json["fuel_type"],
    transmission: json["Transmission"],
    stars: json["stars"].toDouble(),
    titleImage: json["title_image"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    createdBy: json["created_by"],
    carBrandName: json["car_brand_name"],
    fuel: json["fuel"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "brand_id": brandId,
    "car_model_name": carModelName,
    "body_type": bodyType,
    "fuel_type": fuelType,
    "Transmission": transmission,
    "stars": stars,
    "title_image": titleImage,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "created_by": createdBy,
    "car_brand_name": carBrandName,
    "fuel": fuel,
  };
}
