import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'navbar.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(10, 39, 66, 1),
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            // Background Image
            Positioned(
              top: 30,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/logo/Emo Rhythm.png', // Path to your logo image
                width: 350, // Adjust the width as needed
                height: 350, // Adjust the height as needed
              ),
            ),
            // Back Icon
            Positioned(
              top: 30,
              left: 10,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            // Forgot Password Content
            Positioned.fill(
              top: 400, // Adjust the top position as needed
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Forgot Password',
                      style: GoogleFonts.portLligatSlab(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        labelStyle: TextStyle(color: Colors.grey),
                        hintStyle: TextStyle(color: Colors.blueGrey),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 24),
                        backgroundColor: const Color(0xFF1B5699),
                      ),
                      onPressed: () {
                        // Implement logic to send password reset link
                      },
                      child: const Text(
                        'Reset Password',
                        style: TextStyle(
                          fontSize: 18,
                          //fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          const BottomNavBar(), // Add the custom bottom navigation bar
    );
  }
}
