import 'package:dg_marketplace/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});
  @override
  Widget build(BuildContext context) {
    //Return either home or authenticate widget
    return Authenticate();
  }
}
