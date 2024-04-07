import 'package:EmoRythm/screens/profile/user_profile.dart';
import 'package:flutter/material.dart';
import 'capture_page.dart';
import 'home.dart';
import 'settings.dart';
import 'contact_us.dart';
import 'feedback.dart';
//import 'UserProfile.dart'; // Import your User Profile page file
//import 'MusicPlayer.dart'; // Import your Music Player page file

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  // ignore: unused_field
  Color _selectedIconColor = Colors.red; // Define color for selected icon
  // ignore: unused_field, prefer_final_fields
  Color _defaultIconColor =
      Colors.grey; // Define default color for unselected icons

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      // Update the color of selected icon
      _selectedIconColor = Colors.red; // Change to the desired color
      switch (index) {
        case 0:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              // ignore: prefer_const_constructors
              builder: (context) => HomePage(
                username: '',
              ),
            ),
          );
          break;
        case 1:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const ContactUs(),
            ),
          );
          break;
        case 2:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const CapturePage(),
            ),
          );
          break;
        case 3:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const UserProfilePage(
                username: "",
              ),
            ),
          );
          break;
        case 4:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const SettingsPage(),
            ),
          );
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        canvasColor: Colors.black,
      ),
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        //onTap: (index) => _changeTab(index),
        onTap: _onItemTapped,
        //selectedItemColor: Colors.red,
        //unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                // color: _currentIndex == 0
                //     ? Colors.red
                //     : Colors.grey, // Change color based on the selected index
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.music_note,
                // color: _currentIndex == 1
                //     ? Colors.red
                //     : Colors.grey, // Change color based on the selected index
              ),
              label: "Music Player"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.camera_alt,
                // color: _currentIndex == 2
                //     ? Colors.red
                //     : Colors.grey, // Change color based on the selected index
              ),
              label: "Camera"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                // color: _currentIndex == 3
                //     ? Colors.red
                //     : Colors.grey, // Change color based on the selected index
              ),
              label: "User Profile"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                // color: _currentIndex == 4
                //     ? Colors.red
                //     : Colors.grey, // Change color based on the selected index
              ),
              label: "Settings"),
        ],
      ),
    );
  }
}
