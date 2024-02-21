import 'package:flutter/material.dart';
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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: isDarkModeEnabled ? Colors.white : Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: const Color.fromRGBO(10, 39, 66, 1),
      ),
      body: Container(
        color: const Color.fromRGBO(10, 39, 66, 1),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Settings',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 40.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                color: Colors.lightBlue,
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
