import 'package:flutter/material.dart';
import 'package:mobigic_app/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mobigic App',
      theme: ThemeData.dark(),
      home: SplashScreen(),
    );
  }
}