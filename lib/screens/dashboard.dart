
import 'package:flutter/material.dart';
import 'package:flutter_application_4/screens/cat_fact.dart';
import 'package:flutter_application_4/screens/dog_image_finder.dart';
import 'package:flutter_application_4/screens/gender_finder.dart';
import 'package:flutter_application_4/screens/nationality_finder.dart';
import 'package:flutter_application_4/screens/random_activity.dart';
class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  late double width;
  late double height;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.black26,
      ),
      body: Container(
        color: Colors.black12, 
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          InkWell(
              onTap: () {
                
                //log( 'Width: $width, Height: $height');
                //print('Width: $width, Height: $height');
                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CatFactPage()));
              },
               child: Container(
                width: width * 0.6,
                height: height * 0.1,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Colors.amber),
                child: const Center(
                  child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Cat FACTS'),
                )),
                       ),
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  shadowColor: Colors.black87,
                  minimumSize: Size(width * 0.6, height * 0.1),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                  ),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RandomActivityScreen()));
                }, child: const Text('Random Activity')),
              const SizedBox(height: 20,),
                OutlinedButton(
  style: OutlinedButton.styleFrom(
  backgroundColor: Colors.amber,
  minimumSize: Size(width*0.6, height*0.1),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
),
  onPressed: () {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NationalityFinderScreen()));
   },
  child: const Text('Nationality Finder'),
),
              const SizedBox(height: 20,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  shadowColor: Colors.black87,
                  minimumSize: Size(width * 0.6, height * 0.1),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                  ),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const GenderFinderScreen()));
                }, child: const Text('Gender Finder')),
              const SizedBox(height: 20,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  shadowColor: Colors.black87,
                  minimumSize: Size(width * 0.6, height * 0.1),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                  ),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DogImageFinder()));
                }, child: const Text('Dog Image Finder')),
              const SizedBox(height: 20,),
              

          ],),
      )
    );
  }
}