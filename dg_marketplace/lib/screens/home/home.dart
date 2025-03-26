import 'package:flutter/material.dart';
import 'package:dg_marketplace/screens/services/auth.dart';
import 'package:dg_marketplace/screens/gpt-4o/chatsite.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Marked',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(34, 37, 41, 1),
        elevation: 0.0,
        actions: [
          TextButton.icon(
              onPressed: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChatSite()));
              },
              icon: const Icon(Icons.chat),
              label: const Text('DiscGPT')),
          TextButton.icon(
            icon: const Icon(Icons.person),
            label: const Text('logout'),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
    );
  }
}
