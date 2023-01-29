import 'package:flutter/material.dart';
import 'package:mero_kagaj_patra/src/camerautil.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
      final request = http.MultipartRequest('POST',
          Uri.parse('https://api.platerecognizer.com/v1/plate-reader/'));
      final file = await http.MultipartFile.fromPath('image', path);
      request.files.add(file);
      request.fields.addAll({
        "country": "np",
      });
      request.headers.addAll({
        "Authorization": "Token ",
      });
      final response = await request.send();
      final String responseString =
          await response.stream.transform(utf8.decoder).join();
      final Map<String, dynamic> responseJson = jsonDecode(responseString);
      if (!mounted) return;
      Navigator.of(context).pushNamed('/response',
          arguments: responseJson['results'][0]['plate']);
      // recognize license
      // print("Found");
      // classify(path);
    } catch (e) {
      return;
      // print(e);
    }
  }
}
