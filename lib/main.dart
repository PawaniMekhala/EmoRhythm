import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
//import 'screens/login.dart';
import 'screens/Registration.dart';

void main() {
  runApp(
    DevicePreview(
      //enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emo Rhythm',
      debugShowCheckedModeBanner: false,
      //useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color.fromRGBO(10, 39, 66, 1),
      ),
      home: RegistrationPage(),
    );
  }
}
