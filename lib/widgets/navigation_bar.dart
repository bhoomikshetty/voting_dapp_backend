import 'package:flutter/material.dart';
import 'package:voting_dapp/widgets/createVote.dart';

class AppBars extends StatelessWidget {
  const AppBars({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Voting Web App',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Rometa',
              fontWeight: FontWeight.bold,
              fontSize: 45),
        ),
        OutlinedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => createVote()));
            },
            child: const Text(
              'Create Vote',
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
  }
}
