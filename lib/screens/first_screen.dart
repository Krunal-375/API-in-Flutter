
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.brown[800],
         title: const Text('Bird Info', style: TextStyle(color: Colors.white),),
         centerTitle: true,
       ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Image(image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg')),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 0, height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Owl', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                const SizedBox(width: 10,),
                IconButton(onPressed:  () {
                  //using log here
                  //print('Owl is clicked');
                  debugPrint('Debug Owl is clicked');
                }, icon: const Icon(Icons.favorite, color: Colors.red, size: 30,)),
              ],
            ),
            const SizedBox(width: 0, height: 10,),
            const Text('Owls are birds from the order Strigiformes, which includes over 200 species of mostly solitary and nocturnal birds of prey typified by an upright stance, a large, broad head, binocular vision, binaural hearing, sharp talons, and feathers adapted for silent flight.',
             style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400,fontStyle: FontStyle.italic)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
