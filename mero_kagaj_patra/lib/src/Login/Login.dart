import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Response({super.key});
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/recognize');
              },
              child: const Text('Traffic'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/recognize');
              },
              child: const Text('Public'),
            ),
          ],
        ), 
      ),
    );
  }
}

class _LoginState extends State<Login> {
  email = '';
  password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Text('Login'),
      ),
    );
  }
  Future<void> login() async{
    if (email == '' || password == '') {
      return;
    }
    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (user != null) {
        Navigator.pushNamed(context, '/recognize');
      }
    } catch (e) {
      print(e);
    }
  }
}