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

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool check = false;
  setLogin(String? address) {
    if (address != null) {
      setState(() {
        check = true;
      });
    }
  }

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
            drawer: check ? Drawers() : null,
            body: check
                ? Events()
                : LoginPage(
                    callback: setLogin,
                  )));
  }
}
