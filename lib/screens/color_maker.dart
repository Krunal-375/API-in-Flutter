import 'dart:math';
import 'package:flutter/material.dart';

class ColorMaker extends StatefulWidget {
  const ColorMaker({super.key});

  @override
  State<ColorMaker> createState() => _ColorMakerState();
}

class _ColorMakerState extends State<ColorMaker> {

  List<MaterialColor> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.teal,
    Colors.cyan,
    Colors.amber,
    Colors.brown,
    Colors.deepOrange,
    Colors.indigo,
    Colors.lime,
    Colors.grey,
    Colors.blueGrey,
    Colors.lightBlue,
    Colors.lightGreen,
    Colors.deepPurple,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey,
  ];

  List<String>colorNames = [
    'Red',
    'Green',
    'Blue',
    'Yellow',
    'Purple',
    'Orange',
    'Pink',
    'Teal',
    'Cyan',
    'Amber',
    'Brown',
    'Deep Orange',
    'Indigo',
    'Lime',
    'Grey',
    'Blue Grey',
    'Light Blue',
    'Light Green',
    'Deep Purple',
    'Brown',
    'Grey',
    'Blue Grey',
  ];

  var randomNum = 0,colorName='Red';

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar (
        title: const Text('Color Maker'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          InkWell(
            onTap: () {
              setState(() {
                randomNum = Random().nextInt(22);
                colorName = colorNames[randomNum];
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: colors[randomNum],
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Text(colorName,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              ) ,
            ),
          )
        ]),
      ),
    );
  }
}