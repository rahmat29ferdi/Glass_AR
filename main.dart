import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:glassar/FirebaseLogin/HomePage.dart';
import 'package:glassar/FirebaseLogin/Login.dart';
import 'firebase_options.dart';
import 'package:camera/camera.dart';
import 'package:glassar/model/kamera.dart';
import 'dart:async';

late List<CameraDescription> cameras;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  cameras = await availableCameras();
  runApp(MainPage());
}

String initialroute = 'login';

class MainPage extends StatefulWidget {
  @override
  _Splashscreen createState() => _Splashscreen();
}

class _Splashscreen extends State<MainPage> {
  void initState() {
    super.initState();
    this.isUserLoggedIn(context);
  }

  void isUserLoggedIn(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        print('User is currently signed out!');
        initialroute = 'login';
      } else {
        print('User is signed in!');
        initialroute = 'homepage';
      }
    });
  }

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GlassarAPP',
        home: Login(),
        initialRoute: initialroute,
        routes: {
          'homepage': (context) => HomePage(),
          'login': (context) => Login(),
    });

  }
}

