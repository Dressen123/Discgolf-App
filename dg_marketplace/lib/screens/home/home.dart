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
              } else if (value == 'Bag') {
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
            }, //From here and down is chatgpt generated
            itemBuilder: (BuildContext context) {
              return const [
                PopupMenuItem<String>(
                  value: 'DiscGPT',
                  child: Row(
                    children: [
                      Icon(Icons.chat),
                      SizedBox(width: 8),
                      Text('DiscGPT'),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'Logout',
                  child: Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 8),
                      Text('Logout'),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'Bag',
                  child: Row(
                    children: [
                      Icon(Icons.backpack),
                      SizedBox(width: 8),
                      Text('Your Bag'),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'PrivacyPolicy', // New option for Privacy Policy
                  child: Row(
                    children: [
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
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Main Page content
          ],
        ),
      ),
    );
  }
}
