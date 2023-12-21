import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NationalityFinderScreen extends StatefulWidget {
  const NationalityFinderScreen({super.key});
  @override
  State<NationalityFinderScreen> createState() => _NationalityFinderScreenState();
}

class _NationalityFinderScreenState extends State<NationalityFinderScreen> {
  final TextEditingController _nameController = TextEditingController();
  String _nationality = '';

  Future<void> _fetchNationality() async {
    String name = _nameController.text.trim();
    if (name.isNotEmpty) {
      String apiUrl = 'https://api.agify.io/?name=$name';
      try {
        var response = await http.get(Uri.parse(apiUrl));
        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);
          setState(() {
            _nationality = data['age'].toString();
          });
        } else {
          setState(() {
            _nationality = 'Error: ${response.statusCode}';
          });
        }
      } catch (e) {
        setState(() {
          _nationality = 'Error: $e';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nationality Finder'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Enter Name',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _fetchNationality,
              child: const Text('Submit'),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Nationality: $_nationality',
              style: const TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
