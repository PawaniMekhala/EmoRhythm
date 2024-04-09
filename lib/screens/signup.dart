import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';
import 'home.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key, Key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

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
                padding: const EdgeInsets.only(top: 30, left: 20),
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
                height: MediaQuery.of(context).size.height - 100,
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
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  validator: (value) =>
                                      EmailValidator.validate(value!)
                                          ? null
                                          : "Please enter a valid email",
                                  onSaved: (value) => setState(() {
                                    email = value!;
                                  }),
                                  maxLines: 1,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    hintText: 'email',
                                    hintStyle: TextStyle(color: Colors.white30),
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
                                  onSaved: (value) =>
                                      setState((() => password = value!)),
                                  maxLines: 1,
                                  style: TextStyle(color: Colors.white),
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.lock),
                                    hintText: 'password',
                                    hintStyle: TextStyle(color: Colors.white30),
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
                                  onSaved: (value) =>
                                      setState((() => password = value!)),
                                  maxLines: 1,
                                  style: TextStyle(color: Colors.white),
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.lock),
                                    hintText: 'confirm password',
                                    hintStyle: TextStyle(color: Colors.white30),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(35),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 25),
                                Container(
                                  height: 50,
                                  width: 300,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF1B5699),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: TextButton(
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState?.save();
                                        debugPrint(
                                            '🟩 Username: $email, Password: $password');
                                        try {
                                          await FirebaseAuth.instance
                                              .createUserWithEmailAndPassword(
                                            email: email,
                                            password: password,
                                          );
                                          User? currentUser =
                                              FirebaseAuth.instance.currentUser;
                                          debugPrint(
                                              '✅ User Signed Up : $currentUser');
                                          if (currentUser != null) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                    'you signed up as : ${currentUser.email!}'),
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
                                        } catch (e) {
                                          debugPrint('❌ Error Signing Up: $e');
                                          // ignore: use_build_context_synchronously
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text('Error signing up'),
                                            ),
                                          );
                                        }
                                      }
                                    },
                                    child: Text(
                                      'Sign Up',
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
                        ],
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
