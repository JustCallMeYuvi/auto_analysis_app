import 'package:auto_analytics_app/drawer.dart';
import 'package:flutter/material.dart';

import '../model/car_information_model.dart';

class HeaderHomePage extends StatelessWidget {
  HeaderHomePage({this.model});

  CarInformationModel? model;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Colors.black.withOpacity(0.5)))),
      // height: 225,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => DrawerScreen(model: model,)));
                  },
                  child: Container(
                    height: 225,
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 10, top: 10),
                    child: const Icon(Icons.menu),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  height: 280,
                  padding: EdgeInsets.only(right: 20, top: 15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 180,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Text(
                                    model!.data!.totalVehicleOnline.toString(),
                                    style: TextStyle(
                                        color: Color(0xFF313131),
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Vehicles Online',
                                    style: TextStyle(
                                        color: Color(0xFF313131),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    model!.data!.totalVehicleinventory
                                        .toString(),
                                    style: TextStyle(
                                        color: Color(0xFF313131),
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Vehicles In Inventory',
                                    style: TextStyle(
                                        color: Color(0xFF313131),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 180,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 21,
                                  ),
                                  Text(
                                    model!.data!.averageOnlineAge.toString(),
                                    style: TextStyle(
                                        color: Color(0xFF313131),
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Average Online Age',
                                    style: TextStyle(
                                        color: Color(0xFF313131),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    model!.data!.averageOwnedAge.toString(),
                                    style: TextStyle(
                                        color: Color(0xFF313131),
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Average Owned Age',
                                    style: TextStyle(
                                        color: Color(0xFF313131),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          'Stock',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .6,
                          height: 45,
                          child: const TextField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white30,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.horizontal(),
                                    borderSide: BorderSide(color: Colors.red)),
                                hintText: 'Seach',
                                isDense: true,
                                suffixIcon: Icon(Icons.search)),
                          ),
                        )
                      ]),
                )
              ],
            ),
          ]),
    );
  }
}
