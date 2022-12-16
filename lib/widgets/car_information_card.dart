
import 'package:auto_analytics_app/app_colors.dart';
import 'package:flutter/material.dart';

import '../model/car_information_model.dart';

class CarInformation extends StatelessWidget {
  CarInformation({super.key, required this.car});

  Vehicle car;
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
        Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  car.vin ?? '',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  car.vehicle ?? '',
                  style: const TextStyle(fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  car.stock ?? '',
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "Liklihood to sell w/in 30 Days: ${car.calc}",
                  style: const TextStyle(fontSize: 12),overflow: TextOverflow.clip,maxLines: 1,
                ),
                Text(
                  "Price: \$${car.calc} Cost: ${car.cost}",
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
        ),
        
      ]),
    );
  }
}
