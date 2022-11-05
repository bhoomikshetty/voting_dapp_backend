import 'package:flutter/material.dart';

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
            onPressed: () {},
            child: const Text(
              'Create Vote',
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
  }
}
