// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  String? status;
  int? code;
  String? message;
  Data? data;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
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
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.token,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "token": token,
  };
}
