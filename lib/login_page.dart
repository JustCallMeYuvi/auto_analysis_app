import 'package:auto_analytics_app/app_colors.dart';
import 'package:auto_analytics_app/login_details_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Image.asset('assets/images/Smart Car Logo.png'),
          ),
          SizedBox(height: height * 0.15),
          Center(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginDetails()),
                  );
                },
                borderRadius: BorderRadius.circular(16.0),
                child: Ink(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 70.0, vertical: 15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: AppColors.mainBlueColor,
                  ),
                  child: Text(
                    'LOGIN',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: height * 0.05),
          Align(
            alignment: Alignment.center,
            child: Text.rich(
              TextSpan(children: [
                TextSpan(
                    text: 'No accounts?',
                    style:
                        TextStyle(color: AppColors.whiteColor, fontSize: 15)),
                TextSpan(
                    text: 'Sign Up',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: AppColors.whiteColor,
                        fontSize: 15)),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
