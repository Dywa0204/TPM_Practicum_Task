import 'package:final_project/pages/map_page.dart';
import 'package:final_project/pages/profile_page.dart';
import 'package:flutter/material.dart';

import '../utils/global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List _pages = <Widget> [
    MapPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        color: kPrimaryColor,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: BottomNavigationBar(
            elevation: 0,
            iconSize: 24,
            type: BottomNavigationBarType.fixed,
            backgroundColor: kPrimaryColor,
            fixedColor: Colors.white,
            unselectedItemColor: kSecondaryColor,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile'
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}

