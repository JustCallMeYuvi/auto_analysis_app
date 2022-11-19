// class CarModel {
//   String? status;
//   int? code;
//   String? message;
//   Data? data;

//   CarModel({
//     this.status,
//     this.code,
//     this.message,
//     this.data,
//   });

//   CarModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     code = json['code'];
//     message = json['message'];
//     data = json['data'] != null ? Data.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = status;
//     data['code'] = code;
//     data['message'] = message;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

// class Data {
//   List<Vehicle>? vehicle;
//   String? averageOnlineAge;
//   int? totalVehicleOnline;
//   String? averageOwnedAge;
//   int? totalVehicleinventory;

//   Data(
//       {this.vehicle,
//       this.averageOnlineAge,
//       this.totalVehicleOnline,
//       this.averageOwnedAge,
//       this.totalVehicleinventory});

//   Data.fromJson(Map<String, dynamic> json) {
//     if (json['vehicle'] != null) {
//       vehicle = <Vehicle>[];
//       json['vehicle'].forEach((v) {
//         vehicle!.add(Vehicle.fromJson(v));
//       });
//     }
//     averageOnlineAge = json['averageOnlineAge'];
//     totalVehicleOnline = json['totalVehicleOnline'];
//     averageOwnedAge = json['averageOwnedAge'];
//     totalVehicleinventory = json['totalVehicleinventory'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (vehicle != null) {
//       data['vehicle'] = vehicle!.map((v) => v.toJson()).toList();
//     }
//     data['averageOnlineAge'] = averageOnlineAge;
//     data['totalVehicleOnline'] = totalVehicleOnline;
//     data['averageOwnedAge'] = averageOwnedAge;
//     data['totalVehicleinventory'] = totalVehicleinventory;
//     return data;
//   }
// }

// class Vehicle {
//   String? stock;
//   String? vin;
//   String? vehicle;
//   int? views;
//   int? saves;
//   int? age;
//   int? leads;
//   String? calc;
//   String? price;
//   String? cost;
//   int? id;
//   int? count;

//   Vehicle(
//       {this.stock,
//       this.vin,
//       this.vehicle,
//       this.views,
//       this.saves,
//       this.age,
//       this.leads,
//       this.calc,
//       this.price,
//       this.cost,
//       this.id,
//       this.count});

//   Vehicle.fromJson(Map<String, dynamic> json) {
//     stock = json['stock'];
//     vin = json['vin'];
//     vehicle = json['vehicle'];
//     views = json['views'];
//     saves = json['saves'];
//     age = json['age'];
//     leads = json['leads'];
//     calc = json['calc'];
//     price = json['price'];
//     cost = json['cost'];
//     id = json['id'];
//     count = json['count'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['stock'] = stock;
//     data['vin'] = vin;
//     data['vehicle'] = vehicle;
//     data['views'] = views;
//     data['saves'] = saves;
//     data['age'] = age;
//     data['leads'] = leads;
//     data['calc'] = calc;
//     data['price'] = price;
//     data['cost'] = cost;
//     data['id'] = id;
//     data['count'] = count;
//     return data;
//   }
// }
