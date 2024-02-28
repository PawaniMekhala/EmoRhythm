import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';
import 'home.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key, Key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(10, 39, 66, 1),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60, left: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                height: MediaQuery.of(context).size.height - 30,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Image.asset(
                          'assets/logo/Emo Rhythm.png',
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          "Sign up",
                          style: GoogleFonts.portLligatSlab(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          "Create your account",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 300,
                      child: Column(
                        children: <Widget>[
                          buildTextFieldWithIcon(
                            icon: Icons.person,
                            hintText: 'Username',
                          ),
                          const SizedBox(height: 5),
                          buildTextFieldWithIcon(
                            icon: Icons.lock,
                            hintText: 'Password',
                            isPassword: true,
                          ),
                          const SizedBox(height: 5),
                          buildTextFieldWithIcon(
                            icon: Icons.lock,
                            hintText: 'Confirm Password',
                            isPassword: true,
                          ),
                          const SizedBox(height: 5),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 3, left: 3),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const HomePage(
                                username: '',
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "Sign Up",
                          style: GoogleFonts.portLligatSlab(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          backgroundColor: const Color(0xFF1B5699),
                        ),
                      ),
                    ),
                    const Center(
                      child: Text(
                        "------ Or ------",
                        style: TextStyle(color: Colors.blue, fontSize: 15),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Already have an account?",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          },
                          child: const Text(
                            "Sign In",
                            style: TextStyle(color: Colors.blue, fontSize: 15),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
