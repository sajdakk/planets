import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:softnauts/core/_core.dart';
import 'package:softnauts/screens/main/main_screen.dart';

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
      title: 'Softnauts',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const MainScreen(),
      builder: BotToastInit(),
    );
  }
}
