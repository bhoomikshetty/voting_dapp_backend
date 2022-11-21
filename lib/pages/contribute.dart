import 'dart:io';
import 'package:flutter/material.dart';
import 'package:voting_dapp/widgets/drawer.dart';
import 'package:voting_dapp/widgets/navigation_bar.dart';
import 'package:voting_dapp/widgets/post.dart';
import 'package:image_picker/image_picker.dart';

class contribute extends StatefulWidget {
  const contribute({super.key});

  @override
  State<contribute> createState() => _contributeState();
}

class _contributeState extends State<contribute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      drawer: const Drawers(),
      body: Container(
        decoration: const BoxDecoration(
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
          elevation: 15,
          child: ListView(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    "Feed",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.orange,
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Post()),
                            );
                          },
                          child: Text("Create Post")),
                      ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  _buildPopupDialog(context),
                            );
                          },
                          child: Text("Suggestion")),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  Widget _buildPopupDialog(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String dropdownValue = list.first;
    return AlertDialog(
      elevation: 30.0,
      backgroundColor: Colors.white,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 1,
          )),
      content: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(250, 120, 39, 134),
          Color.fromARGB(255, 0, 0, 0),
          Color.fromARGB(255, 4, 83, 148)
        ])),
        child: Card(
          color: Colors.transparent,
          margin: const EdgeInsets.all(10.0),
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 1,
              )),
          elevation: 8,
          child: Builder(
            builder: (context) {
              var height = MediaQuery.of(context).size.height;
              var width = MediaQuery.of(context).size.width;

              return SizedBox(
                height: height - 400,
                width: width - 1000,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Suggestions",
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 25,
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(Icons.close)),
                        ],
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      //public or private
                      SizedBox(
                        height: 38,
                        width: 200.0,
                        child: Card(
                          color: Colors.transparent,
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 194, 222, 245),
                                width: 1,
                              )),
                          elevation: 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.man,
                                color: Colors.black,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: DropdownButton<String>(
                                  value: dropdownValue,
                                  icon: const Icon(
                                      Icons.arrow_drop_down_outlined),
                                  elevation: 16,
                                  style: const TextStyle(color: Colors.blue),
                                  underline: Container(
                                    color: Colors.blue,
                                  ),
                                  onChanged: (String? value) {
                                    // setState(() {
                                    //   dropdownValue = value!;
                                    // });
                                  },
                                  items: list.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: height,
                          maxWidth: width,
                        ),
                        child: const TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          minLines: 1,
                          decoration: InputDecoration(
                            fillColor: Colors.transparent,
                            filled: true,
                            hintText: "Drop your suggestions here: ",
                            border: InputBorder.none,
                          ),
                        ),
                      ),

                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                _getFromGallery();
                              },
                              child: Text("Pick Photo"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => contribute()),
                                );
                              },
                              child: Text("Create Polls"),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Post")),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
