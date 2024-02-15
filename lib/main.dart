import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_application_2/screens/landing.dart';
import 'screens/login.dart';

void main() {
  runApp(
    DevicePreview(
      //enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      //useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color.fromRGBO(10, 39, 66, 1),
      ),
      home: const Splash(),
    );
  }
}
