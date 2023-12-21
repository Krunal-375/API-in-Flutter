import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CatFactPage extends StatefulWidget {
    const CatFactPage({super.key}); 
  @override
  State<CatFactPage> createState() => _CatFactPageState();
}

class _CatFactPageState extends State<CatFactPage> {
  String fact = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCatFact();
  }

  Future<void> fetchCatFact() async {
    setState(() {
      isLoading = true;
    });

    final response = await http.get(Uri.parse('https://catfact.ninja/fact'));
    if (response.statusCode == 200) {//200 is the status code for OK and 404 is the status code for Not Found and 500 is the status code for Internal Server Error and 400 is the status code for Bad Request and 401 is the status code for Unauthorized and 403 is the status code for Forbidden and 301 is the status code for Moved Permanently and 302 is the status code for Found and 307 is the status code for Temporary Redirect and 308 is the status code for Permanent Redirect and 204 is the status code for No Content and 201 is the status code for Created and 202 is the status code for Accepted and 203 is the status code for Non-Authoritative Information and 205 is the status code for Reset Content and 206 is the status code for Partial Content and 304 is the status code for Not Modified and 400 is the status code for Bad Request and 401 is the status code for Unauthorized and 403 is the status code for Forbidden and 404 is the status code for Not Found and 500 is the status code for Internal Server Error and 503 is the status code for Service Unavailable and 504 is the status code for Gateway Timeout
      final data = jsonDecode(response.body);
      setState(() {
        fact = data['fact'];
        isLoading = false;
      });
    } else {
      setState(() {
        fact = 'Failed to fetch cat fact';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat Fact', style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
      ),
      body: Container(
        decoration: const BoxDecoration(
              image: DecorationImage(
              image: NetworkImage('https://www.shutterstock.com/image-vector/animal-tracks-vector-seamless-pattern-260nw-1438671989.jpg'),
              fit: BoxFit.cover,
              ),
              ),
        child: Container(
          color: Colors.black.withOpacity(0.8),
          child: Padding(
            padding: const EdgeInsets.all(38.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.pets, size: 200, color: Colors.white,),
                const SizedBox(height: 100,),
                const Center(child: Text('Cat Fact', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,color: Colors.white),)),
                const SizedBox(height: 20,),
                Center(
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : Text(fact, style: const TextStyle(fontSize: 18, color: Colors.white),textAlign: TextAlign.center,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
