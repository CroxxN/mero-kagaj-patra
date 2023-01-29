import 'package:flutter/material.dart';
import 'package:mero_kagaj_patra/src/camerautil.dart';
import 'package:http/http.dart' as http;

class LicenseCamera extends CameraApp {
  @override
  _LicenseCameraState() => _LicenseCameraState();
}

class _LicenseCameraState extends CameraAppState {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initController,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return GestureDetector(
              excludeFromSemantics: true,
              onDoubleTap: classifyLicense,
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
      final String path = await captureImage();
      final response = await http.post(
        Uri.parse('http://'),
        body: {'image': path},
      );
      if (!mounted) return;
      Navigator.of(context).pushNamed('/response', arguments: response.body);
      // recognize license
      // print("Found");
      // classify(path);
    } catch (e) {
      // print(e);
    }
  }
}
