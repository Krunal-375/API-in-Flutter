import 'package:flutter/material.dart';
import 'package:flutter_application_4/screens/dashboard.dart';
import 'package:flutter_application_4/screens/list.dart';
import 'package:flutter_application_4/screens/list_dynamic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Second Flutter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Dashboard(),
    );
  }
}