import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:glassar/layar_adaptif.dart';
import 'package:glassar/main.dart';

/// CameraApp is the Main Application.
class CameraApp extends StatefulWidget {
  final List<CameraDescription> cameras;

  CameraApp(this.cameras);

  /// Default Constructor
  //const CameraApp({super.key});

  @override
  State<CameraApp> createState() => _CameraAppState();
}

loadTfliteModel() async {
  await Tflite.loadModel(
      model: "assets/muka.tflite", labels: "assets/labels.txt");
}

class _CameraAppState extends State<CameraApp> {
  late CameraController controller;

  @override
  void initState() {
    loadTfliteModel();
    super.initState();
    controller = CameraController(cameras[1], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }

      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            margin: EdgeInsets.fromLTRB(0, 40, 0, 40),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Camera",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 600,
                      width: 500,
                      child: CameraPreview(controller)),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        alignment: Alignment.center,
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => face1()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Back',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 30),
                          ),
                        ],
                      ),
                    ),
                  )
                ])));
  }
}
