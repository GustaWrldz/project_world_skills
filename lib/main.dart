import 'package:flutter/material.dart';
import 'package:project_world_skills/pages/login_page.dart';
import 'package:project_world_skills/pages/materias_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginPage(),
      routes: {
        "/login": (context) => const LoginPage(),
        "/materias": (context) => const MateriasPage()
      },
    );
  }
}
