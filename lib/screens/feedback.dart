import 'package:flutter/material.dart';
import 'navbar.dart';
//import 'package:reviews_slider/reviews_slider.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  // Create a null variable because in this variable, we store the selected face text.
  //String selected_valueoftxt = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(10, 39, 66, 1),
      body: Center(
        child: Container(
          width: 350,
          height: 650,
          margin: const EdgeInsets.all(10),
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
                        Navigator.pop(context);
                      },
                    ),
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Our friendly team would like to hear from you...',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 40),
                  ],
                ),
              ),
              Container(
                width: 300,
                height: 400,
                margin: const EdgeInsets.symmetric(vertical: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF1B5699),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Column(
                  children: [
                    // Your message box or any other content goes here
                    Text(
                      'Your message box content goes here...',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 20),
                    // Commenting out ReviewSlider as it's not used in your provided code
                    // ReviewSlider(
                    //   initialValue: 3,
                    //   options: list,
                    //   onChange: (int value) {
                    //     selected_valueoftxt = list[value];
                    //     setState(() {});
                    //   },
                    // ),
                    // Now we display the selected face text value in the text widget.
                    // Text(
                    //   selected_valueoftxt,
                    //   style: const TextStyle(
                    //     color: Colors.white,
                    //     fontSize: 20,
                    //   ),
                    // ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      //width: 250,
                      padding: const EdgeInsets.only(top: 3, left: 3),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 24),
                          backgroundColor: Color.fromRGBO(10, 39, 66, 1),
                        ),
                        onPressed: () {
                          // Handle submitting feedback
                        },
                        child: const Text(
                          'Submit Feedback',
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
      ),
      bottomNavigationBar:
          const BottomNavBar(), // Add the custom bottom navigation bar
    );
  }
}
