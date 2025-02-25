import 'package:flutter/material.dart';
import 'package:dg_marketplace/services/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
            backgroundColor: Colors.brown[400],
            elevation: 0.0,
            title: const Text('Sign in to DG marked')),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: ElevatedButton(
            child: const Text('Sign in anon'),
            onPressed: () async {
              dynamic result = await _auth.signInAnon();
              if (result == null) {
                print('Error signing in');
              } else {
                print('signed in');
                print(result);
              }
            },
          ),
        ));
  }
}
