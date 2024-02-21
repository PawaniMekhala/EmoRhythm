import 'package:flutter/material.dart';
import 'navbar.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(10, 39, 66, 1),
        // appBar: AppBar(
        //   title: const Text('Contact Us'),
        // ),
        body: Center(
          child: Container(
            width: 350,
            height: 650,
            margin: const EdgeInsets.all(10), // Add margin here
            decoration: BoxDecoration(
              color: const Color(0xFF0299D8),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(
                              context); // Navigate back to the previous screen
                        },
                      ),
                      const Text(
                        'Contact Us',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 40), // Adjust as needed
                    ],
                  ),
                ),
                Container(
                  width: 300,
                  height: 500,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  padding: const EdgeInsets.all(50),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1B5699),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween, //spaceBetween,spaceAround
                        children: [
                          Icon(Icons.call),
                          Icon(Icons.message),
                          Icon(Icons.mail),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Get in Touch',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 40),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Enter Your Name',
                          labelStyle: const TextStyle(
                            color: Color.fromARGB(255, 58, 56, 56),
                            //fontWeight: FontWeight.bold,
                          ),
                          hintText: 'Name',
                          hintStyle: TextStyle(
                            color: const Color.fromARGB(255, 58, 56, 56),
                            //fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Enter Your Email',
                          labelStyle: const TextStyle(
                            color: Color.fromARGB(255, 58, 56, 56),
                            //fontWeight: FontWeight.bold,
                          ),
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            color: const Color.fromARGB(255, 58, 56, 56),
                            //fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        maxLines: 3,
                        decoration: InputDecoration(
                          labelText: 'Message',
                          labelStyle: const TextStyle(
                            color: Color.fromARGB(255, 58, 56, 56),
                            //fontWeight: FontWeight.bold,
                          ),
                          hintText: 'Message',
                          hintStyle: TextStyle(
                            color: const Color.fromARGB(255, 58, 56, 56),
                            //fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Handle send button press
                        },
                        child: Text(
                          'Send',
                          style: TextStyle(
                            fontSize: 18,
                            //fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal:
                                  24), // Adjust the horizontal padding to change width
                          backgroundColor: Color.fromRGBO(10, 39, 66, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar:
            const BottomNavBar(), // Add the custom bottom navigation bar
      ),
    );
  }
}
