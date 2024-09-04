
  import 'package:flutter/material.dart';
  
  class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('SignUp'),
        ),
        body: const Center(
          child: Text('SignUp Screen'),
        ),
      );
    }
  }
  