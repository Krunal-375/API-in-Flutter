import 'package:flutter/material.dart';

class ListDynamic extends StatefulWidget {
  const ListDynamic({super.key});

  @override
  State<ListDynamic> createState() => _ListDynamicState();
}

class _ListDynamicState extends State<ListDynamic> {
  List<String> images = ['https://www.devgadmango.com/wp-content/uploads/2019/11/orignal-mango.png',//Mango 
  'https://m.media-amazon.com/images/W/MEDIAX_792452-T2/images/I/513SGvOptJL._AC_UF1000,1000_QL80_.jpg',//Apple
   'https://5.imimg.com/data5/SELLER/Default/2022/12/EK/NP/CN/49293026/fresh-banana-fruit.webp',//Banana
    'https://healthjade.com/wp-content/uploads/2017/10/orange-fruit.jpg',//Orange
     'https://rukminim2.flixcart.com/image/850/1000/kt0enww0/plant-seed/h/h/n/25-dg-214-paudha-original-imag6fgvre6bmd5y.jpeg?q=90'];
  List<String> titles = ['Mango', 'Apple', 'Banana', 'Orange', 'Grapes'];
  List<String> subtitles = ['This is a Mango', 'This is an Apple', 'This is a Banana', 'This is an Orange', 'This is a Grapes'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Dynamic'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(images[index]),
            title: Text(titles[index]),
            subtitle: Text(subtitles[index]),
          );
        },
      ),
    );
  }
}