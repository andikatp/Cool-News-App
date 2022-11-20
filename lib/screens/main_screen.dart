import 'package:flutter/material.dart';
import 'package:news_cool_app/screens/home_page_screen.dart';
import 'detail_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static const routeName = '/main-page';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _items = [
    HomePageScreen(),
    DetailScreen(),
    HomePageScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            activeIcon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            activeIcon: Icon(Icons.person_2),
            label: 'Account',
          ),
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 10,
        currentIndex: _selectedIndex,
        onTap: (value) => setState(() {
          _selectedIndex = value;
        }),
      ),
      body: _items[_selectedIndex],
    );
  }
}
