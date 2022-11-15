import 'dart:convert';
import 'dart:developer';

import '../model/car.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  // Future<List<CarModel>?> getCars() async {
  //   var client = http.Client();
  //   var uri = Uri.parse('https://powerbi.approcket.in/api/v1/report');
  //   var response = await client.get(uri);
  //   if (response.statusCode == 200) {
  //     log("My API response ${response.statusCode}");
  //     Map<String, dynamic> decoded = jsonDecode(response.body);
  //     List<dynamic> data = decoded['data']['vehicle'];
  //     log(data.length.toString());
  //     log(data.runtimeType.toString());
  //   }
  //   return null;
  // }
}
