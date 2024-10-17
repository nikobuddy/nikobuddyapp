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
          _buildHomePage(),
          _buildBlogsPage(),
          _buildProjectsPage(),
          _buildFarmPage(), // Updated farm page
          Container(color: Colors.white, child: Center(child: Text('Profile Page'))),
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
        ],
      ),
    );
  }

  Widget _buildHomePage() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting Section
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.yellow[100],
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hey Buddy!',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Welcome to Nikobuddy!',
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                ],
              ),
            ),

            // Blog Section
            const Text(
              'Latest Blogs',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildBlogList(), // Horizontal blog list

            const SizedBox(height: 20), // Spacing between sections

            // Projects Section
            const Text(
              'Recent Projects',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildProjectList(), // Horizontal project list
          ],
        ),
      ),
    );
  }

  Widget _buildBlogsPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'All Blogs',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          _buildBlogList(vertical: true), // Vertical blog list
        ],
      ),
    );
  }

  Widget _buildProjectsPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'All Projects',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          _buildProjectList(vertical: true), // Vertical project list
        ],
      ),
    );
  }

  Widget _buildFarmPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Farm Details',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          
          // Temperature Card
          _buildFarmDetailCard('Temperature', '22°C', Icons.thermostat),
          const SizedBox(height: 16),

          // Moisture Card
          _buildFarmDetailCard('Moisture', '45%', Icons.water),
          const SizedBox(height: 16),

          // Humidity Card
          _buildFarmDetailCard('Humidity', '60%', Icons.opacity),
          const SizedBox(height: 16),

          // Additional farming metrics can be added here
          _buildFarmDetailCard('Light Intensity', '300 Lux', Icons.wb_sunny),
          const SizedBox(height: 16),

          // Switch for Automation
          _buildSwitchCard('Automation', 'Enable/Disable automation features'),
        ],
      ),
    );
  }

  Widget _buildFarmDetailCard(String title, String value, IconData icon) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, size: 40, color: Colors.green),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      value,
                      style: const TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  ],
                ),
              ],
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchCard(String title, String description) {
    bool isSwitched = false;

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  description,
                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ],
            ),
            Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
              activeTrackColor: Colors.green,
              activeColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBlogList({bool vertical = false}) {
    return vertical
        ? Column(
            children: [
              _buildBlogCard(
                title: 'Understanding Flutter Widgets',
                description: 'A deep dive into Flutter widgets.',
                imageUrl: 'https://yt3.googleusercontent.com/R7PTqrMUbUEYEJ4eYubESlWPcZnAqTcqfXTt-NU4S2F9M-kEcB39JSHW50JpMs6Hjy1WEVDX8w=s900-c-k-c0x00ffffff-no-rj',
              ),
              const SizedBox(height: 16),
              _buildBlogCard(
                title: 'State Management in Flutter',
                description: 'Different approaches to state management.',
                imageUrl: 'https://yt3.googleusercontent.com/R7PTqrMUbUEYEJ4eYubESlWPcZnAqTcqfXTt-NU4S2F9M-kEcB39JSHW50JpMs6Hjy1WEVDX8w=s900-c-k-c0x00ffffff-no-rj',
              ),
              const SizedBox(height: 16),
            ],
          )
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildBlogCard(
                  title: 'Understanding Flutter Widgets',
                  description: 'A deep dive into Flutter widgets.',
                  imageUrl: 'https://yt3.googleusercontent.com/R7PTqrMUbUEYEJ4eYubESlWPcZnAqTcqfXTt-NU4S2F9M-kEcB39JSHW50JpMs6Hjy1WEVDX8w=s900-c-k-c0x00ffffff-no-rj',
                ),
                const SizedBox(width: 16),
                _buildBlogCard(
                  title: 'State Management in Flutter',
                  description: 'Different approaches to state management.',
                  imageUrl: 'https://yt3.googleusercontent.com/R7PTqrMUbUEYEJ4eYubESlWPcZnAqTcqfXTt-NU4S2F9M-kEcB39JSHW50JpMs6Hjy1WEVDX8w=s900-c-k-c0x00ffffff-no-rj',
                ),
                const SizedBox(width: 16),
              ],
            ),
          );
  }

  Widget _buildBlogCard({required String title, required String description, required String imageUrl}) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.network(imageUrl, width: 150, height: 100, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              description,
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectList({bool vertical = false}) {
    return vertical
        ? Column(
            children: [
              _buildProjectCard(
                title: 'Farm Management System',
                description: 'A comprehensive system for managing farm operations.',
                imageUrl: 'https://yt3.googleusercontent.com/R7PTqrMUbUEYEJ4eYubESlWPcZnAqTcqfXTt-NU4S2F9M-kEcB39JSHW50JpMs6Hjy1WEVDX8w=s900-c-k-c0x00ffffff-no-rj',
              ),
              const SizedBox(height: 16),
              _buildProjectCard(
                title: 'Crop Monitoring App',
                description: 'An app to monitor crop growth and health.',
                imageUrl: 'https://yt3.googleusercontent.com/R7PTqrMUbUEYEJ4eYubESlWPcZnAqTcqfXTt-NU4S2F9M-kEcB39JSHW50JpMs6Hjy1WEVDX8w=s900-c-k-c0x00ffffff-no-rj',
              ),
              const SizedBox(height: 16),
            ],
          )
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildProjectCard(
                  title: 'Farm Management System',
                  description: 'A comprehensive system for managing farm operations.',
                  imageUrl: 'https://yt3.googleusercontent.com/R7PTqrMUbUEYEJ4eYubESlWPcZnAqTcqfXTt-NU4S2F9M-kEcB39JSHW50JpMs6Hjy1WEVDX8w=s900-c-k-c0x00ffffff-no-rj',
                ),
                const SizedBox(width: 16),
                _buildProjectCard(
                  title: 'Crop Monitoring App',
                  description: 'An app to monitor crop growth and health.',
                  imageUrl: 'https://yt3.googleusercontent.com/R7PTqrMUbUEYEJ4eYubESlWPcZnAqTcqfXTt-NU4S2F9M-kEcB39JSHW50JpMs6Hjy1WEVDX8w=s900-c-k-c0x00ffffff-no-rj',
                ),
                const SizedBox(width: 16),
              ],
            ),
          );
  }

  Widget _buildProjectCard({required String title, required String description, required String imageUrl}) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.network(imageUrl, width: 150, height: 100, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              description,
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
