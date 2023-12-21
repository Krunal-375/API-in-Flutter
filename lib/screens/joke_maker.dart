import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class JokeMaker extends StatefulWidget {
  const JokeMaker({super.key});

  @override
  State<JokeMaker> createState() => _JokeMakerState();
}

class _JokeMakerState extends State<JokeMaker> {
  String setup = 'Loading...';
  String punchline = '';
  String type = 'Loading...';
  @override
  void initState() {
    super.initState();
    getJokes(); 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Joke Maker'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          const Text('Joke of the day', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black),),
          const SizedBox(height: 200,),
          Text(type, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black),),
          const SizedBox(height: 20,),
          Text('$setup $punchline', style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.center,),
        ]),
      ),
    );
  }
  getJokes() async {
    final response = await http.get(Uri.parse('https://official-joke-api.appspot.com/random_joke'));

    //print(response.body.toString());
    final Map<String, dynamic> data = json.decode(response. body);
    setup = data['setup'];
    punchline = data['punchline'];
    type = data['type'];
    setState(() {});//Regenerate build method
    }
    
}