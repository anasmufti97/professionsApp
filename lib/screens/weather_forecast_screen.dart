import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../apis/weather.dart';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({Key? key}) : super(key: key);

  @override
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

List<Weather> weatherList = [];

Future<List<Weather>> getweatherApi() async {
  final response =
      await http.get(Uri.parse('http://hunarmund.somee.com/WeatherForecast'));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    for (Map i in data) {
      weatherList.add(Weather.fromJson(i));
    }
    return weatherList;
  } else {
    return weatherList;
  }
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("WEATHER FORCAST"),
          backgroundColor: Colors.blueGrey,
        ),
        body: Container(
          height: Get.height,
          width: Get.width,
          color: Colors.white,
          child: Expanded(
            child: FutureBuilder(
                future: getweatherApi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Text("LOADING");
                  } else {
                    return ListView.builder(
                        itemCount: weatherList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 10),
                            child: Container(
                              height: Get.height * 0.15,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: Colors.black
                                ),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(weatherList[index].date.toString()),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: Get.width * 0.05,
                                      ),
                                      Text(
                                        "Temperature in C : ",
                                        style: TextStyle(),
                                      ),
                                      Text(
                                        weatherList[index].temperatureC.toString(),
                                        style: TextStyle(
                                            color: Colors.blueAccent,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.05,
                                      ),
                                      Text(
                                        "Temperature in F : ",
                                        style: TextStyle(),
                                      ),
                                      Text(
                                        weatherList[index].temperatureF.toString(),
                                        style: TextStyle(
                                            color: Colors.blueAccent,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(),
                                      Text(
                                        "Summary : ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        weatherList[index].summary.toString(),
                                        style: TextStyle(
                                            color: Colors.blueAccent,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Container(),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  }
                }),
          ),
        ),
      ),
    );
  }
}
