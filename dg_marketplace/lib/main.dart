import 'package:flutter/material.dart';
import 'package:dg_marketplace/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:dg_marketplace/models/user.dart';

/// The main entrypoint for the application.
///
/// Ensures that the Flutter binding is initialized and then initializes
/// Firebase with the options for the current platform. Then, it runs the
/// [MyApp] widget.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
        MaterialApp(
        home: Wrapper(),
    ),);
  }
}
