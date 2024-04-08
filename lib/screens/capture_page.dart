import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:typed_data';
import 'package:url_launcher/url_launcher.dart';
import 'emotion_result.dart';
import 'navbar.dart';

const String emotionDetectionUrl = 'http://3.107.1.99:5000/detect_emotion';

class CapturePage extends StatefulWidget {
  const CapturePage({Key? key});

  @override
  _CapturePageState createState() => _CapturePageState();
}

class _CapturePageState extends State<CapturePage> {
  late Future<void> cameraInitialize;
  String detectedEmotion = ''; // Variable to store detected emotion

  @override
  void initState() {
    super.initState();
  }

  Future<void> _capturePhoto(BuildContext context) async {
    final picker = ImagePicker();
    final XFile? pickedFile =
    await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      Uint8List bytes = await pickedFile.readAsBytes();

      // Perform emotion detection on the captured image
      await _performEmotionDetection(bytes);
    }
  }

  Future<void> _uploadFromFile(BuildContext context) async {
    final picker = ImagePicker();
    final XFile? pickedFile =
    await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      Uint8List bytes = await pickedFile.readAsBytes();

      // Perform emotion detection on the selected image
      await _performEmotionDetection(bytes);
    }
  }

  Future<void> _performEmotionDetection(Uint8List imageBytes) async {
    try {
      // Create an UploadFile object
      http.MultipartFile file = http.MultipartFile.fromBytes(
        'image',
        imageBytes,
        filename: 'image.jpg',
      );

      // Create a FormData object to send the file
      var formData =
      http.MultipartRequest('POST', Uri.parse(emotionDetectionUrl));
      formData.files.add(file);

      // Send the request
      var response = await formData.send();

      // Read the response
      var responseBody = await response.stream.bytesToString();

      // Parse the JSON response
      var jsonResponse = jsonDecode(responseBody);

      // Set the detected emotion in the state
      if (jsonResponse.containsKey('emotion')) {
        // Set the detected emotion in the state
        setState(() {
          detectedEmotion = 'Detected Emotion: ${jsonResponse['emotion']}';
        });




        //new add for navigation
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EmotionResultsPage(
              mood: jsonResponse['emotion'], playlist: ['Music'],
            ),
          ),
        );
      } else {
        // Handle the case when no face is detected
        setState(() {
          String nullEmotion = detectedEmotion;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EmotionResultsPage(
                mood: nullEmotion, playlist: const [],
              ),
            ),
          );
        });
      }

    } catch (e) {
      print('Error performing emotion detection: $e');
    }
  }


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
                    'assets/logo/Emo Rhythm.png',
                    width: 350,
                    height: 350,
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
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1B5699),
                      ),
                    ),
                  ),

                  // test purpose only for check the emotion

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
