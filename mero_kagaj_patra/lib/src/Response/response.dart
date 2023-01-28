import 'package:flutter/material.dart';

class Response extends StatelessWidget {
  const Response({super.key});
  @override
  Widget build(BuildContext context) {
    final reponse = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Response'),
      ),
      body: Center(
        child: Text(reponse),
      ),
    );
  }
}
