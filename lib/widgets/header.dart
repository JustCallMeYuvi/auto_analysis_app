import 'package:auto_analytics_app/drawer.dart';
import 'package:flutter/material.dart';

import '../model/car_information_model.dart';

class HeaderHomePage extends StatelessWidget {
  HeaderHomePage({this.model});

  CarInformationModel? model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10,top: 29),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Colors.black.withOpacity(0.5)))),
      // height: 225,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => DrawerScreen(model: model,)));
              },
              child: const Icon(Icons.menu),
            ),
            Container(
              color: Color(0xffFFFFFF),

              alignment: Alignment.topLeft,
              height: 280,
              padding: EdgeInsets.only(right: 20, ),
              child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 180,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(

                            children: [
                              // SizedBox(
                              //   height: 38,
                              // ),
                              Text(
                                model!.data!.totalVehicleOnline.toString(),overflow: TextOverflow.clip,
                                style: TextStyle(
                                    color: Color(0xFF313131),
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Vehicles Online',overflow: TextOverflow.clip,
                                style: TextStyle(
                                    color: Color(0xFF313131),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                model!.data!.totalVehicleinventory
                                    .toString(),overflow: TextOverflow.clip,
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
                          //SizedBox(width: 25,),
                          Column(children: [
                            Text(
                              model!.data!.averageOnlineAge.toString(),
                              style: TextStyle(
                                  color: Color(0xFF313131),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Average Online Age',overflow: TextOverflow.ellipsis,
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
                              'Average Owned Age',overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Color(0xFF313131),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],)
                        ],

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:34),
                      child: const Text(
                        'Stock',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:34),
                      child: Container(
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
                      ),
                    )
                  ]),
            )
          ]),
    );
  }
}
