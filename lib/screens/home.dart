import 'package:EmoRythm/screens/emotion_result.dart';
import 'package:flutter/material.dart';
import 'about_us.dart';
import 'activity_log.dart';
import 'favorites.dart';
import 'help_and_support.dart';
import 'navbar.dart';
import 'profile/user_profile.dart';
import 'settings.dart'; 

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({Key? key, required this.username}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(10, 39, 66, 1),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              widget.username,
              style: const TextStyle(
                fontSize: 20,
                fontFamily: 'Port Lligat Slab',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UserProfilePage(username:"Imasha")),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  ItemHome(
                    title: 'Activity Log',
                    icon: Icons.assignment,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ActivityLogPage()),
                      );
                    },
                  ),
                  ItemHome(
                    title: 'Favorites',
                    icon: Icons.favorite,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FavoritesPage()),
                      );
                    },
                  ),
                  ItemHome(
                    title: 'Settings',
                    icon: Icons.settings,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingsPage()),
                      );
                    },
                  ),
                  ItemHome(
                    title: 'Help',
                    icon: Icons.help,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HelpAndSupportPage()),
                      );
                    },
                  ),
                  ItemHome(
                    title: 'About Us',
                    icon: Icons.info,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AboutUsPage(),
                        ),
                      );
                    },
                  ),
                  ItemHome(
                    title: 'Emotion',
                    icon: Icons.face,
                    onTap: () {
                      // Replace with your actual mood and playlist data
                      String mood = "happy";
                      List<String> playlist = ["Song 1", "Song 2", "Song 3"];

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EmotionResultsPage(
                            mood: mood,
                            playlist: playlist,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class ItemHome extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const ItemHome(
      {Key? key, required this.title, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.blue),
            const SizedBox(height: 10),
            Text(title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
