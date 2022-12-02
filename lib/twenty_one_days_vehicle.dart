import 'package:auto_analytics_app/model/car_information_model.dart';
import 'package:auto_analytics_app/widgets/car_information_card.dart';
import 'package:flutter/material.dart';



class TwentyOneDaysVehicle extends StatefulWidget {
  TwentyOneDaysVehicle({Key? key, this.model, this.age}) : super(key: key);

  CarInformationModel? model;
  int? age;

  @override
  State<TwentyOneDaysVehicle> createState() => _TwentyOneDaysVehicleState();
}

class _TwentyOneDaysVehicleState extends State<TwentyOneDaysVehicle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Colors.black.withOpacity(.5)))),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (_) => DrawerScreen()));
                            },
                            child: Container(
                              height: 225,
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.only(left: 10, top: 10),
                              child: const Icon(Icons.arrow_back),
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
                                            "${filterModels.length}",
                                            style: TextStyle(
                                                color: Color(0xFF313131),
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            'Vehicles Analysed',
                                            style: TextStyle(
                                                color: Color(0xFF313131),
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '21.00',
                                            style: TextStyle(
                                                color: Color(0xFF313131),
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            'Average Age',
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
                                            borderRadius:
                                                BorderRadius.horizontal(),
                                            borderSide:
                                                BorderSide(color: Colors.red)),
                                        hintText: 'Seach',
                                        isDense: true,
                                        suffixIcon: Icon(Icons.search)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ]),
                        if (filterModels.isEmpty)
                          Text("No Vehicle Found at this Age ${widget.age}")
                        else
                          ...filterModels.map((e) => CarInformation(car: e)),
                      ]),
                ))));
  }

  List<Vehicle> filterModels = [];

  @override
  void initState() {
    int a = widget.age ?? 0;

    if(a >= 100)
      {
        filterModels = widget.model!.data!.vehicle!
            .where((element) => element!.age! > 100)
            .toList();
      }else
        {
          filterModels = widget.model!.data!.vehicle!
              .where((element) => element.age == widget.age)
              .toList();
        }

  }
}
