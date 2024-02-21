import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'navbar.dart';
//import 'dart:io';

// ignore_for_file: use_build_context_synchronously

class CapturePage extends StatelessWidget {
  const CapturePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(10, 39, 66, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 20),
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/logo/Emo Rhythm.png', // Provide the path to your logo image
                    width: 350, // Adjust the width as needed
                    height: 350, // Adjust the height as needed
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Capture the Emotion',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        _capturePhoto(context);
                      },
                      icon: const Icon(Icons.camera_alt, color: Colors.black),
                      label: const Text(
                        'Capture',
                        style: TextStyle(
                          fontSize: 18,
                          //fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1B5699),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        _uploadFromFile(context);
                      },
                      icon: const Icon(Icons.file_upload, color: Colors.black),
                      label: const Text(
                        'Upload from Files',
                        style: TextStyle(
                          fontSize: 18,
                          //fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1B5699),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar:
          const BottomNavBar(), // Add the custom bottom navigation bar
    );
  }

  // Function to capture photo using device camera
  void _capturePhoto(BuildContext context) async {
    final picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      // Do something with the captured photo (e.g., display it)
      //File imageFile = File(pickedFile.path);
      // Here you can navigate to another page or perform any action with the captured image
      // For now, let's just display a dialog with the image path
      final currentContext = context;
      showDialog(
        context: currentContext,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Captured Image Path'),
            content: Text(pickedFile.path),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  // Function to upload image from device files
  void _uploadFromFile(BuildContext context) async {
    final picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Do something with the selected image (e.g., display it)
      //File imageFile = File(pickedFile.path);
      // Here you can navigate to another page or perform any action with the selected image
      // For now, let's just display a dialog with the image path
      final currentContext = context;
      showDialog(
        context: currentContext,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Selected Image Path'),
            content: Text(pickedFile.path),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
