import 'package:flutter/material.dart';
//import 'package:dg_marketplace/screens/home/home.dart';
import 'package:dg_marketplace/screens/authenticate/authenticate.dart';
import 'package:dg_marketplace/models/user.dart' as custom_user;
import 'package:provider/provider.dart';

import 'package:dg_marketplace/screens/footer/footer/navigation.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<custom_user.User?>(context);

    //return either home or authenticate widget
    if (user == null) {
      return const Authenticate();
    } else {
      return Navigation();
    }
  }
}
