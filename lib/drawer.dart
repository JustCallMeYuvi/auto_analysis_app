import 'package:auto_analytics_app/app_colors.dart';

import 'package:auto_analytics_app/model/car_information_model.dart';
import 'package:auto_analytics_app/prediction_model_overview.dart';
import 'package:auto_analytics_app/twenty_one_days_vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:hive/hive.dart';

class DrawerScreen extends StatefulWidget {
  DrawerScreen({super.key, this.model});

  CarInformationModel? model;

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  var getResult = 'QR Code Result';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.backColor,
        width: double.infinity,
        padding: const EdgeInsets.only(top: 40),
        child: Column(children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                    image: AssetImage('assets/images/Smart Car Logo.png'))),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 200),
            child: Text(
              'Hello',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 100),
            child: Text(
              'Filter Vehicles By Age',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(right: 60),
            child: GestureDetector(
              child: Text(
                '21 Day Vehicles',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    decoration: TextDecoration.underline),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          TwentyOneDaysVehicle(model: widget.model,age: 21,)),
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
           Padding(
            padding: EdgeInsets.only(right: 60),
            child: InkWell(

              child: Text(
                '40 Day Vehicles',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  fontSize: 14,
                ),
              ),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          TwentyOneDaysVehicle(model: widget.model,age: 40,)),
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
           Padding(
            padding: EdgeInsets.only(right: 60),
            child: InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          TwentyOneDaysVehicle(model: widget.model,age: 60,)),
                );
              },
              child: Text(
                '60 Day Vehicles',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
           Padding(
            padding: EdgeInsets.only(right: 75),
            child: InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) =>
                    TwentyOneDaysVehicle(model: widget.model,age: 100,)));
              },
              child: Text(
                '100+ Day Vehicles',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
           Padding(
            padding: EdgeInsets.only(right: 30),
            child: InkWell(
              onTap: (){
             {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  PredictionModelOverView(model: widget.model,)),
                  );
                }

              },

              child: Text(
                'Go to Prediction Model Overview',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 30),
            child: Text(
              'Today’s Vehicles Needing Action ',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(right: 150),
            child: GestureDetector(
              child: Text(
                'VIN Scanner',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              onTap: () {
                scanQRCode();
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(right: 180),
            child: GestureDetector(
              child: Text(
                'Log Out',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              onTap: () {
                var box = Hive.box('authenticationBox');
                box.clear();

                // Navigator.pushAndRemoveUntil(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const LoginScreen()),
                //     (route) => false);
              },
            ),
          ),
        ]),
      ),
    );
  }

  void scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      if (!mounted) return;

      setState(() {
        getResult = qrCode;
      });
      print("QRCode_Result:--");
      print(qrCode);
    } on PlatformException {
      getResult = 'Failed to scan QR Code.';
    }
  }
}
