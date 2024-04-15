import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(colorScheme: const ColorScheme.dark()),
      theme: ThemeData(colorScheme: const ColorScheme.light()),
      debugShowCheckedModeBanner: false,
      home: const MyApp(),
    );
  }
}
