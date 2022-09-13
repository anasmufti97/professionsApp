import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:professions/screens/professions_list_screen.dart';
import '../apis/homescreendata.dart';
import 'weather_forecast_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

List<Color> _colors = [
  Colors.blueGrey.withOpacity(0.5),
  Colors.blue.withOpacity(0.5)
];
List<double> _stops = [0.0, 0.7];
List<Homescreendata> HomescreendataList = [];

Future<List<Homescreendata>> gethomedataApi() async {
  final response = await http
      .get(Uri.parse('http://hunarmund.somee.com/api/Perform/Professtions'));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    for (Map i in data) {
      HomescreendataList.add(Homescreendata.fromJson(i));
    }
    return HomescreendataList;
  } else {
    return HomescreendataList;
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>WeatherForecastScreen()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.room),
              ),
            )
          ],
          centerTitle: true,
          title: Text("H O M E"),
          backgroundColor: Colors.blueGrey,
        ),
        body: Container(
          height: Get.height,
          width: Get.width,
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: Get.height * 0.3,
                  width: Get.width,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Image.asset("assets/22.jpg"),
                      Text(
                        "If you are looking to hire somone you are at right place ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
color: Colors.blueGrey,
                          fontSize: 25,
                          fontWeight:FontWeight.bold
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "You are just one click away",
                        textAlign: TextAlign.center,
                        style: TextStyle(
color:Colors.grey,
                          fontWeight:FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Expanded(
                child: FutureBuilder(
                    future: gethomedataApi(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Text("LOADING");
                      } else {
                        return ListView.builder(
                            itemCount: HomescreendataList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 3),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>ProfessionListScreen(
                                          text: HomescreendataList[index]
                                              .name
                                              .toString())),
                                    );

                                  },
                                  child: Container(
                                    height: Get.height * 0.15,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: _colors,
                                          stops: _stops,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    //

                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(
                                              HomescreendataList[index]
                                                  .name
                                                  .toString()
                                                  .toUpperCase(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                "Book Now",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color:
                                                        Colors.yellow.shade900),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Colors.yellow.shade900,
                                                  size: 19,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

// Widget DrawerData() {
//   return Column(
//     children: [
//       Container(
//         height: Get.height * 0.07,
//         width: Get.width,
//         color: Colors.orange,
//         child: Center(
//             child: Text(
//           " WEATHER FORECAST",
//           style: TextStyle(color: Colors.white, fontSize: 20),
//         )),
//       ),
//       SizedBox(
//         height: Get.height * 0.2,
//       ),
//       Container(
//         height: 2,
//         color: Colors.white,
//       ),
//       Padding(
//         padding: const EdgeInsets.symmetric(vertical: 15.0),
//         child: InkWell(
//           onTap: () {
//             Get.to(WeatherForecastScreen());
//           },
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Text(
//                 "    Check Weather",
//                 style: TextStyle(color: Colors.orange, fontSize: 20),
//               ),
//               Container(),
//               Container(),
//               Icon(Icons.wrong_location_sharp, color: Colors.orange,)
//             ],
//           ),
//         ),
//       ),
//       Container(
//         height: 2,
//         color: Colors.white,
//       ),
//     ],
//   );
// }
}
