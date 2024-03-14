import 'package:EmoRythm/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'home.dart';
import 'signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Center(
                child: SizedBox(
                  width: 300,
                  height: 300,
                  child: Image.asset('assets/logo/Emo Rhythm.png'),
                ),
              ),
            ),
            _header(context),
            const SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) => EmailValidator.validate(value!)
                          ? null
                          : "Please enter a valid email",
                      onSaved: (value) => setState(() {
                        email = value!;
                      }),
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: 'email',
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          setState(() {
                            password = 'null';
                          });
                          return ('Please enter your password');
                        } else if (value.length < 8) {
                          setState(() {
                            password = 'null';
                          });
                          return 'Password must be at least 8 characters';
                        }
                        return null;
                      },
                      onSaved: (value) => setState((() => password = value!)),
                      maxLines: 1,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        hintText: 'password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Password',
                        style: TextStyle(color: Colors.blue, fontSize: 15),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                          color: const Color(0xFF1B5699),
                          borderRadius: BorderRadius.circular(20)),
                      child: TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState?.save();
                            debugPrint(
                                '🟩 Username: $email, Password: $password');
                            FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: email, password: password)
                                .then(
                              (value) async {
                                User? currentUser =
                                    FirebaseAuth.instance.currentUser;
                                debugPrint('🟩 currentUser: $currentUser');
                                if (currentUser != null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          'you signed in as : ${currentUser.email!}'),
                                    ),
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomePage(
                                        username: currentUser.email!,
                                      ),
                                    ),
                                  );
                                }
                              },
                            ).catchError(
                              (error) {
                                debugPrint("Login Failed: $error");
                              },
                            );
                          }
                        },
                        child: Text(
                          'Sign In',
                          style: GoogleFonts.portLligatSlab(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            _signup(context),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    debugPrint('Sign Up with Google');
                    final user = await AuthService().signInWithGoogle();
                    if (user != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(
                            username: user.email!,
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Sign-up failed'),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(15),
                    backgroundColor: const Color.fromRGBO(10, 39, 66, 1),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/logo/Logo-google.png',
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    debugPrint('Sign Up with Facebook');
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(15),
                    backgroundColor: const Color.fromRGBO(10, 39, 66, 1),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/logo/Facebook_Logo.png',
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    debugPrint('Sign Up with Apple');
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(15),
                    backgroundColor: const Color.fromRGBO(10, 39, 66, 1),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/logo/Apple_logo.png',
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

_header(context) {
  return Column(
    // Sign In Header
    children: [
      Text(
        "Sign In",
        style: GoogleFonts.portLligatSlab(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      const Text(
        "Enter your credential to login",
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Port Lligat Slab',
        ),
      ),
      //const SizedBox(height: 10),
    ],
  );
}

_signup(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const SizedBox(height: 15),
      const Text(
        "Don't have an account? ",
        style: TextStyle(
          //fontFamily: 'Port Lligat Slab',
          color: Colors.white,
        ),
      ),
      TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SignupPage()),
          );
        },
        child: const Text(
          "Sign Up",
          style: TextStyle(
            //fontFamily: 'Port Lligat Slab',
            fontSize: 15.0,
            color: Color.fromARGB(255, 109, 180, 238),
          ),
        ),
      )
    ],
  );
}
