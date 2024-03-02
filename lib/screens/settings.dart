import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'navbar.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkModeEnabled = false;
  bool isNotificationEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(10, 39, 66, 1),
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            // Image
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/logo/Emo Rhythm.png', // Path to your logo image
                width: 350, // Adjust the width as needed
                height: 350, // Adjust the height as needed
              ),
            ),
            // Back Icon
            Positioned(
              top: 30,
              left: 10,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: isDarkModeEnabled ? Colors.white : Colors.black,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            // Settings content
            Positioned.fill(
              top: 300, // Adjust the top position as needed
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Settings',
                      style: GoogleFonts.portLligatSlab(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      color: const Color(0xFF1B5699),
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSettingItem('Edit Profile', Icons.edit),
                          _buildSettingItem('Language', Icons.language),
                          _buildNotificationToggle(),
                          _buildSettingItem('Privacy', Icons.privacy_tip),
                          _buildDarkModeToggle(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          const BottomNavBar(), // Add the custom bottom navigation bar
    );
  }

  Widget _buildSettingItem(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: isDarkModeEnabled ? Colors.white : Colors.black),
          const SizedBox(width: 10.0),
          Text(
            title,
            style: TextStyle(
              color: isDarkModeEnabled ? Colors.white : Colors.black,
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDarkModeToggle() {
    return Row(
      children: [
        Icon(Icons.dark_mode,
            color: isDarkModeEnabled ? Colors.white : Colors.black),
        const SizedBox(width: 10.0),
        Text(
          isDarkModeEnabled ? 'Dark Mode' : 'Light Mode',
          style: TextStyle(
            color: isDarkModeEnabled ? Colors.white : Colors.black,
            fontSize: 20.0,
          ),
        ),
        const Spacer(),
        Switch(
          value: isDarkModeEnabled,
          onChanged: (value) {
            setState(() {
              isDarkModeEnabled = value;
            });
          },
          activeColor: Colors.white,
          inactiveTrackColor: Colors.black,
        ),
      ],
    );
  }

  Widget _buildNotificationToggle() {
    return Row(
      children: [
        Icon(Icons.notifications,
            color: isDarkModeEnabled ? Colors.white : Colors.black),
        const SizedBox(width: 10.0),
        Text(
          'Notification',
          style: TextStyle(
            color: isDarkModeEnabled ? Colors.white : Colors.black,
            fontSize: 18.0,
          ),
        ),
        const Spacer(),
        Switch(
          value: isNotificationEnabled,
          onChanged: (value) {
            setState(() {
              isNotificationEnabled = value;
            });
          },
          activeColor: Colors.black,
          inactiveTrackColor: Colors.black,
        ),
      ],
    );
  }
}
