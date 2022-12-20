
import 'package:auto_analytics_app/app_colors.dart';
import 'package:auto_analytics_app/model/car_information_model.dart';
import 'package:flutter/material.dart';

class CardDetails extends StatefulWidget {
   CardDetails({Key? key,required this.car}) : super(key: key);

   Vehicle car;
  @override
  State<CardDetails> createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xffFFFFFF),
          border: Border.all(color:AppColors.border, width: 3.0)),
      height: 135,
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10),
      child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.car.vehicle??'',
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      //SizedBox(width: 25,),
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Text(
                            "Stock: ${widget.car.stock}",
                          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                    ],
                  ),
                  Text(
                     "VIN: ${widget.car.vin}",
                    style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                               'Vehicle Online 4 Days',
                              style:  TextStyle(fontSize: 12,color: Color(0xff0000003),fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Vehicle Predicted to Sell at Day ${widget.car.age} ",
                              style: const TextStyle(fontSize: 12,),overflow: TextOverflow.clip,maxLines: 1,
                            ),

                          ],
                        ),
                      ),
                      SizedBox(width: 10,),
                      Column(

                        children: [

                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Image.asset('assets/images/yes.png',width: 30,height: 30,),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Image.asset('assets/images/circle.png',width: 30,height: 30,),
                          ),

                        ],
                      )
                    ],
                  ),


                ],
              ),
            ),

          ]),
    );

  }
}
