import 'package:auto_analytics_app/model/car.dart';
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
          border: Border.all(color: Color(0xff00000040), width: 1)),
      height: 135,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      padding: const EdgeInsets.all(10),
      child: Row(children: [
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
              car.calc ?? '',
              style: const TextStyle(fontSize: 12),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  car.price ?? '',
                  style: const TextStyle(fontSize: 12),
                ),
                Text(
                  car.cost ?? '',
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        )
      ]),
    );
  }
}
