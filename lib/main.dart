import 'package:flutter/material.dart';
import 'package:practicalogin/Vistas/notes.dart';
import 'package:practicalogin/login/login.dart';
import 'package:practicalogin/pages/bienvenidaUI.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NeoSeñas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BienvenidaUI(),
    );
  }
}

