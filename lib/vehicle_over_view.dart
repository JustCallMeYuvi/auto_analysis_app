import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class VehicleOverView extends StatefulWidget {
  const VehicleOverView({Key? key}) : super(key: key);

  @override
  State<VehicleOverView> createState() => _VehicleOverViewState();
}

class _VehicleOverViewState extends State<VehicleOverView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black.withOpacity(.5)))),

                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 225,
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: const Icon(Icons.arrow_back),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 280,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Container(
                                child: Column(children: [
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  const Text('\$20,997',style: TextStyle(
                                      color: Color(0xFF000000),
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),),
                                  const Text('Vehicle Price',
                                    style: TextStyle(
                                        fontSize: 12,fontWeight: FontWeight.bold,color: Color(0xff000000)),),
                                  const Text('\$18,682',style: TextStyle(
                                      color: Color(0xFF000000),
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),),
                                  const Text('Vehicle Cost',
                                    style: TextStyle(
                                        fontSize: 12,fontWeight: FontWeight.bold,color: Color(0xff000000)),),
                                   SizedBox(height: 10,),

                                  Container(
                                    height: 70,
                                    width: 131,
                                    alignment: Alignment.center,
                                    child: Image.network(
                                      "https://image.shutterstock.com/image-illustration/modern-cars-studio-room-3d-260nw-735402217.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],),
                              ),

                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(children: [
                      Column(

                        children: [

                          const Text('Performance Grade:',style: TextStyle(fontSize: 12,color:Color(0xff6E6e6E),fontWeight: FontWeight.bold ),),
                          const SizedBox(height: 9,),
                          Container(
                            height: 100,
                            width: 100,
                            child: const Center(child: Text('C+',style: TextStyle(fontSize: 40,color: Color(0xffF7BE00),fontWeight: FontWeight.bold),)),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: const Color(0xff707070),width: 5),
                                color: const Color(0xffE3E3E3)
                            ),
                          ),
                          const SizedBox(height: 05,),

                          const Text('Predicted to Sell at:'),
                          const SizedBox(height: 03,),
                          Container(
                            //padding: EdgeInsets.only(right: 20),
                            height: 37,
                            width: 188,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                border: Border.all(color: const Color(0xff707070),width: 2)
                            ),

                          )


                        ],
                      )
                    ],)
                  ],
                ),
              ),

              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Container(

                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                              child: Container(child: Text("Change Date"),)),
                          Expanded(child: Container(child: Text("Name"),)),
                          Expanded(child: Container(child: Text("Stock"),)),
                          Expanded(child: Container(child: Text("Vin"),)),
                          Expanded(child: Container(child: Text("Price"),)),
                        ],
                      ),
                      color: Colors.white,
                    ),
                    Container(
                      height: 2,
                      color: Colors.blue,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                              child: Container(child: Text("12/12/2012",style: TextStyle(fontSize: 10),),)),
                          Expanded(child: Container(child: Text("2022 ford",style: TextStyle(fontSize: 10)),)),
                          Expanded(child: Container(child: Text("cc345433",style: TextStyle(fontSize: 10)),)),
                          Expanded(child: Container(child: Text("12312424",style: TextStyle(fontSize: 10)),)),
                          Expanded(child: Container(child: Text("\$123123",style: TextStyle(fontSize: 10)),)),
                        ],
                      ),
                      color: Colors.white,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),

                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                              child: Container(child: Text("12/12/2012",style: TextStyle(fontSize: 10),),)),
                          Expanded(child: Container(child: Text("2022 ford",style: TextStyle(fontSize: 10)),)),
                          Expanded(child: Container(child: Text("cc345433",style: TextStyle(fontSize: 10)),)),
                          Expanded(child: Container(child: Text("12312424",style: TextStyle(fontSize: 10)),)),
                          Expanded(child: Container(child: Text("\$123123",style: TextStyle(fontSize: 10)),)),
                        ],
                      ),
                      color: Colors.black12,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),

                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                              child: Container(child: Text("12/12/2012",style: TextStyle(fontSize: 10),),)),
                          Expanded(child: Container(child: Text("2022 ford",style: TextStyle(fontSize: 10)),)),
                          Expanded(child: Container(child: Text("cc345433",style: TextStyle(fontSize: 10)),)),
                          Expanded(child: Container(child: Text("12312424",style: TextStyle(fontSize: 10)),)),
                          Expanded(child: Container(child: Text("\$123123",style: TextStyle(fontSize: 10)),)),
                        ],
                      ),
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              SfCartesianChart(
                  enableAxisAnimation: true
              ),
              SfCartesianChart(),

            ],

          ),
        ),
      ),
    )
    );
  }
}
