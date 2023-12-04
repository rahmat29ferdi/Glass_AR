import 'dart:ffi';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:glassar/FirebaseLogin/Login.dart';
import 'package:glassar/circle.dart';
import 'package:glassar/FaceDetection.dart';
import 'package:glassar/kotak.dart';
import 'package:glassar/kucing.dart';
import 'package:glassar/layar_adaptif.dart';
import 'package:glassar/main.dart';
import 'package:glassar/tipis.dart';
import 'package:glassar/utama.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';

// Color warna1 = Color(0xff85C1E9);
Color warna1 = Color(0xff01579b);
Color warna2 = Colors.white;
Color warna3 = Color(0xff85C1E9);
// Color warna3 = Color(0xff1A5276);

class Face extends StatefulWidget {
  Face();
  @override
  _FaceState createState() => _FaceState();
}

class _FaceState extends State<Face> {
  late Future<String> userNameFuture;

  @override
  void initState() {
    super.initState();
    // userNameFuture = _fetchUserName();
  }

  // Future<String> _fetchUserName() async {
  //   final User? user = FirebaseAuth.instance.currentUser;
  //   final uid = user?.uid;
  //   DatabaseReference dbRef =
  //   FirebaseDatabase.instance.reference().child('users');
  //
  //   DataSnapshot snapshot =
  //   await dbRef.child(uid ?? '').child('name').once() as DataSnapshot;
  //   String userName = snapshot.value?.toString() ?? '';
  //   return userName;
  // }


