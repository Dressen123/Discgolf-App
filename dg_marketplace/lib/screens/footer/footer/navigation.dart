import 'package:flutter/material.dart';
import 'package:dg_marketplace/screens/home/home.dart';
import 'package:dg_marketplace/screens/discsites/discsite.dart';
import 'package:dg_marketplace/screens/documents/documents.dart';

// SOURCE:The code is from this youtube video https://www.youtube.com/watch?v=VfUUOI6BUtE

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 0;

  final List<Widget> pages = [
    // Buttons / "links" to different pages
    Home(),
    DiscListScreen(),
    DocumentsScreen(),
    Placeholder(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white,
        onTap: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home), // Example color for Home
          ),
          BottomNavigationBarItem(
            label: 'Bag',
            icon: Icon(Icons.backpack), // Example color for Menu
          ),
          BottomNavigationBarItem(
            label: 'Policy',
            icon: Icon(Icons.shield),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
