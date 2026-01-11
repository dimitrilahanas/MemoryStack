import 'package:flutter/material.dart';
import 'package:memorystack/screens/home_screen.dart';
import 'package:memorystack/utils/default_theme.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: DefaultTheme.lightMode,
      darkTheme: DefaultTheme.darkMode,
      themeMode: ThemeMode.system,
    );
  }
}