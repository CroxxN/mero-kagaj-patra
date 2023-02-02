import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    getLicensePlateNumber(widget.response).then((value) {
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
            Center(
                child: Column(
              children: <Widget>[
                const Padding(padding: EdgeInsets.all(10.0)),
                Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Name: $response['name']")),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("Vehicle Company: $response['vehicle_company']"),
                ),
                Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Model: $response['model']")),
                Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Chaise Number: $response['chaise_number']")),
                Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                        "Manufactured Date: $response['manufactured_date']")),
                Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Expiry Data: $response['expiry_date']")),
                Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Horse Power: $response['horse_power']")),
                Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Last Tax Paid: $response['last_tax_paid']")),
              ],
            ))
          ],
        ),
      ),
    );
  }

  Future<Map<String, dynamic>> getLicensePlateNumber(String number) async {
    final db = FirebaseFirestore.instance;
    DocumentSnapshot<Map<String, dynamic>> result;
    try {
      result = await db.collection('kagaj').doc(number).get();
      return result.data() as Map<String, dynamic>;
    } catch (e) {
      print(e);
      return e as Map<String, dynamic>;
    }
  }
}
