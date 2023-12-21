import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GenderFinderScreen extends StatefulWidget {
  const GenderFinderScreen({super.key});

  @override
  State<GenderFinderScreen> createState() => _GenderFinderScreenState();
}

class _GenderFinderScreenState extends State<GenderFinderScreen> {
  final TextEditingController _nameController = TextEditingController();
  String _gender = '';
  String imagePath = 'images/Gender-Sign.png';

  Future<void> _fetchGender() async {
    String name = _nameController.text.trim();
    if (name.isNotEmpty) {
      String apiUrl = 'https://api.genderize.io/?name=$name';
      var response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        setState(() {
          _gender = data['gender'];
          imagePath = _gender == 'male' ? 'images/male.png' : 'images/female.png';
        });
      } else {
        setState(() {
          _gender = 'Error';
          imagePath = 'images/Gender-Sign.png';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gender Finder'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 1),
            colors: <Color>[
              Color(0xff1f005c),
              Color(0xff5b0060),
              Color(0xff870160),
              Color(0xffac255e),
              Color(0xffca485c),
              Color(0xffe16b5c),
              Color(0xfff39060),
              Color(0xffffb56b),
            ], // Gradient from https://learnui.design/tools/gradient-generator.html
            tileMode: TileMode.mirror,
          ),
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Enter Name',
                      fillColor: Colors.blue[100],
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 2.0,
                        ),
                      ),
                      prefixIcon: const Icon(Icons.person),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _fetchGender,
                    child: const Text('Submit'),
                  ),
                  const SizedBox(height: 50),
                  Text(
                    'Gender: $_gender',
                    style: const TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                  const SizedBox(height: 16.0),
                  Image.asset(
                    imagePath,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}