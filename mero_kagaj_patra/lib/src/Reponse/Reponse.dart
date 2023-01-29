import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class ResponseMainScreen extends StatefulWidget {
  final String response;
  const ResponseMainScreen({
    Key? key,
    required this.response,
  }) : super(key: key);
  @override
  State<ResponseMainScreen> createState() => ResponseMainScreenState();
}

class ResponseMainScreenState extends State<ResponseMainScreen> {
  Map<String, dynamic> response = {};
  bool isLoading = true;
  ResponseMainScreenState() {
    getLicensePlateNumber().then((value) {
      setState(() {
        response = value;
        isLoading = false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Information'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            if (isLoading)
              const CircularProgressIndicator()
            else
              Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Name: ${response['name']}"),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Valid: ${response['valid']}"),
                  ),
                  Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Expiry Data: ${response['expiry']}")),
                ],
              )
          ],
        ),
      ),
    );
  }

  Future<Map<String, dynamic>> getLicensePlateNumber() async {
    final db = FirebaseFirestore.instance;
    Object? result = '';
    await db
        .collection('license')
        .doc(widget.response)
        .get()
        .then((DocumentSnapshot doc) {
      result = doc.data();
    });
    return jsonDecode(result.toString());
  }
}
