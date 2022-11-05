import 'package:flutter/material.dart';
import 'package:voting_dapp/constants/colors.dart';
import 'package:voting_dapp/constants/mediaquery_constants.dart';

class PollDisplayScreen extends StatefulWidget {
  const PollDisplayScreen({Key? key}) : super(key: key);

  @override
  State<PollDisplayScreen> createState() => _PollDisplayScreenState();
}

class _PollDisplayScreenState extends State<PollDisplayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyColor,
      appBar: AppBar(), // custom appbar widget.
      body: Container(
        color: greyColor,
        margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
        height: heightFunc(context),
        child: Column(children: [
          Container(
            height: 0.1 * heightFunc(context),
            width: widthFunc(context),
            child: FittedBox(
                fit: BoxFit.fill,
                child: Image.asset('assets/images/banner_poll_screen.jpg')),
          ),
          SizedBox(height: 16.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: blueColor.withOpacity(0.5),
                      blurRadius: 2000,
                      spreadRadius: 0.01,
                      offset: Offset(0, 5))
                ],
                color: searchBarBackColor,
                borderRadius: BorderRadius.circular(20.0)),
            child: Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.all(16.0),
                    width: 0.5 * widthFunc(context),
                    child: TextFormField(
                        decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ))),
                Text(
                  'Category',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 2.0,
                children: [
                  Container(
                    decoration: BoxDecoration(boxShadow: []),
                    child: Text('Organization'),
                  )
                ]),
          )
        ]),
      ),
    );
  }
}
