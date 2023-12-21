import 'package:flutter/material.dart';

class HorizontalScrollImages extends StatefulWidget {
  const HorizontalScrollImages({super.key});

  @override
  State<HorizontalScrollImages> createState() => _HorizontalScrollImagesState();
}

class _HorizontalScrollImagesState extends State<HorizontalScrollImages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Horizontal Scroll Images'),
      ),
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
         Image(image: NetworkImage('https://live.staticflickr.com/65535/51980751292_38b3d98b76_b.jpg')),
         SizedBox(height: 10,),
         Image(image: NetworkImage('https://static.scientificamerican.com/sciam/cache/file/7A715AD8-449D-4B5A-ABA2C5D92D9B5A21_source.png?w=600')),
          SizedBox(height: 10,),
         Image(image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg')),
      ],)
    );
  }
}