import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'navbar.dart';

class HelpAndSupportPage extends StatelessWidget {
  const HelpAndSupportPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 350,
          height: 650,
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.question_answer_rounded,
                          color: Colors.white,
                        ),
                        SizedBox(width: 15),
                        Text(
                          'FAQs',
                          style: GoogleFonts.portLligatSlab(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 40),
                  ],
                ),
              ),
              Container(
                width: 300,
                height: 460,
                margin: const EdgeInsets.symmetric(vertical: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF1B5699),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const SingleChildScrollView(
                  child: Text(
                    "yrrrddLorem ipsum, or lipsum as graphic or web designs. The passage is attributed to an unknown type setter in the 15th century who is thought to have scrambled parts Malorum for use in a type specimen ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore ggfhffggLorem ipsum, or lipsum as it is sometimes known, is dummy ssdfjkjtext used in laying out print, graphic or web designs. The passage is attributed to an unknown types jgkfetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book. It usually begins with: Lorem ipsum dolor sit amet, consectetur gshgadipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 40),
              const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.support_agent, color: Colors.white),
                        SizedBox(width: 30),
                        Text(
                          'Contact Support',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      'EmoRhythm@gmail.com',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
