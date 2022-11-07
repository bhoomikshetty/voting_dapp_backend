import 'package:voting_dapp/models/polls.dart';
import 'package:voting_dapp/models/post.dart';
import 'package:voting_dapp/models/suggestion.dart';
import 'package:flutter/material.dart';

final List<PostModel> post = [
  PostModel(
      address: "0x484x5f4v5f4",
      image_url: './images/image1.png',
      title_bar: 'This is the title',
      id: '1')
];

final List<suggestionBox> suggestion = [
  suggestionBox(
      question: 'What is your Suggestion',
      suggestions: 'My suggestion is nothing',
      id: '1')
];

final List<Polls> pollls = [Polls(questions: 'Polls please', id: '1')];

class Events extends StatelessWidget {
  const Events({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(250, 120, 39, 134),
        Color.fromARGB(255, 0, 0, 0),
        Color.fromARGB(255, 4, 83, 148)
      ])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              child: SingleChildScrollView(
            child: Column(children: [
              Column(
                  children: post.map((display) {
                return SizedBox(
                  width: 450,
                  height: 250,
                  child: Card(
                      margin: const EdgeInsets.all(5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side:
                              const BorderSide(color: Colors.black, width: 1)),
                      color: Colors.white,
                      elevation: 5,
                      child: Column(
                        children: [
                          Image.asset(display.image_url!),
                          Text(display.title_bar)
                        ],
                      )),
                );
              }).toList()),
              Column(
                  children: suggestion.map((display) {
                return Container(
                  child: Card(
                      child: Column(
                    children: [
                      Text(display.question),
                      Text(display.suggestions)
                    ],
                  )),
                );
              }).toList()),
              Column(
                  children: pollls.map((display) {
                return Container(
                  child: Card(
                      child: Column(
                    children: [Text(display.questions)],
                  )),
                );
              }).toList()),
            ]),
          )),
          const SizedBox(
            width: 300,
            height: double.infinity,
            child: Card(
                shadowColor: Color.fromARGB(255, 187, 169, 14),
                child: Text('Advertisements')),
          )
        ],
      ),
    );
  }
}
