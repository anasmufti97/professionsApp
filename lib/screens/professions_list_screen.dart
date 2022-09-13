import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'personDetail.dart';

class ProfessionListScreen extends StatefulWidget {
  ProfessionListScreen({Key? key, required this.text}) : super(key: key);
  String text;

  @override
  _ProfessionListScreenState createState() => _ProfessionListScreenState();
}

class _ProfessionListScreenState extends State<ProfessionListScreen> {
  var data;

  Future<void> geteserdata() async {
    final response = await http.get(Uri.parse(
        'http://hunarmund.somee.com/api/Perform/get-list-by-profession?profession=' +
            widget.text));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text(widget.text.toString()),
        ),
        body: FutureBuilder(
          future: geteserdata(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("LOADING");
            } else {
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>PersonDetail(id:data[index]['id'])),
                      );
      },

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: Get.height * 0.15,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey.withOpacity(0.4),
                                radius: Get.height * 0.05,
                                child: Icon(
                                  Icons.perm_identity_rounded,
                                  size: Get.height * 0.08,
                                  color: Colors.yellow,
                                ),
                              ),
                              Column(

                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    data[index]['name'].toString().toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),


                                  Container(
                                    height: 20,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.black)
                                    ),
                                    child: Center(child: Text("Verified")),
                                  ),

                                  Row(
                                    children: [

                                      Icon(Icons.star_rate_outlined, color: Colors.yellow,),
                                      Icon(Icons.star_rate_outlined, color: Colors.yellow,),
                                      Icon(Icons.star_rate_outlined, color: Colors.yellow,),
                                      Icon(Icons.star_rate_outlined, color: Colors.yellow,),
                                      Icon(Icons.star_rate_outlined, color: Colors.black.withOpacity(0.7),),

                                    ],
                                  )
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios, color: Colors.white,
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Colors.blueGrey.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    );
                    //
                    // InkWell(
                    //   onTap: (){
                    //
                    //     Get.to(PersonDetail(id:data[index]['id']));
                    //   },
                    //   child: Column(
                    //     children: [
                    //       SizedBox(
                    //         height: Get.height*0.05,
                    //       ),
                    //       CircleAvatar(
                    //         backgroundColor: Colors.black,
                    //         radius: Get.height*0.0515,
                    //         child: CircleAvatar(
                    //           backgroundColor: Colors.white,
                    //           radius: Get.height*0.05,
                    //           child: Icon(Icons.perm_identity_rounded, size:Get.height*0.08,color: Colors.orange,),
                    //         ),
                    //       ),
                    //       SizedBox(height: 10),
                    //       Text(data[index]['name'].toString().toUpperCase(), style: TextStyle(
                    //           color: Colors.orange,
                    //         fontWeight: FontWeight.bold
                    //
                    //       ),)
                    //
                    //     ],
                    //   ),
                    // );
                  });
            }
          },
        ),
      ),
    );
  }
}
