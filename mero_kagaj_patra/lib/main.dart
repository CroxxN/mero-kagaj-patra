import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:mero_kagaj_patra/src/Recognize/RecognizeMain.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Future<Widget> build(BuildContext context) async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    return MaterialApp(
      title: 'Mero Kagaj Patra',
      initialRoute: '/',
      routes: {
        '/': (context) => RecognizeMainScreen(),
        '/response': (context) => ResponseMainScreen(),
        // '/history': (context) => RecognizeMainScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RecognizeMainScreen(),
    );
  }
}
