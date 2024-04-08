import 'package:EmoRythm/screens/feedback.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'capture_page.dart';
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
      case 'surprise':
        return '😮';
      case 'disgust':
        return '🤢';
      case 'fear':
        return '😱';
      case 'neutral':
        return '😐';
      default:
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          // Add a post-frame callback to ensure the context is available
          _showNoFaceDetectedDialog(context);
        });
        return ''; // Default neutral face
    }
  }

  void _showNoFaceDetectedDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent user from tapping outside to dismiss
      builder: (context) {
        return AlertDialog(
          title: Text('No Face Detected'),
          content: const Text('Sorry, no face was detected in the image.Try again',
            style: TextStyle(fontSize: 19),),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CapturePage()), // Navigate to CapturePage
                );
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
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
              borderRadius: BorderRadius.circular(30.0), // Round corner radius
            ),
            child: ListTile(
              title: Text(
                '${index + 1}. ${playlist[index]}', // Display index number
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
                  // Add functionality for the three-dot icon if needed
                  _showOptionsDialog(context, playlist[index]);
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
                  // Open web browser
                  openWebBrowser(widget.mood);
                  // Add functionality for Option 1
                  Navigator.of(context)
                      .pop(); // Close the dialog after selecting an option
                },
              ),
              ListTile(
                title: const Text('Add to favorites'),
                onTap: () {

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
    // Show dialog only if no other dialog is currently showing
    if (!Navigator.of(context).userGestureInProgress) {
      showDialog(
        context: context,
        barrierDismissible: false, // Prevent user from tapping outside to dismiss
        builder: (context) {
          return WillPopScope(
            // Disable back button to prevent dismissing dialog
            onWillPop: () async => false,
            child: AlertDialog(
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
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                  child: const Text('Close'),
                ),
              ],
            ),
          );
        },
      );
    }
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


void openWebBrowser(String emotion) {
  try {
    String musicUrl = getMusicUrl(emotion);
    launch(musicUrl);
  } catch (e) {
    print('Error opening web browser: $e');
  }
}

String getMusicUrl(String emotion) {
  Map<String, String> musicMapping = {
    'Angry': 'https://www.youtube.com/watch?v=YKLX3QbKBg0',
    'Disgust': 'https://www.youtube.com/watch?v=I-QfPUz1es8',
    'Fear': 'https://www.youtube.com/watch?v=GVUqZC7lNiw',
    'Happy': 'https://www.youtube.com/watch?v=dhYOPzcsbGM',
    'Sad': 'https://www.youtube.com/playlist?list=RDEM3oyuw1l1PZuOAgZ1jAbitQ&playnext=1&si=ZbK3sN-y8TDQ9E0o',
    'Surprise': 'https://www.youtube.com/watch?v=7ufkMTshjz8',
    'Neutral': 'https://www.youtube.com/watch?v=TBsKCT4rsPw',
  };
  return musicMapping[emotion] ??
      'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-Default.mp3';
}


