import 'dart:math';

import 'package:flutter/material.dart';
import 'package:glassar/model/baseobjek.dart';
import 'package:glassar/Dashboard.dart';
import 'package:glassar/model/kamera.dart';
import 'package:glassar/layar_adaptif.dart';
import 'package:glassar/main.dart';

class kotak extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
            top: true,
            child: Scaffold(
                body: Center(
              child: Container(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 60),
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => face1()));
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  size: 40,
                                )),
                            SizedBox(
                              width: 50,
                            ),
                            SizedBox(
                                //height: 30.0,
                                child: Column(
                                    //mainAxisAlignment: MainAxisAlignment.center,
                                    //crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                  Text(
                                    "VirtualTryOn",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 35.0),
                                  ),
                                  Text(
                                    "Glasses",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: warna3,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 35.0),
                                  ),
                                ])),
                          ],
                        ),
                        Container(
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            height: 250,
                            //width: 380,
                            // ignore: sort_child_properties_last

                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/kotak.png'),
                                fit: BoxFit.fill,
                              ),
                              //border: Border.all(color: warna3),

                              //color: Color(0xffEBF1FA),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            //height: 30.0,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              Text(
                                "Square Frame",
                                //textAlign: TextAlign.justify,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35.0),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Frame kotak ini sering memberikan tampilan yang bersih, tegas, dan kontemporer",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ])),
                        // Row(
                        //     mainAxisAlignment: MainAxisAlignment.end,
                        //     children: [
                        //       Container(
                        //           height: 36,
                        //           width: 120,
                        //           // ignore: sort_child_properties_last
                        //           child: TextButton(
                        //             style: TextButton.styleFrom(
                        //               alignment: Alignment.bottomRight,
                        //             ),
                        //             onPressed: () {
                        //               Navigator.pushReplacement(
                        //                   context,
                        //                   MaterialPageRoute(
                        //                       builder: (context) =>
                        //                           CameraBase(cameras)
                        //                           // CameraApp(cameras)
                        //                   ));
                        //             },
                        //             child: Row(
                        //               mainAxisAlignment:
                        //                   MainAxisAlignment.center,
                        //               // ignore: prefer_const_literals_to_create_immutables
                        //               children: [
                        //                 Text('Try',
                        //                     style: TextStyle(
                        //                         fontWeight: FontWeight.bold,
                        //                         color: Color.fromARGB(
                        //                             255, 255, 255, 255))),
                        //               ],
                        //             ),
                        //           ),
                        //           decoration: BoxDecoration(
                        //             border: Border.all(color: warna1),
                        //             borderRadius:
                        //                 BorderRadius.all(Radius.circular(20.0)),
                        //             color: warna1,
                        //           ))
                        //     ])
                      ])),
            ))));
  }
}
