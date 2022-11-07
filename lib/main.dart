import 'package:flutter/material.dart';
import 'package:voting_dapp/loginPage.dart';
import './models/polls.dart';
import './models/post.dart';
import './models/suggestion.dart';
import 'widgets/drawer.dart';
import './widgets/events.dart';
import './widgets/navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const AppBars(),
              toolbarHeight: 80,
              elevation: 5,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color.fromARGB(250, 120, 39, 134),
                  Color.fromARGB(255, 0, 0, 0),
                  Color.fromARGB(255, 4, 83, 148)
                ])),
              ),
            ),
            // drawer: const Drawers(),
            body: LoginPage(),),);
  }
}
