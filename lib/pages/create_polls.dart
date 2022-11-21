import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:voting_dapp/widgets/events.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class polls extends StatefulWidget {
  const polls({super.key});

  @override
  State<polls> createState() => _pollsState();
}

class _pollsState extends State<polls> {
  File _file = File('zz');

  late Uint8List webImage;

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  final _text = TextEditingController();
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // print(_text);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(250, 120, 39, 134),
        Color.fromARGB(255, 0, 0, 0),
        Color.fromARGB(255, 4, 83, 148)
      ])),
      child: Card(
        margin: const EdgeInsets.all(10.0),
        color: Colors.transparent,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 194, 222, 245),
              width: 1,
            )),
        elevation: 8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Create Polls Here",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              height: 500,
              width: 800,
              child: Center(
                child: Container(
                  // decoration: BoxDecoration(
                  //     border: Border.all(
                  //         color: Colors.yellow,
                  //         width: 2,
                  //         style: BorderStyle.solid)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: height,
                          maxWidth: width,
                        ),
                        child: TextField(
                          controller: _text,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          minLines: 1,
                          decoration: InputDecoration(
                            fillColor: Colors.transparent,
                            filled: true,
                            hintText: "Write about your post: ",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  print(_text.text);
                },
                child: Text(
                  'Post',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
