import 'package:auto_analytics_app/splash.dart';
import 'package:flutter/material.dart';

import 'active_inventory_feed.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const ActiveInventoryFeed(),
    );
  }
}
