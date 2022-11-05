import 'package:flutter/material.dart';
import 'package:voting_dapp/pages/create_post.dart';

class Drawers extends StatelessWidget {
  const Drawers({super.key});

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const Create_post(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.5, 1);
        const end = Offset.zero;
        const curve = Curves.easeOutSine;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 5,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(250, 120, 39, 134),
              Color.fromARGB(255, 4, 83, 148),
            ],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const SizedBox(
              height: 50,
              child: DrawerHeader(
                duration: Duration(milliseconds: 5000),
                curve: Curves.bounceIn,
                child: Text(
                  'Create a Voting With Us',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Image.asset('./images/image1.png'),
                title: const Text('Create SuggestionBox'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(_createRoute());
                },
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Image.asset('./images/image2.png'),
                title: const Text('Create Post'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(_createRoute());
                },
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Image.asset('./images/image3.png'),
                title: const Text('Create Polls'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(_createRoute());
                },
              ),
            ),
            Card(
              margin: const EdgeInsets.fromLTRB(3, 3, 5, 400),
              elevation: 5,
              child: ListTile(
                leading: Image.asset('./images/image3.png'),
                title: const Text('Contribute'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: const Icon(Icons.logout_sharp),
                title: const Text('LogOut'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
