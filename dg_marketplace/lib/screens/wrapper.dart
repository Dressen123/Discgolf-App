import 'package:flutter/material.dart';
//import 'package:dg_marketplace/screens/home/home.dart';
import 'package:dg_marketplace/screens/authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    //return either home or authenticate widget
    return Authenticate();
  }
}
