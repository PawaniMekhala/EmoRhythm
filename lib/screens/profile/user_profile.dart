import 'package:flutter/material.dart';

import '../activity_log.dart';
import '../favorites.dart';
import '../login.dart';
import '../navbar.dart';
import '../settings.dart';
import 'update_profile.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key, required this.username});
  final String username;
  get isDarkModeEnabled => false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: isDarkModeEnabled ? Colors.white : Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromRGBO(10, 39, 66, 1),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const Image(
                            image: AssetImage("assets/profile_pic.jpg"))),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                username,
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'Port Lligat Slab',
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                ),
              ),
             
              const Text(
                'Nick name',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Port Lligat Slab',
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UpdateProfilePage()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue, side: BorderSide.none, shape: const StadiumBorder()),
                  child: const Text(
                    'Edit Profile',
                    style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              /// -- MENU
              ProfileMenuWidget(
                title: "Settings", 
                icon: Icons.settings_outlined, 
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SettingsPage()),
                  );
                }),
              
              ProfileMenuWidget(
                title: "Favorites", 
                icon: Icons.favorite_border, 
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FavoritesPage()),
                  );
                }
              ),
              
              ProfileMenuWidget(
                title: "Activity Log", 
                icon: Icons.assignment_outlined, 
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ActivityLogPage()),
                  );
                }
              ),

              const Divider(),
              const SizedBox(height: 10),

              ProfileMenuWidget(
                title: "Log Out", 
                icon: Icons.logout_rounded, 
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => const LoginPage()),
                );
                }
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white.withOpacity(0.1),
        ),
        child: Icon(icon, color: Colors.white),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Port Lligat Slab',
          color: Colors.white, // Change the text color here
          fontSize: 20,
           // You can adjust the font size if needed
        ),
      ),
    );
  }
}
