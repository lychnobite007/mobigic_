import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobigic_app/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: Image.network(
        "https://media.istockphoto.com/vectors/letter-d-logo-monogram-minimal-style-identity-initial-logo-mark-vector-id1266158282?k=20&m=1266158282&s=612x612&w=0&h=Cpr-wjwEKZb_YVlrizU_NVmJEYJV30br1RhhOZugzuI=",
        fit: BoxFit.cover,
      ),
    );
  }
}
