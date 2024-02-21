import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';
import 'home.dart';
//import 'Registration.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key, Key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: const Color.fromRGBO(10, 39, 66, 1),
          title: const Text(''),
        ),
        backgroundColor: const Color.fromRGBO(10, 39, 66, 1),
        body: SingleChildScrollView(
          child: Column(
            children: [
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
                        //const SizedBox(height: 20.0),
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
                            //fontFamily: 'Port Lligat Slab',
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
                      //width: 200,
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
                            //fontFamily: 'Port Lligat Slab',
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
