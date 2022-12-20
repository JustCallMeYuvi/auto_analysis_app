
import 'package:auto_analytics_app/vehicle_over_view.dart';
import 'package:auto_analytics_app/widgets/car_information_card.dart';
import 'package:auto_analytics_app/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:auto_analytics_app/model/car_information_model.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';


import 'app_colors.dart';


class PredictionModelOverView extends StatefulWidget {
   PredictionModelOverView({Key? key,this.model,this.age}) : super(key: key);
  CarInformationModel? model;
  int? age;

  @override
  State<PredictionModelOverView> createState() => _PredictionModelOverViewState();
}

class _PredictionModelOverViewState extends State<PredictionModelOverView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xffF7F7F7),
        body: SafeArea(
          child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.black.withOpacity(.5)))),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
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
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: const Icon(Icons.arrow_back),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        height: 280,
                        padding: const EdgeInsets.only(right: 20, top: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 180,
                                  child: Column(

                                    children: [

                                      const SizedBox(
                                        height: 80,
                                      ),
                                      // Text(
                                      //   "${filterModels.length}",
                                      //   style: const TextStyle(
                                      //       color: Color(0xFF313131),
                                      //       fontSize: 30,
                                      //       fontWeight: FontWeight.bold),
                                      // ),
                                      // const Text(
                                      //   'Vehicles Analysed',
                                      //   style: const TextStyle(
                                      //       color: const Color(0xFF313131),
                                      //       fontSize: 15,
                                      //       fontWeight: FontWeight.bold),
                                      // ),
                                      Text(
                                        // "${widget.age.toString()}",
                                          ('156'),
                                        style: const TextStyle(
                                            color: const Color(0xFF313131),
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ),
                                       Text(
                                        'Vehicle TTS Predictions  ${widget.model!.data!.vehicle!.length}',
                                        style: TextStyle(
                                            color: Color(0xFF313131),
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                  Column(
                                        children:<Widget> [
                                          Text('Vehicle With Prediction Model :',style: TextStyle(fontSize: 12,color:Color(0xff6E6e6E),fontWeight: FontWeight.bold ),),
                                          SizedBox(height: 9,),
                                          SizedBox(
                                              width: 100,
                                              height: 100,
                                              child: SfRadialGauge(title: GaugeTitle(text: "23"),))
                                        ],
                                      ),
                                  ],
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
                            const SizedBox(
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
                          ],
                        ),
                      ),
                    ]),
                    Container(
                      color: AppColors.border,
                      height: 2,
                      width: double.infinity,
                    ),
                      Expanded(
                        child: Container(
                          color: const Color(0xffF7F7F7),
                          child: Scrollbar(
                            child: ListView.builder(
                              //itemCount: filterModels.length,
                              itemCount: widget.model!.data!.vehicle!.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  child: CardDetails(car: widget.model!.data!
                                      .vehicle![index]),
                                  onTap:     () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>VehicleOverView  (car: widget!.model!.data!.vehicle![index])),
                                    );
                                  },
                                );

                              },
                              shrinkWrap: true,
                              primary: false,
                            ),
                          ),
                        ),
                      )
                  ])),
        ));
  }

  // List<Vehicle> filterModels = [];
  //
  // @override
  // void initState() {
  //   int a = widget.age ?? 0;
  //
  //   if (a >= 100) {
  //     /*   filterModels = widget.model!.data!.vehicle!
  //           .where((element) => element!.age! > 100)
  //           .toList();*/
  //
  //     for (int i = 0; i < widget.model!.data!.vehicle!.length; i++) {
  //       if (100 > widget.model!.data!.vehicle![i].age!.toInt()) {
  //         filterModels.add(widget.model!.data!.vehicle![i]);
  //       }
  //     }
  //   } else {
  //     /*  filterModels = widget.model!.data!.vehicle!
  //             .where((element) => element.age == widget.age)
  //             .toList();
  //         */
  //
  //     for (int i = 0; i < widget.model!.data!.vehicle!.length; i++) {
  //       if (widget.age == widget.model!.data!.vehicle![i].age) {
  //         filterModels.add(widget.model!.data!.vehicle![i]);
  //       }
  //     }
    }


