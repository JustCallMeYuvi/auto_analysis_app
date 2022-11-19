import 'dart:convert';
import 'dart:developer';

import 'package:auto_analytics_app/app_colors.dart';

import 'package:auto_analytics_app/my_drawer_header.dart';
import 'package:auto_analytics_app/widgets/car_information_card.dart';
import 'package:auto_analytics_app/widgets/header.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'model/car.dart';
import 'model/car_information_model.dart';

class ActiveInventoryFeed extends StatefulWidget {
  const ActiveInventoryFeed({super.key});

  @override
  State<ActiveInventoryFeed> createState() => _ActiveInventoryFeedState();
}

class _ActiveInventoryFeedState extends State<ActiveInventoryFeed> {
  //List<dynamic> users = [];
  List<Vehicle> vehicle = [];
  var isLoading = false;

  CarInformationModel? model;
  @override
  void initState() {
    super.initState();
    //fetch data from api
    getCars();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : SafeArea(
                child: Column(
                  children: [
                    HeaderHomePage(
                      model: model,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          Vehicle car = vehicle.elementAt(index);
                          return CarInformation(car: car);
                        },
                        // 40 list items
                        itemCount: vehicle.length,
                      ),
                    ),
                  ],
                ),
              ));
  }

  void getCars() async {
    setState(() {
      isLoading = true;
    });

    //try {
    //   var client = http.Client();
    //   var uri = Uri.parse('https://powerbi.approcket.in/api/v1/report');
    //   var response = await client.get(uri);
    //   if (response.statusCode == 200) {
    //     log("My API response ${response.statusCode}");
    //     Map<String, dynamic> decoded = jsonDecode(response.body);
    //     var carModel = CarModel.fromJson(decoded);

    //     vehicle = carModel.data?.vehicle ?? [];
    //   }
    // } catch (e) {
    //   print("the api error is ${e.toString()}");
    // }
    var rawModel =
        await http.get(Uri.parse('https://powerbi.approcket.in/api/v1/report'));

    model = carInformationModelFromJson(rawModel.body);
    vehicle = model!.data?.vehicle ?? [];

    setState(() {
      isLoading = false;
    });
  }
}