  Future<void> _signOut(BuildContext context) async {
  // FirebaseAuth.instance.currentUsper.delete();
  await FirebaseAuth.instance.signOut();
  Navigator.push(
      context, MaterialPageRoute(builder: (BuildContext context) => Login()));
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton.icon(
                onPressed: () {
                  _signOut(context);
                },
                label: Text('signout',
                    style: TextStyle(fontSize: 25, color: Colors.white)),
                icon: Icon(
                  Icons.logout,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        // title: FutureBuilder<String>(
        //   future: userNameFuture,
        //   builder: (context, AsyncSnapshot<String> snapshot) {
        //     if (snapshot.connectionState == ConnectionState.done) {
        //       String userName = snapshot.data ?? '';
        //
        //       return Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceAround,
        //         children: [
        //
        //           Text(
        //             'Welcome, $userName!',
        //             style: TextStyle(fontSize: 25, color: Colors.white),
        //           ),
        //           SizedBox(width: 15), // Adjust the spacing as needed
        //           TextButton.icon(
        //             onPressed: () {
        //               _signOut(context);
        //             },
        //             label: Text(
        //               'Sign Out',
        //               style: TextStyle(fontSize: 25, color: Colors.white),
        //             ),
        //             icon: Icon(
        //               Icons.logout,
        //               color: Colors.white70,
        //             ),
        //           ),
        //         ],
        //
        //       );
        //     } else {
        //       // If data is not available yet, show a loading indicator or handle it accordingly
        //       return CircularProgressIndicator(
        //         backgroundColor: Colors.transparent,
        //         valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        //       );
        //     }
        //   },
        // ),
        backgroundColor: Colors.lightBlue[900],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.start,
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
                height: 20,
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  height: 250,
                  width: 380,
                  // ignore: sort_child_properties_last
                  child: TextButton(
                    style: TextButton.styleFrom(
                      alignment: Alignment.center,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => ObjecDetection()));
                    },
                    child: Text(
                      '',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/utama.jpeg'),
                      fit: BoxFit.fill,
                    ),
                    border: Border.all(color: warna3),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),

                    //color: Color(0xffEBF1FA),
                  )),
              SizedBox(
                height: 30,
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Glasses frame for your face",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: warna3,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ]),
              Container(
                height: 450,
                child: ListView(
                  //padding: EdgeInsets.all(20),
                  children: <Widget>[
                    Column(children: [
                      Container(
                          //alignment: Alignment.center,
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          height: 180,
                          //width: 340,
                          // ignore: sort_child_properties_last
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    height: 110,
                                    width: 100,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    child: Row(children: []),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image:
                                            AssetImage('assets/images/bulat.png'),
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Circle",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              """Cocok untuk bentuk wajah
persegi dan bentuk   wajah
hati.""",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: warna2,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15.0),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  SizedBox(
                                                    width: 110,
                                                  ),
                                                  Container(
                                                      height: 36,
                                                      width: 120,
                                                      // ignore: sort_child_properties_last
                                                      child: TextButton(
                                                        style:
                                                            TextButton.styleFrom(
                                                          alignment:
                                                              Alignment.center,
                                                        ),
                                                        onPressed: () {
                                                          Navigator.pushReplacement(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          circle()));
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          // ignore: prefer_const_literals_to_create_immutables
                                                          children: [
                                                            Text('More',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            255,
                                                                            255,
                                                                            255))),
                                                          ],
                                                        ),
                                                      ),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: warna1),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20.0)),
                                                        color: warna3,
                                                      ))
                                                ]),
                                          ]))
                                    ]),
                              ]),
                          decoration: BoxDecoration(
                            //border: Border.all(color: warna3),
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            color: warna1,
                          )),

//
//
//
//
//
//
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          //alignment: Alignment.center,
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          height: 180,
                          //width: 340,
                          // ignore: sort_child_properties_last
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    height: 110,
                                    width: 100,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    child: Row(children: []),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/kucing.png'),
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Cat Eye",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              """Cocok untuk bentuk wajah
Oblong dan bentuk   wajah
Persegi.""",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: warna2,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15.0),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  SizedBox(
                                                    width: 110,
                                                  ),
                                                  Container(
                                                      height: 36,
                                                      width: 120,
                                                      // ignore: sort_child_properties_last
                                                      child: TextButton(
                                                        style:
                                                            TextButton.styleFrom(
                                                          alignment:
                                                              Alignment.center,
                                                        ),
                                                        onPressed: () {
                                                          Navigator.pushReplacement(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          kucing()));
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          // ignore: prefer_const_literals_to_create_immutables
                                                          children: [
                                                            Text('More',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            255,
                                                                            255,
                                                                            255))),
                                                          ],
                                                        ),
                                                      ),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: warna1),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20.0)),
                                                        color: warna3,
                                                      ))
                                                ]),
                                          ]))
                                    ]),
                              ]),
                          decoration: BoxDecoration(
                            //border: Border.all(color: warna3),
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            color: warna1,
                          )),

//
//
//
//
//
//
//
//
//
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          //alignment: Alignment.center,
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          height: 180,
                          //width: 340,
                          // ignore: sort_child_properties_last
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    height: 110,
                                    width: 100,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    child: Row(children: []),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image:
                                            AssetImage('assets/images/kotak.png'),
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Square",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              """Cocok untuk bentuk wajah
Lingkaran dan bentuk wajah
Oval.""",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: warna2,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15.0),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  SizedBox(
                                                    width: 110,
                                                  ),
                                                  Container(
                                                      height: 36,
                                                      width: 120,
                                                      // ignore: sort_child_properties_last
                                                      child: TextButton(
                                                        style:
                                                            TextButton.styleFrom(
                                                          alignment:
                                                              Alignment.center,
                                                        ),
                                                        onPressed: () {
                                                          Navigator.pushReplacement(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          kotak()));
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          // ignore: prefer_const_literals_to_create_immutables
                                                          children: [
                                                            Text('More',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            255,
                                                                            255,
                                                                            255))),
                                                          ],
                                                        ),
                                                      ),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: warna1),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20.0)),
                                                        color: warna3,
                                                      ))
                                                ]),
                                          ]))
                                    ]),
                              ]),
                          decoration: BoxDecoration(
                            //border: Border.all(color: warna3),
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            color: warna1,
                          )),

//
//
//
//
//
//
//
//
//
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          //alignment: Alignment.center,
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          height: 180,
                          //width: 340,
                          // ignore: sort_child_properties_last
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    height: 110,
                                    width: 100,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    child: Row(children: []),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image:
                                            AssetImage('assets/images/tipis.png'),
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Thin",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              """Cocok untuk bentuk wajah
Lingkaran dan bentuk wajah
Oval.""",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: warna2,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15.0),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  SizedBox(
                                                    width: 110,
                                                  ),
                                                  Container(
                                                      height: 36,
                                                      width: 120,
                                                      // ignore: sort_child_properties_last
                                                      child: TextButton(
                                                        style:
                                                            TextButton.styleFrom(
                                                          alignment:
                                                              Alignment.center,
                                                        ),
                                                        onPressed: () {
                                                          Navigator.pushReplacement(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          tipis()));
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          // ignore: prefer_const_literals_to_create_immutables
                                                          children: [
                                                            Text('More',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            255,
                                                                            255,
                                                                            255))),
                                                          ],
                                                        ),
                                                      ),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: warna1),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20.0)),
                                                        color: warna3,
                                                      ))
                                                ]),
                                          ]))
                                    ]),
                              ]),
                          decoration: BoxDecoration(
                            //border: Border.all(color: warna3),
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            color: warna1,
                          )),
                    ])
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
