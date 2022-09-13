import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class PersonDetail extends StatefulWidget {
  PersonDetail({Key? key, required this.id}) : super(key: key);
  int id;

  @override
  _PersonDetailState createState() => _PersonDetailState();
}

class _PersonDetailState extends State<PersonDetail> {
  var data;

  Future<void> geteserDetaildata() async {
    final response = await http.get(Uri.parse(
        'http://hunarmund.somee.com/api/Perform/get-person-details?id=' +
            widget.id.toString()));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
          title: Text("Person's Detail"),
        ),
        body: Container(
          child: FutureBuilder(
            future: geteserDetaildata(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("LOADING");
              } else {
                return Align(
                  alignment: Alignment.center,
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: Get.height * 0.2,
                          child: Image.asset(
                              'assets/202-2024580_png-file-profile-icon-vector-png.png')),

                      Text(
                        data['name'].toString().toUpperCase(),
                        style: TextStyle(fontSize: 23,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.phone),
                          SizedBox(
                            width: 010,
                          ),
                          Text(
                          data['phone'].toString(),
                          style: TextStyle(fontSize: 18),
                        ),



                        ],
                      ),

                      Container(
                        height: Get.height*0.5,
                        child: Column(

                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,

                            children: [
                        Text(
                          "   Father Name : ",
                          style: TextStyle(
                            color: Colors.white,
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          data['fatherName'].toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  Row(

                    mainAxisAlignment: MainAxisAlignment.start,

                      children: [
                        Text(
                          "   CNIC : ",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                        Text(
              data['cnic'].toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ],
                    ),

                        Row(
                      children: [
                        Text(
                          "   Gender : ",
                          style: TextStyle(
                            color: Colors.white,
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                        Text(
                          data['gender'].toString(),
                          style: TextStyle(
                              color: Colors.white,

                              fontSize: 20),
                        ),
                      ],
                    ),
                     Column(
                       children: [
                         Row(
                           children: [
                             Text(
                               "   Adress : ",
                               style: TextStyle(
                                   color: Colors.white,
                                   fontWeight: FontWeight.bold, fontSize: 22),
                             ),

                           ],
                         ),
                         Padding(
                           padding: EdgeInsets.only(left: Get.width*0.1),
                           child: Text(
                             data['address'].toString(),
                             style: TextStyle(
                               color: Colors.white,

                               fontSize: 20,
                             ),
                           ),
                         ),

                       ],
                     ),

Container(
  height:Get.height*0.2,
)



                          ],
                        ),

                        decoration: BoxDecoration(
                            color: Colors.blueGrey,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                          )
                        ),
                      )

                    ],
                  ),
                );

//                   Column(
//                   children: [
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Row(
//                       children: [
//                         Text(
//                           "   Name : ",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 22),
//                         ),
//                         Text(
//                           data['name'].toString(),
//                           style: TextStyle(fontSize: 20),
//                         ),
//                       ],
//                     ),
//                     Container(
//                       height: 1,
//                       color: Colors.grey,
//                     ),
//                     SizedBox(
//                       height: 7,
//                     ),
//
//
// /// father name
//
//                     Row(
//                       children: [
//                         Text(
//                           "   Father Name : ",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 22),
//                         ),
//                         Text(
//                           data['fatherName'].toString(),
//                           style: TextStyle(fontSize: 20),
//                         ),
//                       ],
//                     ),
//                     Container(
//                       height: 1,
//                       color: Colors.grey,
//                     ),
//                     SizedBox(
//                       height: 7,
//                     ),
//
//
//
// /// CNIC
//                     Row(
//                       children: [
//                         Text(
//                           "   CNIC : ",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 22),
//                         ),
//                         Text(
//               data['cnic'].toString(),
//                           style: TextStyle(fontSize: 20),
//                         ),
//                       ],
//                     ),
//                     Container(
//                       height: 1,
//                       color: Colors.grey,
//                     ),
//                     SizedBox(
//                       height: 7,
//                     ),
//
// /// phone number
//
//
//                     Row(
//                       children: [
//                         Text(
//                           "   Phone NO. : ",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 22),
//                         ),
//                         Text(
//                           data['phone'].toString(),
//                           style: TextStyle(fontSize: 20),
//                         ),
//                       ],
//                     ),
//                     Container(
//                       height: 1,
//                       color: Colors.grey,
//                     ),
//                     SizedBox(
//                       height: 7,
//                     ),
//
// ///Gender
//
//
//                     Row(
//                       children: [
//                         Text(
//                           "   Gender : ",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 22),
//                         ),
//                         Text(
//                           data['gender'].toString(),
//                           style: TextStyle(fontSize: 20),
//                         ),
//                       ],
//                     ),
//                     Container(
//                       height: 1,
//                       color: Colors.grey,
//                     ),
//                     SizedBox(
//                       height: 7,
//                     ),
//
//
//
// /// Adress
//
//
//                     Row(
//                       children: [
//                         Text(
//                           "   Adress : ",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 22),
//                         ),
//
//                       ],
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(left: Get.width*0.1),
//                       child: Text(
//                         data['address'].toString(),
//                         style: TextStyle(fontSize: 20,
//                         ),
//                       ),
//                     ),
//                   ],
//                 );
              }
            },
          ),
        ),
      ),
    );
  }
}
