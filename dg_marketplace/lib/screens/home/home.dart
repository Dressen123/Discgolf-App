import 'package:flutter/material.dart';
import 'package:dg_marketplace/screens/services/auth.dart';
import 'package:dg_marketplace/screens/gpt-4o/chatsite.dart';
import 'package:dg_marketplace/screens/discsites/discsite.dart';
import 'package:dg_marketplace/screens/privacy and policy/privacy.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final AuthService _auth = AuthService();

  final items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
  ];

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
          // Dropdown menu button
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert, color: Colors.white),
            onSelected: (String value) {
              if (value == 'DiscGPT') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatSite()),
                );
              } else if (value == 'Logout') {
                _auth.signOut();
              } else if (value == 'Shop') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DiscListScreen()),
                );
              } else if (value == 'PrivacyPolicy') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PrivacyPolicyPage()), // Navigate to Privacy Policy
                );
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'DiscGPT',
                  child: Row(
                    children: const [
                      Icon(Icons.chat),
                      SizedBox(width: 8),
                      Text('DiscGPT'),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'Logout',
                  child: Row(
                    children: const [
                      Icon(Icons.person),
                      SizedBox(width: 8),
                      Text('Logout'),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'Bag',
                  child: Row(
                    children: const [
                      Icon(Icons.backpack),
                      SizedBox(width: 8),
                      Text('Your Bag'),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'PrivacyPolicy', // New option for Privacy Policy
                  child: Row(
                    children: const [
                      Icon(Icons.policy),
                      SizedBox(width: 8),
                      Text('Privacy Policy'),
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your page content goes here
          ],
        ),
      ),
    );
  }
}
