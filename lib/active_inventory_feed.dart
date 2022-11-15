import 'dart:convert';
import 'dart:developer';

import 'package:auto_analytics_app/app_colors.dart';

import 'package:auto_analytics_app/my_drawer_header.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'model/car.dart';

class ActiveInventoryFeed extends StatefulWidget {
  const ActiveInventoryFeed({super.key});

  @override
  State<ActiveInventoryFeed> createState() => _ActiveInventoryFeedState();
}

class _ActiveInventoryFeedState extends State<ActiveInventoryFeed> {
  //List<dynamic> users = [];
  List<Vehicle> vehicle = [];
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    //fetch data from api
    getCars();
  }

  // getData() async {
  //   final cars = await RemoteService().getCars();
  //   if (cars != null) {
  //     setState(() {
  //       isLoaded = true;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        toolbarHeight: 250,
        title: Column(children: [
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  '158',
                  style: TextStyle(
                      color: Color(0xFF313131),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 150),
                child: Text(
                  '32.91',
                  style: TextStyle(
                      color: Color(0xFF313131),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(),
                child: Text(
                  'Vehicles Online',
                  style: TextStyle(
                      color: Color(0xFF313131),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 70),
                child: Text(
                  'Average Online Age',
                  style: TextStyle(
                      color: Color(0xFF313131),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  '210',
                  style: TextStyle(
                      color: Color(0xFF313131),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 150),
                child: Text(
                  '45.26',
                  style: TextStyle(
                      color: Color(0xFF313131),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 0),
                child: Text(
                  'Vehicles In Inventory',
                  style: TextStyle(
                      color: Color(0xFF313131),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 40),
                child: Text(
                  'Average Owned Age',
                  style: TextStyle(
                      color: Color(0xFF313131),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 280, top: 5),
            child: Text(
              'Stock',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
          TextField(
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white30,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.horizontal(),
                    borderSide: BorderSide(color: Colors.red)),
                hintText: 'Seach',
                isDense: true,
                suffixIcon: Icon(Icons.search)),
          ),
        ]),
      ),
      body: isLoading
          ? const Text('Is Loading')
          : ListView.builder(
              itemCount: vehicle.length,
              itemBuilder: (context, index) {
                // log(cars!.length.toString());
                // final user = users[index];
                // final name = user['name']['first'];
                // final price = user['email'];
                // final imageUrl = user['picture']['thumbnail'];
                Vehicle car = vehicle.elementAt(index);

                return Container(
                  width: double.infinity,
                  child: Card(
                    color: Colors.white,
                    margin: const EdgeInsets.all(15),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            car.vin ?? '',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            car.vehicle ?? '',
                            style: const TextStyle(fontSize: 17),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 300, 0),
                          child: Text(
                            car.stock ?? '',
                            style: const TextStyle(fontSize: 17),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 320),
                          child: Text(
                            car.calc ?? '',
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 100, left: 20, bottom: 20),
                              child: Text(
                                car.price ?? '',
                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Text(
                                car.cost ?? '',
                                style: const TextStyle(fontSize: 12),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
                // Card(
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.zero,
                //       side: BorderSide(color: Color(0x00000040))),
                //   color: Color(0xffFFFFFF),
                //   child: ListTile(
                //     leading: ClipRRect(
                //         borderRadius: BorderRadius.circular(10),
                //         child: Image.network(imageUrl)),
                //     title: Text(
                //       name,
                //       style: const TextStyle(fontWeight: FontWeight.bold),
                //     ),
                //     subtitle: Text(price),
                //   ),
                // );
              }),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add_a_photo_sharp),
      //   onPressed: fetchUsers,
      // ),
      drawer: Drawer(
          child: SingleChildScrollView(
        child: Column(
          children: const [
            MyHeaderDrawer(),
            //MyDrawerList(),
          ],
        ),
      )),
    );
  }

  // void fetchUsers() async {
  //   print('fetch user called');
  //   const url = 'https://randomuser.me/api/?results=20';
  //   final uri = Uri.parse(url);
  //   final response = await http.get(uri);
  //   final body = response.body;
  //   final json = jsonDecode(body);

  //   setState(() {
  //     users = json['results'];
  //   });
  //   print('Button is worked');
  // }

  void getCars() async {
    setState(() {
      isLoading = true;
    });

    var client = http.Client();
    var uri = Uri.parse('https://powerbi.approcket.in/api/v1/report');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      log("My API response ${response.statusCode}");
      Map<String, dynamic> decoded = jsonDecode(response.body);
      var carModel = CarModel.fromJson(decoded);

      vehicle = carModel.data?.vehicle ?? [];
      //List<dynamic> vehicles = decoded['data']['vehicle'];
      // log(vehicles.length.toString());
      // log(vehicles.fromJson.runtimeType.toString());
      // List y = json.decode(response.body);
      // List<Vehicle> cars = y.map((item) => CarModel.fromJson(item)).toList();
      // return cars;
    }
    setState(() {
      isLoading = false;
    });
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
