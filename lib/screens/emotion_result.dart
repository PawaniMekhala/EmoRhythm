import 'package:EmoRythm/screens/feedback.dart';
import 'package:flutter/material.dart';

import 'navbar.dart';

class EmotionResultsPage extends StatefulWidget {
  final String mood; // Facial expression, e.g., "Happy", "Sad", etc.
  final List<String> playlist; // List of recommended music

  const EmotionResultsPage(
      {Key? key, required this.mood, required this.playlist})
      : super(key: key);

  @override
  State<EmotionResultsPage> createState() => _EmotionResultsPageState();
}

class _EmotionResultsPageState extends State<EmotionResultsPage> {
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
        backgroundColor: const Color.fromRGBO(10, 39, 66, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Emotion Result',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _buildMoodEmoji(), // Display Mood Emoji
            const SizedBox(height: 20),
            // Display Recommended Music List
            _buildMusicList(widget.playlist),

            _buildButtons(),

          ],
        ),
      ),
      
      bottomNavigationBar: const BottomNavBar(),
    );
  }
  

  Widget _buildMoodEmoji() {
    return Text(
      _getMoodEmoji(),
      style: const TextStyle(fontSize: 100),
    );
  }

  String _getMoodEmoji() {
    switch (widget.mood.toLowerCase()) {
      case 'happy':
        return '😊';
      case 'sad':
        return '😢';
      case 'angry':
        return '😠';
      // Add more cases for different facial expressions
      default:
        return '😐'; // Default neutral face
    }
  }

  Widget _buildMusicList(List<String> playlist) {
    return Expanded(
      child: ListView.builder(
        itemCount: playlist.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.blue, // Rectangle color
              borderRadius: BorderRadius.circular(10.0), // Round corner radius
            ),
            child: ListTile(
              title: Text(
                '${index + 1}. ${playlist[index]}', // Display index number
                style: const TextStyle(
                  color: Colors.white, // Text color
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.more_vert,
                    color: Colors.white), // Three-dot icon
                onPressed: () {
                  // Add functionality for the three-dot icon if needed
                  // For example, show a menu with more options
                },
              ),
            ),
          );
        },
      ),
    );
  }
  
  //Feedback and share buttons
  Widget _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 50),
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FeedbackPage()),
              );
            },
            icon: const Icon(Icons.feedback),
            label: const Text('Feedback'),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 50),
          child: ElevatedButton.icon(
            onPressed: _handleShare,
            icon: const Icon(Icons.share),
            label: const Text('Share'),
          ),
        ),
      ],
    );
  }


  void _handleShare() {
    // You can customize this function to share links to social media
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Share on Social Media'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Share your playlist on:'),
              const SizedBox(height: 8),
              _buildSocialMediaLink('Facebook', 'https://www.facebook.com/yourplaylistlink'),
              _buildSocialMediaLink('Twitter', 'https://www.twitter.com/yourplaylistlink'),
              // Add more social media links as needed
            ],
          ),
        );
      },
    );
  }

  Widget _buildSocialMediaLink(String platform, String link) {
    return GestureDetector(
      onTap: () {
        // Handle tapping on the social media link (open in browser, etc.)
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Text(
          '$platform: $link',
          style: const TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
        ),
      ),
    );
  }
}
