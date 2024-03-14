import 'package:EmoRythm/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../navbar.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({super.key});

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  get isDarkModeEnabled => false;
  bool isObscurePassword = true;
  final _fullNameController = TextEditingController();
  final _nickNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  void dispose() {
    _fullNameController.dispose();
    _nickNameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
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
      body: Container(
        padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/profile_pic.jpg")),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 4, color: Colors.white),
                            color: Colors.blue,
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ))
                  ],
                ),
              ),
              const SizedBox(height: 30),
              buildTextField("Full Name", _fullNameController, false),
              buildTextField("Nick Name", _nickNameController, false),
              buildTextField("Email", _emailController, false),
              buildTextField("Password", _passwordController, true),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                          fontSize: 18, letterSpacing: 2, color: Colors.black),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: updateProfile,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue,
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: const Text("Save",
                        style: TextStyle(
                            fontSize: 18,
                            letterSpacing: 2,
                            color: Colors.white)),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  Widget buildTextField(String lableText, TextEditingController controller,
      bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: TextField(
        controller: controller,
        obscureText: isPasswordTextField ? isObscurePassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    icon: isObscurePassword
                        ? const Icon(
                            Icons.remove_red_eye,
                            color: Colors.grey,
                          )
                        : const Icon(
                            Icons.visibility_off,
                            color: Colors.grey,
                          ),
                    onPressed: () {
                      setState(() {
                        isObscurePassword = !isObscurePassword;
                      });
                    },
                  )
                : null,
            contentPadding: const EdgeInsets.only(bottom: 5),
            labelText: lableText,
            labelStyle: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            )),
      ),
    );
  }

  void updateProfile() async {
    final fullName = _fullNameController.text.trim();
    final nickName = _nickNameController.text.trim();
    final newEmail = _emailController.text.trim();
    final newPassword = _passwordController.text.trim();

    if (fullName.isNotEmpty) {
      await currentUser!.updateDisplayName(fullName);
      await currentUser!.verifyBeforeUpdateEmail(newEmail);
      await currentUser!.updatePassword(newPassword);
      debugPrint('✅ User : $currentUser');
    }

    // await FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(currentUser?.uid)
    //     .set({
    //   'fullName': fullName,
    //   'nickname': nickName,
    //   'email': newEmail,
    // });

    _fullNameController.clear();
    _nickNameController.clear();
    _passwordController.clear();
    _emailController.clear();

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profile updated successfully!'),
        duration: Duration(seconds: 2),
      ),
    );

    Navigator.pushAndRemoveUntil(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(builder: (BuildContext context) => const MyApp()),
      (Route<dynamic> route) => false,
    );
  }
}
