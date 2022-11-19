// To parse this JSON data, do
//
//     final carInformationModel = carInformationModelFromJson(jsonString);

import 'dart:convert';

CarInformationModel carInformationModelFromJson(String str) =>
    CarInformationModel.fromJson(json.decode(str));

String carInformationModelToJson(CarInformationModel data) =>
    json.encode(data.toJson());

class CarInformationModel {
  CarInformationModel({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  String? status;
  int? code;
  dynamic message;
  Data? data;

  factory CarInformationModel.fromJson(Map<String, dynamic> json) =>
      CarInformationModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.vehicle,
    this.averageOnlineAge,
    this.totalVehicleOnline,
    this.averageOwnedAge,
    this.totalVehicleinventory,
  });

  List<Vehicle>? vehicle;
  String? averageOnlineAge;
  int? totalVehicleOnline;
  String? averageOwnedAge;
  int? totalVehicleinventory;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        vehicle:
            List<Vehicle>.from(json["vehicle"].map((x) => Vehicle.fromJson(x))),
        averageOnlineAge: json["averageOnlineAge"],
        totalVehicleOnline: json["totalVehicleOnline"],
        averageOwnedAge: json["averageOwnedAge"],
        totalVehicleinventory: json["totalVehicleinventory"],
      );

  Map<String, dynamic> toJson() => {
        "vehicle": List<dynamic>.from(vehicle!.map((x) => x.toJson())),
        "averageOnlineAge": averageOnlineAge,
        "totalVehicleOnline": totalVehicleOnline,
        "averageOwnedAge": averageOwnedAge,
        "totalVehicleinventory": totalVehicleinventory,
      };
}

class Vehicle {
  Vehicle({
    this.stock,
    this.vin,
    this.vehicle,
    this.views,
    this.saves,
    this.age,
    this.leads,
    this.calc,
    this.price,
    this.cost,
    this.id,
    this.count,
  });

  String? stock;
  String? vin;
  String? vehicle;
  int? views;
  int? saves;
  int? age;
  int? leads;
  String? calc;
  String? price;
  String? cost;
  int? id;
  int? count;

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        stock: json["stock"],
        vin: json["vin"],
        vehicle: json["vehicle"],
        views: json["views"],
        saves: json["saves"],
        age: json["age"],
        leads: json["leads"],
        calc: json["calc"],
        price: json["price"],
        cost: json["cost"],
        id: json["id"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "stock": stock,
        "vin": vin,
        "vehicle": vehicle,
        "views": views,
        "saves": saves,
        "age": age,
        "leads": leads,
        "calc": calc,
        "price": price,
        "cost": cost,
        "id": id,
        "count": count,
      };
}
