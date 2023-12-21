import 'package:flutter/material.dart';

class ListDemo extends StatefulWidget {
  const ListDemo({super.key});

  @override
  State<ListDemo> createState() => _ListDemoState();
}

class _ListDemoState extends State<ListDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Demo'),
      ),//want to learn about List
      body: ListView(
        children: [
          //List of animals like tiger,lion,elephant use internet to get images
          ListTile(
            leading: Image.network('https://files.worldwildlife.org/wwfcmsprod/images/Tiger_resting_Bandhavgarh_National_Park_India/hero_small/6aofsvaglm_Medium_WW226365.jpg'),
            title: const Text('Tiger'),
            subtitle: const Text('Tiger is a wild animal'),
          ),
          ListTile(
            leading: Image.network('https://cdn.britannica.com/55/2155-050-604F5A4A/lion.jpg'),
            title: const Text('Lion'),
            subtitle: const Text('Lion is a wild animal'),
          ),
          ListTile(
            leading: Image.network('https://static.theprint.in/wp-content/uploads/2023/02/ANI-20230224121559.jpg'),
            title: const Text('Elephant'),
            subtitle: const Text('Elephant is a wild animal'),
          ),
          

        ],
      )
    );
  }
}