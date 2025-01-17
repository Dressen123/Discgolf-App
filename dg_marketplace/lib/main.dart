import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      home: MyWidget(),
    ));

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('DG Marked'),
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: Text(
            'Producers',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                color: Colors.red[600]),
          ),
        ),
      ),
    );
  }
}
