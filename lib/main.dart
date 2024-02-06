import 'package:flutter/material.dart';
import 'package:planets/core/_core.dart';
import 'package:planets/screens/main/main_screen.dart';

void main() {
  setupAppLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Planets',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const MainScreen(),
      builder: (BuildContext context, Widget? child) {
        return child ?? const SizedBox();
      },
    );
  }
}
