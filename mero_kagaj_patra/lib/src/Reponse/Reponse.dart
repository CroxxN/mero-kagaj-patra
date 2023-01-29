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
              Center(
                  child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Name: ${response['name']}"),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Vehicle Company: ${response['Company']}"),
                  ),
                  Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Model: ${response['Model']}")),
                  Container(
                      padding: const EdgeInsets.all(10.0),
                      child:
                          Text("Chaise Number: ${response['chaiseNumber']}")),
                  Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                          "Manufactured Date: ${response['manufacturedDate']}")),
                  Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Expiry Data: ${response['ExpiryDate']}")),
                  Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Horse Power: ${response['HorsePower']}")),
                  Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Last Tax Paid: ${response['lastTaxPaid']}")),
                ],
              ))
          ],
        ),
      ),
    );
  }

  Future<Map<String, dynamic>> getLicensePlateNumber() async {
    final db = FirebaseFirestore.instance;
    Object? result = '';
    await db
        .collection('kagaj')
        .doc(widget.response)
        .get()
        .then((DocumentSnapshot doc) {
      result = doc.data();
    });
    return jsonDecode(result.toString());
  }
}
