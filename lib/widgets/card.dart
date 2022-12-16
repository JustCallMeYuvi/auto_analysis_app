
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
                  Text(
                    widget.car.vin??'',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                     'Hi',
                    style: const TextStyle(fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                     'Hi',
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Liklihood to sell w/in 30 Days: ",
                    style: const TextStyle(fontSize: 12),overflow: TextOverflow.clip,maxLines: 1,
                  ),
                  Text(
                    "Price: Cost: ",
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),

          ]),
    );

  }
}
