import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:memorystack/database/boxes.dart';
import 'package:memorystack/models/memory.dart';
import 'package:memorystack/screens/home_screen.dart';
import 'package:memorystack/utils/default_theme.dart';

void main() async {
  await Hive.initFlutter;
  Hive.registerAdapter(MemoryAdapter());
  boxMemorys = await Hive.openBox<Memory>('memoryBox');
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