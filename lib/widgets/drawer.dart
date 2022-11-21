import 'dart:io';
import 'package:flutter/material.dart';
import 'package:voting_dapp/loginPage.dart';
import 'package:voting_dapp/pages/contribute.dart';
import 'package:voting_dapp/pages/create_polls.dart';
import 'package:voting_dapp/pages/create_post.dart';
import 'package:image_picker/image_picker.dart';

List<String> list = <String>['Public', 'Private'];

class Drawers extends StatefulWidget {
  Function? callback;
  Drawers({super.key, this.callback});

  @override
  State<Drawers> createState() => _DrawersState();
}

File? imageFile;

class _DrawersState extends State<Drawers> {
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
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildPopupDialog(context),
                  );
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => polls()),
                  );
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => contribute()),
                  );
                },
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: const Icon(Icons.logout_sharp),
                title: const Text('LogOut'),
                onTap: () {
                  widget.callback(null);
                  // Navigator.pop(context);
                },
              ),
            )
          ],
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
