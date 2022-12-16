import 'package:auto_analytics_app/vehicle_over_view.dart';
import 'package:auto_analytics_app/widgets/car_information_card.dart';
import 'package:auto_analytics_app/widgets/header.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'model/car_information_model.dart';
class ActiveInventoryFeed extends StatefulWidget {
  const ActiveInventoryFeed({super.key});

  @override
  State<ActiveInventoryFeed> createState() => _ActiveInventoryFeedState();
}

class _ActiveInventoryFeedState extends State<ActiveInventoryFeed> {
  //List<dynamic> users = [];
  var isLoading = false;


  @override
  void initState() {
    super.initState();
    //fetch data from api
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      // executes after build
      getCars();
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: FutureBuilder(
          future: getCars(),
                builder: (context, snap) {
                  if(snap.hasData)
                    {
                      CarInformationModel model =   snap.data as CarInformationModel;
                      return SafeArea(
                        child: Column(
                          children: [
                            HeaderHomePage(
                              model: model!,
                            ),
                            Expanded(
                              child: InkWell(
                                child: Container(
                                    decoration: const BoxDecoration(color: Color(0xfff7f7f7)),
                                    child: ListView.builder(
                                      padding: const EdgeInsets.only(top: 12),
                                      itemBuilder: (BuildContext context, int index) {
                                        Vehicle? car = model!.data?.vehicle!.elementAt(index);
                                        return CarInformation(car: car!);
                                      },
                                      // 40 list items
                                      itemCount: model!.data?.vehicle!.length,
                                    ),
                                  ),
                                onTap: () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const VehicleOverView()),
                            );
                            },
                              ),
                              ),

                          ],
                        ),
                      );
                    }
                     return const Center(child: CircularProgressIndicator());
                },
              ));
  }
  Future getCars() async {
    var rawModel =
        await http.get(Uri.parse('https://powerbi.approcket.in/api/v1/report'));
    print(rawModel.statusCode.toString());
    print(rawModel.body);
     carInformationModelFromJson(rawModel.body);
    return      carInformationModelFromJson(rawModel.body);
  }


}
