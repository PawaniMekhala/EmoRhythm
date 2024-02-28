import 'package:flutter/material.dart';
import 'navbar.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsAndConditionsPage extends StatefulWidget {
  const TermsAndConditionsPage({Key? key}) : super(key: key);

  @override
  _TermsAndConditionsPageState createState() => _TermsAndConditionsPageState();
}

class _TermsAndConditionsPageState extends State<TermsAndConditionsPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 50, 15.0, 0),
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
                        const SizedBox(width: 8),
                        Text(
                          'Terms & Conditions',
                          style: GoogleFonts.portLligatSlab(
                            fontSize: 28,
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
                width: 320,
                height: 520,
                margin: const EdgeInsets.symmetric(vertical: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF1B5699),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Text(
                        "yrrrddLorem ipsum, or lipsum as graphic or web designs. The passage is attributed to an unknown type setter in the 15th century who is thought to have scrambled parts Malorum for use in a type specimen ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore ggfhffggLorem ipsum, or lipsum as it is sometimes known, is dummy ssdfjkjtext used in laying out print, graphic or web designs. The passage is attributed to an unknown types jgkfetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book. It usually begins with: Lorem ipsum dolor sit amet, consectetur gshgadipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: isChecked,
                            onChanged: (value) {
                              setState(() {
                                isChecked = value ?? false;
                              });
                            },
                            // Change the checkbox color
                            activeColor: Colors.grey,
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'I agree with the Privacy Policy',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    backgroundColor: const Color(0xFF1B5699),
                  ),
                  onPressed: () {
                    // Handle sending the email
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
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
