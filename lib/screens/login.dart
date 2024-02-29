import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';
import 'signup.dart';
//import 'Registration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // leading: IconButton(
      //   //   icon: Icon(Icons.arrow_back),
      //   //   onPressed: () {
      //   //     Navigator.pop(context);
      //   //   },
      //   // ),
      //   backgroundColor: const Color.fromRGBO(10, 39, 66, 1),
      //   title: Text(''),
      // ),
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
            _inputField(context),
            const SizedBox(height: 10),
            _signup(context),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle Google sign-up
                    print('Sign Up with Google');
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(15),
                    backgroundColor: const Color.fromRGBO(10, 39, 66, 1),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/logo/Logo-google.png', // Replace with your Google logo image path
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Handle Facebook sign-up
                    print('Sign Up with Facebook');
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(15),
                    backgroundColor: const Color.fromRGBO(10, 39, 66, 1),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/logo/Facebook_Logo.png', // Replace with your Facebook logo image path
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Handle Apple sign-up
                    print('Sign Up with Apple');
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(15),
                    backgroundColor: const Color.fromRGBO(10, 39, 66, 1),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/logo/Apple_logo.png', // Replace with your Apple logo image path
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

_inputField(context) {
  return Column(
    children: [
      // Username Field
      buildTextFieldWithIcon(
        icon: Icons.person,
        hintText: 'Username',
      ),
      const SizedBox(height: 10),
      // Password Field
      buildTextFieldWithIcon(
        icon: Icons.lock,
        hintText: 'Password',
        //labelText: 'Password',
        isPassword: true,
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const HomePage(
                  username: 'User',
                ),
              ),
            );
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

Widget buildTextFieldWithIcon({
  required IconData icon,
  required String hintText,
  bool isPassword = false,
}) {
  return Container(
    //width: 400,
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
        ),
      ),
    ),
  );
}
