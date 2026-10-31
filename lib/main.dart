import 'package:flutter/material.dart';
import 'package:practica1/presentation/screens/home_future_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeFutureScreen(),
    );
  }
}
