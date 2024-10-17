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
  bool isDarkMode = false;

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
    return MaterialApp(
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Nikobuddy'),
          backgroundColor: Colors.yellow[700],
          actions: [
            IconButton(
              icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
              onPressed: () {
                setState(() {
                  isDarkMode = !isDarkMode;
                });
              },
            ),
          ],
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
            _buildFarmPage(),
            _buildProfilePage(), // Updated profile page
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
              icon: const Icon(Icons.home_filled, size: 30),
              title: const Text('Home'),
              activeColor: Colors.deepPurpleAccent,
              inactiveColor: Colors.grey,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.article, size: 30),
              title: const Text('Blogs'),
              activeColor: Colors.orangeAccent,
              inactiveColor: Colors.grey,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.work, size: 30),
              title: const Text('Projects'),
              activeColor: Colors.blueAccent,
              inactiveColor: Colors.grey,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.agriculture, size: 30),
              title: const Text('Farm'),
              activeColor: Colors.greenAccent,
              inactiveColor: Colors.grey,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.person, size: 30),
              title: const Text('Profile'),
              activeColor: Colors.redAccent,
              inactiveColor: Colors.grey,
            ),
          ],
        ),
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
            const Text(
              'Latest Blogs',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildBlogList(),
            const SizedBox(height: 20),
            const Text(
              'Recent Projects',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildProjectList(),
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
          _buildBlogList(vertical: true),
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
          _buildProjectList(vertical: true),
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
          _buildFarmDetailCard('Temperature', '22°C', Icons.thermostat),
          const SizedBox(height: 16),
          _buildFarmDetailCard('Moisture', '45%', Icons.water),
          const SizedBox(height: 16),
          _buildFarmDetailCard('Humidity', '60%', Icons.opacity),
          const SizedBox(height: 16),
          _buildFarmDetailCard('Light Intensity', '300 Lux', Icons.wb_sunny),
          const SizedBox(height: 16),
          _buildSwitchCard('Automation', 'Enable/Disable automation features'),
        ],
      ),
    );
  }

  Widget _buildProfilePage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage(
                'https://pbs.twimg.com/profile_images/1129666690529128448/06XvLVCt_400x400.png'), // Replace with your own image
          ),
          const SizedBox(height: 16),
          const Text(
            'John Doe',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            'Mobile Developer',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          const SizedBox(height: 20),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              leading: const Icon(Icons.email, color: Colors.redAccent),
              title: const Text('john.doe@example.com'),
            ),
          ),
          const SizedBox(height: 10),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              leading: const Icon(Icons.phone, color: Colors.green),
              title: const Text('+123 456 7890'),
            ),
          ),
          const SizedBox(height: 10),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              leading: const Icon(Icons.location_on, color: Colors.blue),
              title: const Text('123, Your City, Country'),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton.icon(
  onPressed: () {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  },
  icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
  label: Text(isDarkMode ? 'Switch to Light Mode' : 'Switch to Dark Mode'),
  style: ElevatedButton.styleFrom(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    backgroundColor: isDarkMode ? Colors.grey[800] : Colors.blue, // Use backgroundColor instead of primary
  ),
),

        ],
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
                imageUrl: 'https://yt3.googleusercontent.com/R7PTqrMUbUEYEJ4eYubESlWPcZnAqTcqfXTt-NU4S2F9M-kEcB39JSHW50JpMs6Hjy1WEVDX8g=s900-c-k-c0x00ffffff-no-rj',
              ),
              _buildBlogCard(
                title: 'Dart Language Features',
                description: 'Explore advanced features in Dart.',
                imageUrl: 'https://yt3.googleusercontent.com/ytc/AGIKgqN6xqM7ivEMD7Wl7EqgOwgp0uc4zwoFSaE73tXJRw=s900-c-k-c0x00ffffff-no-rj',
              ),
            ],
          )
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildBlogCard(
                  title: 'Understanding Flutter Widgets',
                  description: 'A deep dive into Flutter widgets.',
                  imageUrl: 'https://yt3.googleusercontent.com/R7PTqrMUbUEYEJ4eYubESlWPcZnAqTcqfXTt-NU4S2F9M-kEcB39JSHW50JpMs6Hjy1WEVDX8g=s900-c-k-c0x00ffffff-no-rj',
                ),
                _buildBlogCard(
                  title: 'Dart Language Features',
                  description: 'Explore advanced features in Dart.',
                  imageUrl: 'https://yt3.googleusercontent.com/ytc/AGIKgqN6xqM7ivEMD7Wl7EqgOwgp0uc4zwoFSaE73tXJRw=s900-c-k-c0x00ffffff-no-rj',
                ),
              ],
            ),
          );
  }

  Widget _buildBlogCard({
    required String title,
    required String description,
    required String imageUrl,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: 280,
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(imageUrl, height: 150, width: double.infinity, fit: BoxFit.cover),
            ),
            const SizedBox(height: 12),
            Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text(description, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectList({bool vertical = false}) {
    return vertical
        ? Column(
            children: [
              _buildProjectCard(
                title: 'Flutter E-Commerce App',
                description: 'Building a complete e-commerce solution with Flutter.',
                imageUrl: 'https://flutter.dev/images/flutter-logo-sharing.png',
              ),
              _buildProjectCard(
                title: 'Personal Portfolio Website',
                description: 'A sleek, modern portfolio website for showcasing projects.',
                imageUrl: 'https://miro.medium.com/v2/resize:fit:1200/1*rxhP2nsR5_wlA_g4mzjXMQ.jpeg',
              ),
            ],
          )
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildProjectCard(
                  title: 'Flutter E-Commerce App',
                  description: 'Building a complete e-commerce solution with Flutter.',
                  imageUrl: 'https://flutter.dev/images/flutter-logo-sharing.png',
                ),
                _buildProjectCard(
                  title: 'Personal Portfolio Website',
                  description: 'A sleek, modern portfolio website for showcasing projects.',
                  imageUrl: 'https://miro.medium.com/v2/resize:fit:1200/1*rxhP2nsR5_wlA_g4mzjXMQ.jpeg',
                ),
              ],
            ),
          );
  }

  Widget _buildProjectCard({
    required String title,
    required String description,
    required String imageUrl,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: 280,
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(imageUrl, height: 150, width: double.infinity, fit: BoxFit.cover),
            ),
            const SizedBox(height: 12),
            Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text(description, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Widget _buildFarmDetailCard(String title, String value, IconData icon) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: Colors.green, size: 40),
        title: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text(value, style: const TextStyle(fontSize: 16)),
      ),
    );
  }

  Widget _buildSwitchCard(String title, String subtitle) {
    bool isEnabled = false;
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SwitchListTile(
        title: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 16)),
        value: isEnabled,
        onChanged: (bool value) {
          setState(() {
            isEnabled = value;
          });
        },
      ),
    );
  }
}
