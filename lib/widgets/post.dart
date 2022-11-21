import 'dart:typed_data';

import 'package:flutter/foundation.dart' show kIsWeb;

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:voting_dapp/main.dart';
import 'package:voting_dapp/widgets/events.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  File _file = File('zz');

  late Uint8List webImage;

  uploadImage() async {
    if (kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var f = await image.readAsBytes();
        setState(() {
          _file = File("c");
          webImage = f;
          print(kIsWeb);
          print(_file);
          print(f);
        });
      } else {
        showToast("No file selected");
      }
    } else {
      showToast("Permission not granted");
    }
  }

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

  int counter = 0;
  Widget display() {
    return Container(
      height: 50,
      child: (_file.path == "zz")
          ? Text('no')
          : (kIsWeb)
              ? Image.memory(webImage)
              : Image.file(_file),
    );
  }

  @override
  final _text = TextEditingController();
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // print(_text);
    if (counter == 0) {
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
                "Create Post Here",
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  uploadImage();
                                },
                                // elevation: 5,
                                child: Text(
                                  'Upload Image',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                )),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  display();
                                  counter = 1;
                                });
                              },
                              child: Text('Overview Of Post'),
                            )
                          ],
                        ),
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
                        // TextField(
                        //   maxLines: 8,
                        //   style: TextStyle(color: Colors.white),

                        //   decoration: InputDecoration(
                        //     labelText: 'Type Here',
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                    );
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
    } else {
      return Container(
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(250, 120, 39, 134),
          Color.fromARGB(255, 0, 0, 0),
          Color.fromARGB(255, 4, 83, 148)
        ])),
        child: Column(
          children: [
            (_file.path == "zz")
                ? Text('No')
                : (kIsWeb)
                    ? Image.memory(
                        webImage,
                        width: 500,
                      )
                    : Image.file(
                        _file,
                        width: 500,
                      ),
            SizedBox(
              height: 20,
              width: double.infinity,
            ),
            Container(
                child: Card(
              child: Text(
                _text.text,
                style: TextStyle(color: Colors.black),
              ),
            )),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                  );
                },
                child: Text(
                  'Post',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      );
    }
  }
}
