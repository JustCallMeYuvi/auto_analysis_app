import 'package:auto_analytics_app/app_colors.dart';
import 'package:auto_analytics_app/login_page.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetoHome();
  }

  _navigatetoHome() async {
    await Future.delayed(const Duration(seconds: 5), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
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
