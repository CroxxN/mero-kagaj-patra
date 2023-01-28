import 'package:flutter/material.dart';
import 'package:mero_kagaj_patra/src/Recognize/RecognizeMain.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mero Kagaj Patra',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RecognizeMainScreen(),
    );
  }
}
