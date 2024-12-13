import 'package:flutter/material.dart';
import 'package:prueba2/main.dart';
import 'package:prueba2/screens/pelis.dart';
import 'package:prueba2/screens/rating.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
    child: ListView(
      children: [
        ListTile(
        title: const Text("Pelis"),
        onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>const Pelis())),
      ),
        ListTile(
        title: const Text("Review"),
        onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> RatingScreen())),
      )
      ],
    ),
  );
  }
}
