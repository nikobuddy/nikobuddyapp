import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nikobuddy'),
        backgroundColor: Colors.yellow[700],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _currentIndex = index);
        },
        children: <Widget>[
          Container(color: Colors.white, child: Center(child: Text('Home Page'))),
          Container(color: Colors.white, child: Center(child: Text('Blogs Page'))),
          Container(color: Colors.white, child: Center(child: Text('Projects Page'))),
          Container(color: Colors.white, child: Center(child: Text('Farm Page'))),
          Container(color: Colors.white, child: Center(child: Text('Profile Page'))),
          // Removed the Settings Page to comply with the item limit
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.home_filled, size: 30),
            title: const Text('Home'),
            activeColor: Colors.deepPurpleAccent,
            inactiveColor: Colors.grey,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.article, size: 30),
            title: const Text('Blogs'),
            activeColor: Colors.orangeAccent,
            inactiveColor: Colors.grey,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.work, size: 30),
            title: const Text('Projects'),
            activeColor: Colors.blueAccent,
            inactiveColor: Colors.grey,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.agriculture, size: 30),
            title: const Text('Farm'),
            activeColor: Colors.greenAccent,
            inactiveColor: Colors.grey,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.person, size: 30),
            title: const Text('Profile'),
            activeColor: Colors.redAccent,
            inactiveColor: Colors.grey,
          ),
          // Removed the Settings item to comply with the item limit
        ],
      ),
    );
  }
}
