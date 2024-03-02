import 'package:flutter/material.dart';
import 'contact_us.dart';
import 'navbar.dart';
 // Import the Contact Us page

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

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
      body: Center(
        child: Column(
          children: [
            const Text(
              'About Us',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Container(
              width: 350,
              height: 321,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.lightBlue[200],
                borderRadius: BorderRadius.circular(35),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.6),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                padding: const EdgeInsets.all(15),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SingleChildScrollView(
                      child: Text(
                        "We are passionate about transforming the way music influences emotions. Our mission revolves around creating an innovative emotion-based music recommendation system that harnesses facial expressions to understand and interpret a person's feelings in real-time.",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Join with us on this journey! ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    
                    
                  ],
                  
                ),
                
              ),
              
            ),
            const SizedBox(height: 14),
            ElevatedButton(
              onPressed: () {
                        // Navigate to the Contact Us page
               Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ContactUs()));
             },
             style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue,
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
              child: const Text(
                "Contact Us",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
          ),         

            const SizedBox(
              width: 200,
              height: 200,
              child: Image(image: AssetImage('assets/logo/Emo Rhythm.png')),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
