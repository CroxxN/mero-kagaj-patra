import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:convert';

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
    response = getLicensePlateNumber();
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
            Center(
                child: Column(
              children: <Widget>[
                Container(
                    padding: const EdgeInsets.all(10.0),
                    child: const Text("Name: Ashsan Panday")),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("Vehicle Company: Toyota"),
                ),
                Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Model: Corolla")),
                Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Chaise Number: 123456789")),
                Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Manufactured Date: 2010-01-01")),
                Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Expiry Data: 2020-01-07")),
                Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Horse Power: 250")),
                Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Last Tax Paid: 2021-01-09")),
              ],
            ))
          ],
        ),
      ),
    );
  }

  Map<String, dynamic> getLicensePlateNumber() {
    final result = jsonEncode({
      "name": "Ahsan",
      "Company": "Toyota",
      "Model": "Corolla",
      "chaiseNumber": "123456789",
      "manufacturedDate": "2021-01-01",
      "ExpiryDate": "2021-01-01",
      "HorsePower": "1000",
      "lastTaxPaid": "2021-01-01"
    });

    return jsonDecode(result.toString());
  }
}
