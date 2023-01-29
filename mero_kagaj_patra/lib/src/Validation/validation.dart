import 'package:flutter/material.dart';

class ValidationMainScreen extends StatefulWidget {
  final String? licensePlateNumber;
  const ValidationMainScreen({
    Key? key,
    this.licensePlateNumber,
  }) : super(key: key);
  @override
  State<ValidationMainScreen> createState() => ValidationMainScreenState();
}

class ValidationMainScreenState extends State<ValidationMainScreen> {
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    myController.text = widget.licensePlateNumber ?? '';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Validation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: TextField(
            controller: myController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'License Plate Number',
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .pushNamed('/response', arguments: myController.text);
        },
        tooltip: 'Enter',
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }
}
