import 'dart:convert';

NewCarModel newCarModelFromJson(String str) => NewCarModel.fromJson(json.decode(str));

String newCarModelToJson(NewCarModel data) => json.encode(data.toJson());

class NewCarModel {
  NewCarModel({
    this.methodname,
    this.brands,
    this.code,
    this.codemessage,
    this.codedescription,
  });

  String methodname;
  List<Brand> brands;
  int code;
  String codemessage;
  String codedescription;

  factory NewCarModel.fromJson(Map<String, dynamic> json) => NewCarModel(
    methodname: json["METHODNAME"],
    brands: List<Brand>.from(json["brands"].map((x) => Brand.fromJson(x))),
    code: json["CODE"],
    codemessage: json["CODEMESSAGE"],
    codedescription: json["CODEDESCRIPTION"],
  );

  Map<String, dynamic> toJson() => {
    "METHODNAME": methodname,
    "brands": List<dynamic>.from(brands.map((x) => x.toJson())),
    "CODE": code,
    "CODEMESSAGE": codemessage,
    "CODEDESCRIPTION": codedescription,
  };
}

class Brand {
  Brand({
    this.id,
    this.carBrandName,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
  });

  int id;
  String carBrandName;
  String image;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  int createdBy;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
    id: json["id"],
    carBrandName: json["car_brand_name"],
    image: json["image"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    createdBy: json["created_by"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "car_brand_name": carBrandName,
    "image": image,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "created_by": createdBy,
  };
}
