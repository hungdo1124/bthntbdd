import 'package:flutter/material.dart';
import 'package:nectar_app/splash_screen.dart';

void main() {
  runApp(NectarApp());
}

class NectarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nectar Grocery',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}
