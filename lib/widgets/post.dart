import 'dart:convert';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:voting_dapp/services/services.dart';
import 'package:http/http.dart' as http;
import 'package:voting_dapp/services/smartContractServices.dart';
import '../models/post.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  File _file = File('zz');

  TextEditingController titleTextEditing = TextEditingController();
  TextEditingController contentTextEditing = TextEditingController();
  String? imageUrl;

  List<int> imageBytes = [];
  String base64Image = '';
  late Uint8List webImage;
  Widget? testOutImage;
  uploadImage() async {
    if (kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var f = await image.readAsBytes();
        setState(() {
          _file = File("c");
          webImage = f;
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
    return testOutImage != null
        ? testOutImage!
        : SizedBox(
            height: 50,
            child: (_file.path == "zz")
                ? Image.asset("../images/boy.png")
                : (kIsWeb)
                    ? Image.memory(webImage)
                    : Image.file(_file),
          );
  }

  var output;
  @override
  final _text = TextEditingController();
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // print(_text);
    if (counter == 0) {
      return Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(250, 120, 39, 134),
              Color.fromARGB(255, 0, 0, 0),
              Color.fromARGB(255, 4, 83, 148),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "Create Post Here",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 500,
              width: 800,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.yellow,
                        width: 2,
                        style: BorderStyle.solid),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              XFile? image = await ImagePicker()
                                  .pickImage(source: ImageSource.gallery);
                              if (image != null) {
                                imageBytes = await image.readAsBytes();
                                base64Image = base64.encode(imageBytes);
                                http.Response out = await IPFSServices()
                                    .createAlbum(json.encode(base64Image));
                                setState(() {
                                  imageUrl = json.decode(out.body);
                                });
                              }
                            },
                            child: const Text(
                              'Upload Image',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                setState(
                                  () {
                                    display();
                                  },
                                );
                                display();
                              },
                              child: Text("Overview")),
                        ],
                      ),
                      TextFormField(
                        controller: contentTextEditing,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Type Here',
                        ),
                        // TextField(
                        //   maxLines: 8,
                        //   style: TextStyle(color: Colors.white),

                        //   decoration: InputDecoration(
                        //     labelText: 'Type Here',
                        //   ),
                        // )
                      )
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
                onPressed: () async {
                  // PostModel(
                  //         address: '0x00235sd5cs6',
                  //         id: DateTime.now().microsecondsSinceEpoch.toString(),
                  //         title_bar: titleTextEditing.text,
                  //         image_url: imageUrl,
                  //         text: contentTextEditing.text)
                  //     .getMap();
                  var out = await EthereumUtils().getQuote();
                  print(out);
                },
                child: const Text(
                  'Post',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      );
    }
  }
}
