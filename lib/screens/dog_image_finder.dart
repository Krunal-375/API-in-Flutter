import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DogImageFinder extends StatefulWidget {
  const DogImageFinder({super.key});
  @override
  State<DogImageFinder> createState() => _DogImageFinderState();
}

class _DogImageFinderState extends State<DogImageFinder> {
  String dogName = '';
  String imageUrl = '';

  Future<void> fetchDogImage() async {
    const url = 'https://dog.ceo/api/breeds/image/random';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        imageUrl = data['message'];
      });
    } else {
      throw Exception('Failed to fetch dog image');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dog Image Finder'),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              setState(() {
                dogName = value;
              });
            },
            decoration: const InputDecoration(
              labelText: 'Enter Dog Name',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              fetchDogImage();
            },
            child: const Text('Find Dog Image'),
          ),
          const SizedBox(height: 20),
          imageUrl.isNotEmpty
              ? Image.network(imageUrl)
              : Container(),
        ],
      ),
    );
  }
}
