import 'package:flutter/material.dart';
import 'package:simple_social_media_app/features/profile/profile_presentation/profile_screens/my_profile.dart';

import '../../notifications/notifications_presentation/notifications_screens/notifications_screen.dart';
import '../../posts/posts_presentation/posts_screens/home_screen.dart';
import '../../search/users_presentation/search_screens/search_screen.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int _currentIndex = 0;

  // مؤقتًا Widgets لكل Tab
  final List<Widget> _pages = [
    HomeScreen(),
    NotificationsScreen(),
    SearchScreen(),
    MyProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Color(0xFFC9B59C),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notifications",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
