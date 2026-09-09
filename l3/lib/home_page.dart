// home_page.dart
import 'package:flutter/material.dart';
import 'package:l3/login.dart';
import 'package:l3/profile.dart';
import 'package:l3/social_media/social_media.dart';

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({
    super.key,
    required this.username,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  
  final List<String> pageTitles = [
    "Home",
    "Profile",
    "Social",
    "Settings",
  ];

  void logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  // Simple Home page
  Widget buildHomePage() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.home,
            size: 100,
            color: Colors.grey,
          ),
          SizedBox(height: 20),
          Text(
            'Home Page',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 10),
          Text(
            'Welcome to the app!',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  // Settings page
  Widget buildSettingsPage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.settings,
            size: 100,
            color: Colors.grey,
          ),
          const SizedBox(height: 20),
          const Text(
            'Settings Page',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          ],
      ),
    );
  }

  // Get the selected page with animation
  Widget getSelectedPage() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      switchInCurve: Curves.easeInOut,
      switchOutCurve: Curves.easeInOut,
      child: Container(
        key: ValueKey(selectedIndex),
        child: _buildPage(selectedIndex),
      ),
    );
  }

  // Build the page based on index
  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return buildHomePage();
      case 1:
        return ProfilePage(username: widget.username);
      case 2:
        return SocialMediaPage(userName: widget.username);
      case 3:
        return buildSettingsPage();
      default:
        return buildHomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitles[selectedIndex]),
        backgroundColor: const Color.fromARGB(255, 122, 198, 255),
        actions: [
          IconButton(
            onPressed: logout,
            icon: const Icon(Icons.logout),
            tooltip: "Logout",
          ),
        ],
      ),
      body: getSelectedPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Social',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        selectedItemColor: const Color.fromARGB(255, 122, 198, 255),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}