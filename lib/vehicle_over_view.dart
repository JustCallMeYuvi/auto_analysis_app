import 'package:auto_analytics_app/app_colors.dart';
import 'package:auto_analytics_app/model/car_information_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class VehicleOverView extends StatefulWidget {
   VehicleOverView({Key? key,required this.car}) : super(key: key);
   Vehicle car;
  @override
  State<VehicleOverView> createState() => _VehicleOverViewState();
}
class _VehicleOverViewState extends State<VehicleOverView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 260,
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black.withOpacity(.5)))),
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
                                 Text(widget!.car.price.toString(),style: TextStyle(
                                    color: Color(0xFF000000),
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),),
                                const Text('Vehicle Price',
                                  style: TextStyle(
                                      fontSize: 12,fontWeight: FontWeight.bold,color: Color(0xff000000)),),
                                 Text(widget!.car.count.toString(),style: TextStyle(
                                    color: Color(0xFF000000),
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),),
                                const Text('Vehicle Cost',
                                  style: TextStyle(
                                      fontSize: 12,fontWeight: FontWeight.bold,color: Color(0xff000000)),),
                                Container(
                                  height: 99,
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
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(children: [
                    SizedBox(height: 30,),
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
                         Text('Predicted to Sell at:',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                        const SizedBox(height: 03,),
                        Container(
                          //padding: EdgeInsets.only(right: 20),
                          height: 37,
                          width: 188,
                          decoration: BoxDecoration(
                             borderRadius: BorderRadius.only(
                               topLeft: Radius.circular(15),
                               topRight: Radius.circular(15),
                               bottomLeft: Radius.circular(15),
                               bottomRight: Radius.circular(15),
                             ),color: Color.fromRGBO(253, 217, 185, 0.86),
                            border: Border.all(color: Color(0xff707070)),
                          ),
                          child: Center(child: Text('52.17 Days Online',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                        ),
                      ],
                    )
                  ],)
                ],
              ),
            ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:  Container(
              color: Color(0xffF7F7F7),
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 11,),
                    Container(

                      decoration: BoxDecoration(
                          color: const Color(0xffFFFFFF),
                          border: Border.all(color:AppColors.border, width: 3.0)),
                      child: Row(
                        children: [
                          Container(
                            width: 90,
                            height: 90,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                "https://image.shutterstock.com/image-illustration/modern-cars-studio-room-3d-260nw-735402217.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),

                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                widget.car.vin ?? '',
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                widget.car.vehicle ?? '',
                                style: const TextStyle(fontSize: 14),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                widget.car.stock ?? '',
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Liklihood to sell w/in 30 Days: ${widget.car.calc}",
                                  style: const TextStyle(fontSize: 12),overflow: TextOverflow.clip,maxLines: 1,
                                ),
                              ),
                              Text(
                                "Price: \$${widget.car.calc} Cost: ${widget.car.cost}",
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 08,),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Active Leads: ${widget.car.leads}",
                                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xff6E6E6E)),),
                            Text("Owned Age: ${widget.car.leads} Days",
                              style: TextStyle(fontSize: 20,color: Color(0xff6E6E6E)),),
                            Text("Online Age: ${widget.car.age} Days",
                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xff6E6E6E)),),
                          ],
                        ),
                    SizedBox(height: 68,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("3% Price Change: ${widget.car.price}",
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xff6E6E6E)),),
                        Text("Price at 3% Change: ${widget.car.cost}",
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xff6E6E6E)),),
                      ],
                    ),
                    SizedBox(height: 27,),
                    Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: Text("Price Change History: ${widget.car.cost}",
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xff6E6E6E)),),
                    ),


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
                    SizedBox(height: 300,
                      child:
                          SfCartesianChart(
                              enableAxisAnimation: true
                          ),



                      // SfCartesianChart(
                      //     enableAxisAnimation: true
                      // ),
                      // SfCartesianChart(),

                    ),

                  ],

                ),
              ),
          ),
        ),


          ],

        ),
      ),

    );
  }
}
