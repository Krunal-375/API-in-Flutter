import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          const SizedBox(height: 20,),
          Image.asset('images/logo.jpg'),
          const SizedBox(height: 20,),
          TextField(
            decoration: InputDecoration(
            border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            ),
            filled: true,
            hintStyle: TextStyle(color: Colors.grey[800]),
            hintText: "Type in your text",
            fillColor: Colors.white70,
            ),
          ),
          ElevatedButton(onPressed:(){}, child: const Text('Signup')),
        ]),
      ),
    );
  }
}