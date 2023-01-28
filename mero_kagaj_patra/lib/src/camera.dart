import 'package:flutter/material.dart';
import 'package:mero_kagaj_patra/src/camerautil.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';

class LicenseCamera extends CameraApp {
  @override
  _LicenseCameraState() => _LicenseCameraState();
}

class _LicenseCameraState extends CameraAppState {
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initController,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return GestureDetector(
              excludeFromSemantics: true,
              onTap: classifyLicense,
              child: Tooltip(
                  // add Tooltip for screen readers
                  message: "Double Tap to Identify License",
                  child: cameraWidget(context)));
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Future<void> classifyLicense() async {
    try {
      String path = await captureImage();
      await db
          .collection('license')
          .doc(path)
          .get()
          .then((DocumentSnapshot doc) {
        final data = doc.data();
        if (!mounted) return;
        Navigator.pushNamed(context, '/response', arguments: data);
      });
      // classify(path);
    } catch (e) {
      print(e);
    }
  }
}
