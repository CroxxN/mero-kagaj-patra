import 'dart:convert';

import 'package:flutter/material.dart';
// import 'firebase_options.dart';
import 'package:mero_kagaj_patra/src/Recognize/RecognizeMain.dart';
import 'package:mero_kagaj_patra/src/Reponse/Reponse.dart';
import 'package:mero_kagaj_patra/src/Validation/validation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() {
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final String response = jsonEncode({
      "name": "Rajesh",
      "valid": true,
      "expiry": "2021-12-31",
    });
    return MaterialApp(
      title: 'Mero Kagaj Patra',
      initialRoute: '/',
      routes: {
        '/': (context) => const RecognizeMainScreen(),
        '/response': (context) => ResponseMainScreen(response: response),
        '/validation': (context) => const ValidationMainScreen(),
        // '/history': (context) => RecognizeMainScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RecognizeMainScreen(),
    );
  }
}
