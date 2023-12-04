import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:firebase_ml_model_downloader/firebase_ml_model_downloader.dart';
import 'package:glassar/layar_adaptif.dart';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';

const ModelName = "face";

class CameraBase extends StatefulWidget {
  final List<CameraDescription> cameras;

  CameraBase(this.cameras);

  @override
  State<CameraBase> createState() => _CameraBaseState();
}

// Future<void> loadTfliteModel() async {
//   try {
//     final FirebaseMLModelDownloader modelDownloader = FirebaseMLModelDownloader();
//     final FirebaseModelDownloader modelDownloader = FirebaseCustomModel(file: face, size: 5, name: face1, hash: 0)
//
//     final RemoteModelSource modelSource =
//     RemoteModelSource(remoteModelName: 'muka');
//
//     await modelDownloader.initialize();
//
//     if (await modelDownloader.getModelStatus(modelSource) ==
//         ModelDownloadStatus.pending) {
//       await modelDownloader.downloadModel(modelSource);
//     }
//
//     await Tflite.loadModel(
//       model: modelSource,
//       labels: 'assets/labels.txt',
//     );
//   } catch (e) {
//     print('Error loading the model: $e');
//   }
// }

class _CameraBaseState extends State<CameraBase> {
  String predOne = '';
  late CameraController controller;
  late FirebaseCustomModel? model;

  @override
  void initState() {
    loadTfliteModel();
    super.initState();
    initWithLocalModel();
    controller = CameraController(widget.cameras[1], ResolutionPreset.max);
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

  /// Initially get the lcoal model if found, and asynchronously get the latest one in background.
  initWithLocalModel() async {
    final _model = await FirebaseModelDownloader.instance.getModel(
        ModelName, FirebaseModelDownloadType.localModelUpdateInBackground);

    setState(() {
      model = _model;
    });
  }


  Future<void> loadTfliteModel() async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      bool isConnected = (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi);


      FirebaseCustomModel? _model;


      if (isConnected) {
        // If there is internet connection, download the latest model from Firebase
        _model = await FirebaseModelDownloader.instance.getModel(
            ModelName, FirebaseModelDownloadType.latestModel);
      } else {
        // If there is no internet connection, use the local model if available,
        // otherwise, download the model and save it locally
        _model = await FirebaseModelDownloader.instance.getModel(
            ModelName, FirebaseModelDownloadType.localModel);

        if (_model == null) {
          // If local model is not found, download the model and save it locally
          _model = await FirebaseModelDownloader.instance.getModel(
              ModelName, FirebaseModelDownloadType.latestModel);
          await FirebaseModelDownloader.instance.getModel(ModelName, FirebaseModelDownloadType.localModelUpdateInBackground);
        }
        print(ModelName);
        print('bisa firebase');
      }

      // Load the TFLite model based on the selected model (local or from Firebase)
      await Tflite.loadModel(
        model: _model?.name ?? 'assets/muka.tflite', // Use the model name if available
        labels: 'assets/labels.txt',
      );

      setState(() {
        model = _model;
      });
    } catch (e) {
      print('Error loading the model: $e');
    }
  }

  setRecognitions(outputs) {
    setState(() {
      predOne = outputs[0]['label'];
      // notif = outputs[0]['label'];
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
                      // height: 600,
                      // width: 500,
                      child: Camera(widget.cameras, setRecognitions)),
                      // child: CameraPreview(controller)),
                  SizedBox(
                    height: 40,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            // topLeft: Radius.circular(50.0),
                            // topRight: Radius.circular(50.0)
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // SizedBox(
                          //   height: 30.0,
                          // ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Bentuk Muka:  ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25.0),
                                ),
                                Text(
                                  "$predOne",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25.0),
                                ),
                              ]),
                          Container(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                alignment: Alignment.center,
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => face1()));
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
                        ],
                      ),
                    ),
                  )
                  // Container(
                  //   child: TextButton(
                  //     style: TextButton.styleFrom(
                  //       alignment: Alignment.center,
                  //     ),
                  //     onPressed: () {
                  //       Navigator.pushReplacement(context,
                  //           MaterialPageRoute(builder: (context) => face1()));
                  //     },
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         Text(
                  //           'Back',
                  //           style: TextStyle(
                  //               fontWeight: FontWeight.bold,
                  //               color: Colors.black,
                  //               fontSize: 30),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // )
                ])));
  }
}


typedef void Callback(List<dynamic> list);

class Camera extends StatefulWidget {
  final List<CameraDescription> cameras;
  final Callback setRecognitions;
  late var tes;

  Camera(this.cameras, this.setRecognitions);
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  late CameraController cameraController;
  bool isDetecting = false;

  @override
  void initState() {
    super.initState();
    cameraController =
        CameraController(widget.cameras[1], ResolutionPreset.high);
    cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      (() {
        print("selalu jalan");
      });
      print("selalu jalan");
      cameraController.startImageStream((image) {
        var tes = image.planes.map((plane) {
          return plane.bytes;
        });
        if (!isDetecting) {
          isDetecting = true;
          Tflite.runModelOnFrame(
            bytesList: image.planes.map((plane) {
              return plane.bytes;
            }).toList(),
            imageHeight: image.height,
            imageWidth: image.width,
            numResults: 1,
          ).then((value) {
            if (value!.isNotEmpty) {
              Future.delayed(const Duration(milliseconds: 500), () {
                widget.setRecognitions(value!);

                setState(() {});
              });

              print(value);
              isDetecting = true;
              // if (notif == 'Kucing') {
              //   //player.play();
              //   print("kucingggggggggggggggggggggggggggggggggg");
              //   print(tes);
              //   print(tes.runtimeType);
              //   print("kkakakaa");
              // }
            }
          });
        }
      });
    });
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!cameraController.value.isInitialized) {
      return Container(
        color: Colors.amber,
      );
    }

    return Center(
        child: Container(
          width: 800,
          height: 570,
          color: Colors.amber,
          child: CameraPreview(cameraController),
        ));
  }
}