import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:voting_dapp/widgets/drawer.dart';
import 'dart:io';

List<String> arr = [];
List<String> list = <String>['Public', 'Private'];
String question = "Question1";


class createVote extends StatefulWidget {
  const createVote({Key? key}) : super(key: key);

  @override
  State<createVote> createState() => _createVoteState();
}

class _createVoteState extends State<createVote> {
  File _file = File('zz');
  late Uint8List webImage;
  uploadImage() async {    
    if  (kIsWeb) {
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
      } 
      else {
        showToast("No file selected");
      }
    } 
    else {
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
  Widget display(){
    return
        Container(height: 50,child: (_file.path == "zz")
                  ? Text('no')
                  : (kIsWeb)
                      ? Image.memory(webImage)
                      : Image.file(_file),
             );
            
      
    
  }
  
  
  final TextEditingController _titleField = TextEditingController();
  final TextEditingController _questionField = TextEditingController();
  final TextEditingController _descriptionField = TextEditingController();
  bool showEndDate = false;
  DateTime? end_date;
  DateTime? date;

  @override
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar:  AppBar(title: Text("Vote"),  toolbarHeight: 50,
            elevation: 10,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color.fromARGB(250, 120, 39, 134),
                Color.fromARGB(255, 0, 0, 0),
                Color.fromARGB(255, 4, 83, 148)
              ])),),
         
          ),
        drawer: Drawers(callback: callback: setLogin,) : null,
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 120, 39, 134),
                  Color.fromARGB(255, 0, 0, 0),
                  Color.fromARGB(255, 4, 83, 148)
                ],
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(25.0),
              margin: const EdgeInsets.all(10.0),
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
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("vOte",
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.left),
                            ],
                          ),
                          const Divider(color: Colors.white),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              print("Hi");
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(30),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color.fromARGB(255, 225, 102, 247),
                                        Color.fromARGB(0, 0, 0, 0),
                                        Color.fromARGB(255, 10, 115, 202)
                                      ],
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Create Vote",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Card(
                            margin: const EdgeInsets.all(10.0),
                            color: Colors.transparent,
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 194, 222, 245),
                                  width: 1,
                                )),
                            elevation: 8,
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(15.0),
                              // ),
                              margin: const EdgeInsets.symmetric(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // TextFormField(
                                        //   controller: _title,
                                        //   decoration: const InputDecoration(
                                        //       border: OutlineInputBorder()),
                                        // ),
                                        // const Text(
                                        //   "Title",
                                        //   style: TextStyle(
                                        //     color: Colors.white,
                                        //     fontSize: 18.0,
                                        //   ),
                                        // ),
                                        const Text(
                                          "Title",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        ConstrainedBox(
                                          constraints: BoxConstraints(
                                            maxHeight: height,
                                            maxWidth: 700,
                                          ),
                                          child: TextFormField(
                                            controller: _titleField,
                                            keyboardType:
                                                TextInputType.multiline,
                                            maxLines: null,
                                            minLines: 1,
                                            decoration: const InputDecoration(
                                              fillColor: Colors.transparent,
                                              filled: true,
                                              hintText: "Title: ",
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),

                                        // SizedBox(
                                        //   width: 600,
                                        //   child: TextFormField(
                                        //     style: const TextStyle(color: Colors.white),
                                        //     controller: _titleField,
                                        //     decoration: const InputDecoration(
                                        //       hintStyle: TextStyle(color: Colors.white),
                                        //       labelText: "Title",
                                        //       labelStyle: TextStyle(
                                        //         color: Colors.white,
                                        //       ),
                                        //     ),
                                        //   ),
                                        // ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Card(
                                                margin:
                                                    const EdgeInsets.all(10.0),
                                                color: Colors.transparent,
                                                shape: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    borderSide:
                                                        const BorderSide(
                                                      color: Color.fromARGB(
                                                          255, 194, 222, 245),
                                                      width: 1,
                                                    )),
                                                elevation: 8,
                                                child: 
                                                TextButton(
                                                    onPressed: () {
                                                      uploadImage();
                                                    },
                                                    child: Row(
                                                      children: const [
                                                        Icon(
                                                          Icons.photo,
                                                          color: Colors.white24,
                                                          size: 17,
                                                        ),
                                                        SizedBox(width: 5.0),
                                                        Text("Photo"),
                                                      ],
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    color: Colors.white,
                                  ),
                                  const Text(
                                    "Description",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxHeight: height,
                                      maxWidth: width,
                                    ),
                                    child: TextFormField(
                                      controller: _descriptionField,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: null,
                                      minLines: 1,
                                      decoration: const InputDecoration(
                                        fillColor: Colors.transparent,
                                        filled: true,
                                        hintText: "Description: ",
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: 1000,
                                  //   child: TextFormField(
                                  //     style: const TextStyle(color: Colors.white),
                                  //     controller: _descriptionField,
                                  //     decoration: const InputDecoration(
                                  //       hintStyle: TextStyle(color: Colors.white),
                                  //       labelText: "Description",
                                  //       labelStyle: TextStyle(
                                  //         color: Colors.white,
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  const Divider(color: Colors.white),
                                  Container(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                height: 38,
                                                child: Card(
                                                  color: Colors.transparent,
                                                  shape: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: Color.fromARGB(
                                                            255, 194, 222, 245),
                                                        width: 1,
                                                      )),
                                                  elevation: 8,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      const Icon(
                                                        Icons.man,
                                                        color: Colors.white24,
                                                      ),
                                                      TextButton(
                                                        onPressed: () {},
                                                        child: DropdownButton<
                                                            String>(
                                                          value: dropdownValue,
                                                          icon: const Icon(Icons
                                                              .arrow_drop_down_outlined),
                                                          elevation: 16,
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .blue),
                                                          underline: Container(
                                                            color: Colors.blue,
                                                          ),
                                                          onChanged:
                                                              (String? value) {
                                                            setState(() {
                                                              dropdownValue =
                                                                  value!;
                                                            });
                                                          },
                                                          items: list.map<
                                                              DropdownMenuItem<
                                                                  String>>((String
                                                              value) {
                                                            return DropdownMenuItem<
                                                                String>(
                                                              value: value,
                                                              child:
                                                                  Text(value),
                                                            );
                                                          }).toList(),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),

                                              const SizedBox(
                                                width: 10.0,
                                              ),
                                              // TextButton(onPressed: (){}, child: Text("Voting end time")),
                                              Column(
                                                children: [
                                                  Container(
                                                    child: Row(
                                                      children: [
                                                        ElevatedButton(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: const [
                                                              Icon(Icons
                                                                  .calendar_month),
                                                              Text(
                                                                  'Voting end time'),
                                                            ],
                                                          ),
                                                          onPressed: () async {
                                                            setState(() async {
                                                              showEndDate =
                                                                  true;
                                                              end_date =
                                                                  await pickDate(
                                                                      context);
                                                            });
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  // Text(
                                                  //   showEndDate != false
                                                  //       ? DateFormat("MMM ,dd , yyyy")
                                                  //           .format(end_date!)
                                                  //           .toString()
                                                  //       : "",
                                                  //   style: const TextStyle(fontWeight: FontWeight.bold),
                                                  // ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          // Container(
                          //     child: StreamBuilder<QuerySnapshot>(
                          //   stream: questionStream!.snapshots(),
                          //   builder: (context, AsyncSnapshot snapshot) {
                          //     if (snapshot.connectionState == ConnectionState.waiting) {
                          //       return const CircularProgressIndicator();
                          //     }
                          //     if (snapshot.data == null) {
                          //       return Container();
                          //     }
                          //     var doc = snapshot.data.docs;
                          //     return SizedBox(
                          //       width: 400,
                          //       height: 500,
                          //       child: ListView.builder(
                          //           itemCount: doc.length,
                          //           itemBuilder: (BuildContext context, int index) {
                          //             bool check = false;
                          //             return const CheckBoxx();
                          //           }),
                          //     );
                          //   },
                          // )),
                          Card(
                            margin: const EdgeInsets.all(10.0),
                            color: Colors.transparent,
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 194, 222, 245),
                                  width: 1,
                                )),
                            elevation: 8,
                            child: Container(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Question",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.delete),
                                        iconSize: 22.0,
                                        color: Colors.white10,
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                  RadioListTile(
                                    title: const Text("Question 1"),
                                    value: "a",
                                    groupValue: question,
                                    onChanged: (value) {
                                      setState(() {
                                        question = value.toString();
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 1000,
                                    child: TextFormField(
                                      style:
                                          const TextStyle(color: Colors.white),
                                      controller: _questionField,
                                      decoration: const InputDecoration(
                                        hintStyle:
                                            TextStyle(color: Colors.white),
                                        labelText: "Add Question",
                                        labelStyle: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // RadioListTile(
                          //   title: const Text("Question 2"),
                          //   value: "b",
                          //   groupValue: question,
                          //   onChanged: (value) {
                          //     setState(() {
                          //       question = value.toString();
                          //     });
                          //   },
                          // ),

                          const SizedBox(height: 10.0),
                          Card(
                            margin: const EdgeInsets.all(10.0),
                            color: Colors.blue,
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 194, 222, 245),
                                  width: 1,
                                )),
                            elevation: 8,
                            child: Container(
                              height: 20,
                              width: 200.0,
                              margin: const EdgeInsets.all(10.0),
                              child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Create",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // ),
            )));
            
  }
  

  Future pickDate(BuildContext context) async {
    final intialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: intialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return;

    setState(() {
      date = newDate;
    });
    return newDate;
  }

  
}

class CheckBoxx extends StatefulWidget {
  final String doc;
  final String id;

  const CheckBoxx(this.doc, this.id, {Key? key}) : super(key: key);

  @override
  State<CheckBoxx> createState() => _CheckBoxxState();
}

class _CheckBoxxState extends State<CheckBoxx> {
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
            // bool selected=false;
            value: check,
            title: Text(widget.doc),
            onChanged: (bool? selected) async {
              setState(() {
                check = selected!;
              });
              if (selected == true) arr.add(widget.id);
              print(arr);
              if (selected == false) arr.remove(widget.id);
              print(arr);
            }),
      ],
    );
  }
}
