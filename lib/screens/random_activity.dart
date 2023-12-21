import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RandomActivityScreen extends StatefulWidget {
  const RandomActivityScreen({super.key});
  @override
  State<RandomActivityScreen> createState() => _RandomActivityScreenState();
}

class _RandomActivityScreenState extends State<RandomActivityScreen> {
  String activity = '';
  String type = '';

  Future<void> fetchRandomActivity() async {
    final response = await http.get(Uri.parse('https://www.boredapi.com/api/activity'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        activity = data['activity'];
        type = data['type'];
      });
    } else {
      // Handle error
      setState(() {
        activity = 'Failed to fetch activity';
        type = 'Failed to fetch type';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchRandomActivity();
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color.fromARGB(255, 254, 246, 222),//rgba(254,246,222,255)
    appBar: AppBar(
      title: const Text('Random Activity'),
    ),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset('images/activity.png'),
        const SizedBox(height: 20),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$activity',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'Type: $type',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: fetchRandomActivity,
              child: const Text('Refresh'),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Image.asset('images/bored.png'),
      ],
    ),
  );
}
}
