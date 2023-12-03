import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:glassar/Dashboard.dart';
import 'package:glassar/layar_adaptif.dart';
import 'dart:async';
import 'Login.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home(), initialRoute: '/', routes: {
      'homepage': (context) => HomePage(),
      'login': (context) => Login(),
    });
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    final User? user = FirebaseAuth.instance.currentUser;
    final uid = user?.uid;
    DatabaseReference dbRef =
    FirebaseDatabase.instance.reference().child('users');

    return FutureBuilder<DatabaseEvent>(
      future: dbRef.child(uid ?? '').child('name').once(),
      builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
        if (snapshot.hasData) {
          String value = snapshot.data?.snapshot.value?.toString() ?? '';
          return Scaffold(
            backgroundColor: Colors.lightBlue[900],
            // appBar: AppBar(
            //
            //   title: TextButton.icon(
            //     onPressed: () {
            //       _signOut(context);
            //     },
            //     label: Text('signout',
            //         style: TextStyle(fontSize: 25, color: Colors.white)),
            //     icon: Icon(
            //       Icons.logout,
            //       color: Colors.white70,
            //     ),
            //   ),
            //   backgroundColor: Colors.lightBlue[900],
            // ),
            appBar: AppBar(
              title: Text(
                'Selamat Datang, ' + value,
                style: TextStyle(fontSize: 25, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          body: Center(
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Text(
                    'Pada Aplikasi Glassar',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 25,),
                  Image.asset(
                    'assets/images/foto (2).jpeg', // Gantilah dengan path gambar Anda
                    width: 350, // Sesuaikan lebar gambar
                    height: 350, // Sesuaikan tinggi gambar
                  ),

                ],
              ),
            ),
          );
        }
        return Scaffold(
          backgroundColor: Colors.blueGrey[800],
          body: Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    //Add the following code to navigate to the login page after 2 seconds
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => face1()),
      );
    });
  }
}

// Future<void> _signOut(BuildContext context) async {
//   // FirebaseAuth.instance.currentUsper.delete();
//   await FirebaseAuth.instance.signOut();
//   Navigator.push(
//       context, MaterialPageRoute(builder: (BuildContext context) => Login()));
// }