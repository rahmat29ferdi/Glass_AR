// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:glassar/model/FaceDetection.dart';
import 'package:glassar/model/kamera.dart';
import 'package:glassar/layar_adaptif.dart';
import 'package:glassar/main.dart';

Color warna1 = Color(0xff85C1E9);
Color warna2 = Color(0xff8ABEBC6);
Color warna3 = Color(0xff1A5276);

class Utama extends StatefulWidget {
  Utama();
  @override
  _UtamaState createState() => _UtamaState();
}

class _UtamaState extends State<Utama> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.fromLTRB(30, 40, 30, 40),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                //height: 30.0,
                child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  Text(
                    "VirtualTryOn",
                    textAlign: TextAlign.center,
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
            SizedBox(
              height: 30,
            ),
            Container(
                //alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                height: 180,
                //width: 340,
                // ignore: sort_child_properties_last
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                      height: 130,
                      width: 100,
                      // ignore: prefer_const_literals_to_create_immutables
                      child: Row(children: []),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/wajah.png'),
                          fit: BoxFit.fill,
                        ),
                        border: Border.all(color: warna3),

                        //color: Color(0xffEBF1FA),
                      )),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        // ignore: avoid_unnecessary_containers
                        Container(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Whats your face shape ?",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                """see what type of face
you have""",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: warna3,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      width: 110,
                                    ),
                                    Container(
                                        height: 36,
                                        width: 120,
                                        // ignore: sort_child_properties_last
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                            alignment: Alignment.center,
                                          ),
                                          onPressed: () {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        face1()));
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            // ignore: prefer_const_literals_to_create_immutables
                                            children: [
                                              Text('Check',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color.fromARGB(
                                                          255, 255, 255, 255))),
                                            ],
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: warna1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0)),
                                          color: warna3,
                                        ))
                                  ]),
                            ]))
                      ]),
                ]),
                decoration: BoxDecoration(
                  border: Border.all(color: warna3),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  //color: Color(0xffEBF1FA),
                )),
            SizedBox(
              height: 60,
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Try on glasses that suit you",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: warna3,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                ]),
            SizedBox(
              height: 60,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        //alignment: Alignment.center,
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        height: 150,
                        //width: 150,
                        // ignore: sort_child_properties_last
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  height: 100,
                                  width: 110,
                                  // ignore: sort_child_properties_last
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      alignment: Alignment.center,
                                    ),
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => kamera1()));
                                    },
                                    child: Text(
                                      '',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/bulat.png'),
                                      fit: BoxFit.fill,
                                    ),
                                    border: Border.all(color: warna3),

                                    //color: Color(0xffEBF1FA),
                                  )),
                              Text(
                                "Circle",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: warna3,
                                    //fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            ]),
                        decoration: BoxDecoration(
                          border: Border.all(color: warna3),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          //color: Color(0xffEBF1FA),
                        )),
                    Container(
                        //alignment: Alignment.center,
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        height: 150,
                        //width: 150,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  height: 100,
                                  width: 110,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      alignment: Alignment.center,
                                    ),
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ModelCam(cameras)));
                                    },
                                    child: Text(
                                      '',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/kucing.png'),
                                      fit: BoxFit.fill,
                                    ),
                                    border: Border.all(color: warna3),

                                    //color: Color(0xffEBF1FA),
                                  )),
                              Text(
                                "Cat Eye",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: warna3,
                                    //fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            ]),
                        decoration: BoxDecoration(
                          border: Border.all(color: warna3),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          //color: Color(0xffEBF1FA),
                        )),
                  ],
                ),
                SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        //alignment: Alignment.center,
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        height: 150,
                        //width: 150,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  height: 100,
                                  width: 110,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      alignment: Alignment.center,
                                    ),
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => kamera1()));
                                    },
                                    child: Text(
                                      '',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/kotak.png'),
                                      fit: BoxFit.fill,
                                    ),
                                    border: Border.all(color: warna3),

                                    //color: Color(0xffEBF1FA),
                                  )),
                              Text(
                                "Square",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: warna3,
                                    //fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            ]),
                        decoration: BoxDecoration(
                          border: Border.all(color: warna3),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          //color: Color(0xffEBF1FA),
                        )),
                    Container(
                        //alignment: Alignment.center,
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        height: 150,
                        //width: 150,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  height: 100,
                                  width: 110,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      alignment: Alignment.center,
                                    ),
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => kamera1()));
                                    },
                                    child: Text(
                                      '',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/tipis.png'),
                                      fit: BoxFit.fill,
                                    ),
                                    border: Border.all(color: warna3),

                                    //color: Color(0xffEBF1FA),
                                  )),
                              Text(
                                "Thin",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: warna3,
                                    //fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            ]),
                        decoration: BoxDecoration(
                          border: Border.all(color: warna3),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          //color: Color(0xffEBF1FA),
                        )),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
