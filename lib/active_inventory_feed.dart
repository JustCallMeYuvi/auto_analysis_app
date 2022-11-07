import 'dart:convert';

import 'package:auto_analytics_app/app_colors.dart';
import 'package:auto_analytics_app/model/all_cars.dart';
import 'package:auto_analytics_app/my_drawer_header.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ActiveInventoryFeed extends StatefulWidget {
  const ActiveInventoryFeed({super.key});

  @override
  State<ActiveInventoryFeed> createState() => _ActiveInventoryFeedState();
}

class _ActiveInventoryFeedState extends State<ActiveInventoryFeed> {
  List<dynamic> users = [];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            final name = user['name']['first'];
            final price = user['email'];
            final imageUrl = user['picture']['thumbnail'];
            return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              color: Color(0xffFFFFFF),
              child: ListTile(
                leading: ClipRRect(
                    borderRadius: BorderRadius.horizontal(),
                    child: Image.network(imageUrl)),
                title: Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(price),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_a_photo_sharp),
        onPressed: fetchUsers,
      ),
      drawer: Drawer(
          child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              const MyHeaderDrawer(),
              //MyDrawerList(),
            ],
          ),
        ),
      )),
    );
  }

  void fetchUsers() async {
    print('fetch user called');
    const url = 'https://randomuser.me/api/?results=20';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);

    setState(() {
      users = json['results'];
    });
    print('Button is worked');
  }

  // Widget cards() {
  //   return Card(
  //     elevation: 3,
  //     margin: EdgeInsets.symmetric(vertical: 7),
  //     child: ListTile(
  //       leading: Image.network(
  //           'https://www.lamborghini.com/sites/it-en/files/DAM/lamborghini/facelift_2019/homepage/families-gallery/2022/04_12/family_chooser_tecnica_m.png'),
  //       title: Text('The car is awesome'),
  //     ),
  //   );
  // }

  // Widget MyDrawerList() {
  //   return Container(
  //     padding: EdgeInsets.all(15),
  //     child: Column(children: [
  //       home(),
  //     ]),
  //   );
  // }

  // Widget home() {
  //   return ListTile(
  //     title: Text(
  //       'Hello',
  //       style: TextStyle(color: Colors.white),
  //     ),
  //   );
  // }
}
