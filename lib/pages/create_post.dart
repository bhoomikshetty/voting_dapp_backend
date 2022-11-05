import 'package:flutter/material.dart';
import '../widgets/post.dart';
import '../widgets/drawer.dart';
import '../widgets/navigation_bar.dart';
class Create_post extends StatelessWidget {
  const Create_post({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
          appBar:  AppBar(title: AppBars(),  toolbarHeight: 100,
            elevation: 5,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color.fromARGB(250, 120, 39, 134),
                Color.fromARGB(255, 0, 0, 0),
                Color.fromARGB(255, 4, 83, 148)
              ])),),
         
          ),
          drawer: Drawers(),
          body: Post(),
    )
    );
  }
}