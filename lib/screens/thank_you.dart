import 'package:flutter/material.dart';
import 'navbar.dart';
import 'package:google_fonts/google_fonts.dart';

class ThankYouPage extends StatefulWidget {
  const ThankYouPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ThankYouPage> createState() => _ThankYouPageState();
}

class _ThankYouPageState extends State<ThankYouPage> {
  double screenWidth = 600;
  double screenHeight = 400;
  Color textColor = const Color(0xFF1B5699);

  // Function to show contact information
  void showContactInfo(BuildContext context, String info) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              "Reach Us",
              style: GoogleFonts.portLligatSlab(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          backgroundColor: const Color(0xFF1B5699),
          content: Text(
            info,
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFF168cdc)),
              ),
              child: const Text(
                "Close",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 170,
              padding: const EdgeInsets.all(0),
              child: Image.asset(
                "assets/logo/thankyou.png",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: screenHeight * 0.06),
            Text(
              "Thank you!",
              style: GoogleFonts.portLligatSlab(
                fontSize: 40,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Message sent successfully",
              style: TextStyle(
                color: Color(0xFF1B5699),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const Text(
              "We will get back to you soon",
              style: TextStyle(
                color: Color(0xFF1B5699),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: screenHeight * 0.08),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    // Show telephone number when icon is tapped
                    showContactInfo(
                      context,
                      "Telephone: 123-456-7890",
                    );
                  },
                  child: const Icon(
                    Icons.phone,
                    color: Colors.black,
                    size: 40,
                  ),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    // Show message number when icon is tapped
                    showContactInfo(context, "Message: 123-456-7890");
                  },
                  child: const Icon(
                    Icons.message,
                    color: Colors.black,
                    size: 40,
                  ),
                ),
                const SizedBox(width: 20), // Add space between icons
                GestureDetector(
                  onTap: () {
                    // Show email when icon is tapped
                    showContactInfo(context, "Email: EmoRhythm@gmail.com");
                  },
                  child: const Icon(
                    Icons.mail,
                    color: Colors.black,
                    size: 40,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
