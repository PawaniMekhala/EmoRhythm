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
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1B5699),
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            const Text(
              "Message sent successfully",
              style: TextStyle(
                color: Color(0xFF1B5699),
                fontWeight: FontWeight.w400,
                fontSize: 17,
              ),
            ),
            //SizedBox(height: screenHeight * 0.03),
            const Text(
              "We will get back to you soon",
              style: TextStyle(
                color: Color(0xFF1B5699),
                fontWeight: FontWeight.w400,
                fontSize: 17,
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
