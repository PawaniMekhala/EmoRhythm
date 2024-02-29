import 'package:flutter/material.dart';

import 'navbar.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  get isDarkModeEnabled => false;

  // Replace this with your list of favorite songs
  List<String> favoriteSongs = [
    "Favorite Song 1",
    "Favorite Song 2",
    "Favorite Song 3"
  ];

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
        backgroundColor: const Color.fromRGBO(10, 39, 66, 1),
        title: const Text(
          'Favorites',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            _buildFavoriteMusicList(favoriteSongs),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  Widget _buildFavoriteMusicList(List<String> favoriteSongs) {
    return Expanded(
      child: ListView.builder(
        itemCount: favoriteSongs.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.blue, // Rectangle color
              borderRadius: BorderRadius.circular(50.0), // Round corner radius
            ),
            child: ListTile(
              title: Text(
                '${index + 1}. ${favoriteSongs[index]}', // Display index number
                style: const TextStyle(
                  color: Colors.white, // Text color
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.more_vert,
                    color: Colors.white), // Three-dot icon
                onPressed: () {
                  _showOptionsDialog(context, favoriteSongs[index]);
                },
              ),
            ),
          );
        },
      ),
    );
  }

  void _showOptionsDialog(BuildContext context, String song) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(song),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Play Song'),
                onTap: () {
                  // Add functionality for Option 1
                  Navigator.of(context)
                      .pop(); // Close the dialog after selecting an option
                },
              ),
              ListTile(
                title: const Text('Remove from favorites'),
                onTap: () {
                  _deleteSong(song);
                  // Add functionality for Option 2
                  Navigator.of(context)
                      .pop(); // Close the dialog after selecting an option
                },
              ),
              // Add more options as needed
            ],
          ),
        );
      },
    );
  }

  void _deleteSong(String song) {
    // Add functionality to delete the song from your data structure
    setState(() {
      favoriteSongs.remove(song);
    });
  }
}
