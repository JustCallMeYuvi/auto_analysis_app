import 'package:auto_analytics_app/active_inventory_feed.dart';
import 'package:auto_analytics_app/app_colors.dart';
import 'package:flutter/material.dart';

class LoginDetails extends StatefulWidget {
  const LoginDetails({super.key});

  @override
  State<LoginDetails> createState() => _LoginDetailsState();
}

class _LoginDetailsState extends State<LoginDetails> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      backgroundColor: AppColors.backColor,
      body: SizedBox(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 150.0),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0, right: 25),
                  child: Container(
                    height: 50.0,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: AppColors.whiteColor,
                    ),
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 10),
                        hintText: 'Email',
                      ),
                      validator: (value) {
                        // if (value!.isEmpty ||
                        //     !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                        //         .hasMatch(value)) {
                        //   return 'Enter Correct Email Id';
                        // } else {
                        //   return null;
                        // }
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0, right: 25),
                  child: Container(
                    height: 50.0,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: AppColors.whiteColor,
                    ),
                    child: TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 10),
                        hintText: 'Password',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.10,
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      if (emailController.text.isEmpty) return;
                      if (passwordController.text.isEmpty) return;
                      // if (formKey.currentState!.validate()) {
                      //   final snackBar =
                      //       SnackBar(content: Text('Submitting Form'));
                      // }

                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ActiveInventoryFeed()),
                        );
                      }
                    },
                    borderRadius: BorderRadius.circular(16.0),
                    child: Ink(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 70.0, vertical: 15.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: AppColors.mainBlueColor,
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.05),
                const Align(
                  alignment: Alignment.center,
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                          text: 'By continuing, you to accept our ',
                          style: TextStyle(
                              color: AppColors.whiteColor, fontSize: 12)),
                      TextSpan(
                          text: 'Terms of Service',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: AppColors.whiteColor,
                              fontSize: 12)),
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Image.asset('assets/images/Smart Car Logo.png'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
