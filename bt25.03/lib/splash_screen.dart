// lib/screens/splash_screen.dart
import 'package:flutter/material.dart';
import 'onboarding_screen.dart';
import 'dart:ui' as ui;

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[400],
      body: GestureDetector(
        onTap: () {
          // Navigate to onboarding screen when user taps anywhere
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => OnboardingScreen()),
          );
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Nectar logo and branding using Container to set a fixed width
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/nectar_logo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Text(
                'Nectar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
