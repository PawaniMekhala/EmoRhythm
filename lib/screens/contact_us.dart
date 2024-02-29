import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'thank_you.dart';
import 'navbar.dart';

void initState() {
  SystemChannels.textInput.invokeMethod('TextInput.hide');
  initState();
}

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  ContactUsFormState createState() => ContactUsFormState();
}

class _ContactUsFormData {
  String email = '';
  String name = '';
  String message = '';
}

class ContactUsFormState extends State<ContactUs> {
  final _formKey = GlobalKey<FormState>();
  final _ContactUsFormData _data = _ContactUsFormData();

  bool _validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (value.isEmpty || !regex.hasMatch(value)) {
      return false;
    } else {
      _data.email = value;
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690));
    return Scaffold(
      backgroundColor: const Color.fromRGBO(10, 39, 66, 1),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              top: 30,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/logo/Emo Rhythm.png',
                width: 350,
                height: 350,
              ),
            ),
            Positioned(
              top: 40,
              left: 10,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 320.0, 15.0, 30),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Contact us',
                        style: GoogleFonts.portLligatSlab(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // const SizedBox(height: 20),
                    // const Center(
                    //   child: Text("Happy to hear from you",
                    //       style: TextStyle(color: Colors.white, fontSize: 19)),
                    // ),

                    //const SizedBox(height: 30),
                    _buildFormField("Name"),
                    const SizedBox(height: 30),
                    _buildFormField("Email"),
                    const SizedBox(height: 30),
                    _buildFormField("Message", maxLines: 10),
                    const SizedBox(height: 30),
                    Center(
                      child: SizedBox(
                        width: 200.0,
                        height: 50.0,
                        child: ElevatedButton(
                          onPressed: () async {
                            _formKey.currentState!.save();
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ThankYouPage(title: 'Thank you'),
                                ),
                              );
                            }
                          },
                          child: Text("Send",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1B5699),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  Widget _buildFormField(String label, {int maxLines = 1}) {
    return Center(
      child: SizedBox(
        width: 300.0,
        child: TextFormField(
          onSaved: (value) {
            if (label == "Name") _data.name = value!;
            if (label == "Email") _data.email = value!;
            if (label == "Message") _data.message = value!;
          },
          maxLines: maxLines,
          style: const TextStyle(
            height: 0.2,
            color: Colors.grey,
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintText: "",
            labelText: label,
            labelStyle: const TextStyle(color: Colors.blueGrey, fontSize: 14),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your $label';
            } else if (label == "Email" && !_validateEmail(value)) {
              return 'Invalid email';
            }
            return null;
          },
        ),
      ),
    );
  }
}
