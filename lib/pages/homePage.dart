import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movies_review/components/gridReviews.dart';
import 'package:movies_review/components/homeScreen.dart';

import '../components/movieGrid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late List<Widget> _widgetOptions;

  @override
  void initState() {
    _widgetOptions = [
      HomeScreen(),
      MovieGrid(),
      GridReviews(),
    ];
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex] as Widget,
      bottomSheet: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            label: 'Início',
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Filmes',
            icon: Icon(
              Icons.movie_creation_outlined,
              color: Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Críticas',
            icon: Icon(
              Icons.reviews_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
