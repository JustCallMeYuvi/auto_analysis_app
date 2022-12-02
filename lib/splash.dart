import 'package:auto_analytics_app/active_inventory_feed.dart';
import 'package:auto_analytics_app/app_colors.dart';
import 'package:auto_analytics_app/login_page.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  var box = Hive.box('authenticationBox');


  @override
  void initState() {
    super.initState();
    _navigatetoHome();
  }

  _navigatetoHome() async {
    String ? token = box.get("token");

    if(token == null || token == "")
      {
        await Future.delayed(const Duration(seconds: 5), () {});
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));

      }
    else
      {
        Future.delayed(Duration.zero, () {
          Navigator.push(context, MaterialPageRoute(builder: (_)=>ActiveInventoryFeed()));
        });



      }

  }

  @override
  Widget build(BuildContext context) {
    // double heightVariable = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.backColor,
      body: Column(children: [
        Expanded(
          child: Center(child: Image.asset('assets/images/Smart Car Logo.png')),
        ),
      ]),
    );
  }
}
