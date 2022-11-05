import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ipfs_client_flutter/ipfs_client_flutter.dart';
import 'package:voting_dapp/services/services.dart';

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
      final ImagePicker picker = ImagePicker();
      XFile? image = await picker.pickImage(source: ImageSource.gallery);
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

  final int counter = 0;
  Widget display() {
    return SizedBox(
      height: 50,
      child: (_file.path == "zz")
          ? Image.asset("../images/boy.png")
          : (kIsWeb)
              ? Image.memory(webImage)
              : Image.file(_file),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                              // uploadImage();
                              await IPFSServices().uploadIpfs();
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
                            child: const Text('Overview Of Post'),
                          ),
                        ],
                      ),
                      const TextField(
                        maxLines: 8,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Type Here',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Post',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      );
    } else {
      return Column();
    }

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("Upload Image"),
    //   ),
    //   body: Column(
    //     children: [

    //       (_file.path == "zz")
    //           ? Image.asset("../images/boy.png")
    //           : (kIsWeb)
    //               ? Image.memory(webImage)
    //               : Image.file(_file),
    //       SizedBox(
    //         height: 20,
    //         width: double.infinity,
    //       ),
    //       ElevatedButton(
    //         onPressed: () => uploadImage(),
    //         child: Text("Upload"),
    //       )
    //     ],
    //   ),
    // );
  }
}
