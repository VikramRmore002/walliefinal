import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:walliefinal/custom_class/contact.dart';
import 'preference.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'preference.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContactName extends StatefulWidget {
  final String phoneNumber;
  ContactName({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<ContactName> createState() => _ContactNameState(phoneNumber);
}

class _ContactNameState extends State<ContactName> {
  late DateTime pickedDate;
  //final DatabaseReference _databaseReference = FirebaseDatabase.instance.reference().child("Users");
  final CollectionReference<Map<String, dynamic>> _firebaseFirestore =
      FirebaseFirestore.instance.collection("users");

  String _firstName = "";
  String _lastName = "";
  String _email = "";
   late String _dateofbirth ;
  String _phoneNumber = "";
  List _tops = [];
  List _bottoms = [];
  saveContact(BuildContext context) async {
    if (_firstName.isNotEmpty &&
        _lastName.isNotEmpty &&
        _email.isNotEmpty &&
        _dateofbirth.isNotEmpty) {
      setState(() {
        _phoneNumber = phoneNumber;

      });
      Contact contact = Contact(_firstName, _lastName, _email, _dateofbirth,
          phoneNumber, _bottoms, _tops);
      await _firebaseFirestore.doc(_phoneNumber).set(contact.toJson());
      //  await _databaseReference.child(_phoneNumber).set(contact.toJson());
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>  Preference(
                    firstName: _firstName,
                    lastName: _lastName,
                    email: _email,
                    dateofbirth: _dateofbirth,
                    phoneNumber : _phoneNumber,
                    tops : _tops,
                   bottoms : _bottoms
                  )));
      // TODO:Add navigate
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text(
                "field required",
                style: TextStyle(
                  fontFamily: "walle",
                ),
              ),
              content: const Text(" all fields are required",
                  style: TextStyle(
                    fontFamily: "walle",
                  )),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("close",
                        style: TextStyle(
                          fontFamily: "walle",
                        )))
              ],
            );
          });
    }
  }

  final String phoneNumber;
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController email = TextEditingController();
  // final TextEditingController dob = TextEditingController();
  late String value;
  _ContactNameState(this.phoneNumber);
  @override
  void initState() {
    super.initState();

    pickedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Card(
        child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.white, width: 5.0),
                image: const DecorationImage(
                    image: AssetImage("assets/home.png"), fit: BoxFit.fill)),
            padding: const EdgeInsets.only(top: 20.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              const Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back_sharp)),
                  const Padding(padding: EdgeInsets.only(right: 60)),
                  const Text(
                    "Create a Account",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "walle",
                        fontSize: 22.0,
                        height: 1.4,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 40)),
              const Text(
                "Customer About",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "walle",
                    fontSize: 20.0,
                    height: 1.4,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        style: const TextStyle(
                          fontFamily: "walle",
                        ),
                        controller: firstname,
                        onChanged: (value) {
                          setState(() {
                            _firstName = firstname.text;
                          });
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.black54,
                          ),
                          labelText: "FirstName",
                          labelStyle: const TextStyle(
                            fontFamily: "walle",
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Your FirstName';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: lastname,
                        style: const TextStyle(
                          fontFamily: "walle",
                        ),
                        onChanged: (value) {
                          setState(() {
                            _lastName = lastname.text;
                          });
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.black54,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          labelText: " LastName",
                          labelStyle: const TextStyle(
                            fontFamily: "walle",
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Your LastName';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: email,
                        style: const TextStyle(
                          fontFamily: "walle",
                        ),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          setState(() {
                            _email = email.text;
                          });
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Colors.black54,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          labelText: "Email",
                          labelStyle: const TextStyle(
                            fontFamily: "walle",
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value!.isEmpty) {
                            return '  Enter Your Email';
                          } else if (!value.contains('@')) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(10.0),
                    //   child: TextFormField(
                    //     controller: dob,
                    //     style: const TextStyle(
                    //       fontFamily: "walle",
                    //     ),
                    //     keyboardType: TextInputType.number,
                    //     onChanged: (value) {
                    //       setState(() {
                    //         _dateofbirth = dob.text;
                    //       });
                    //     },
                    //     decoration: InputDecoration(
                    //       fillColor: Colors.white,
                    //       filled: true,
                    //       prefixIcon: const Icon(
                    //         Icons.cake,
                    //         color: Colors.black54,
                    //       ),
                    //       //suffixIcon: IconButton(onPressed: () { _pickDate(); }, icon: Icon(Icons.date_range),),
                    //       labelText: "Date_Of_Birth ",
                    //       labelStyle: const TextStyle(
                    //         fontFamily: "walle",
                    //       ),
                    //       // hintText:("${pickedDate.day.toString()}/${pickedDate.month.toString()}/${pickedDate.year.toString()}"),
                    //       enabledBorder: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(10.0),
                    //       ),
                    //     ),
                    //     // The validator receives the text that the user has entered.
                    //     validator: (value) {
                    //       if (value!.isEmpty) {
                    //         return 'Enter Date_Of_Birth';
                    //       }
                    //       return null;
                    //     },
                    //   ),
                    // ),
                    Padding(padding: EdgeInsets.only(top: 10),),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 60,
                          child: ListTile(
                            leading: Icon(Icons.cake),
                            title:  Text(_dateofbirth),
                            trailing: IconButton(
                              onPressed: getDatePicker,
                              icon: Icon( Icons.date_range,size: 30,),
                            ),
                          ),
                          //color: Colors.white

                      ),
                    ),

                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 30)),
              ElevatedButton(
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(200, 50)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black87)
                    // : MaterialStateProperty.all<Color>(Colors.grey.shade300)),
                    ),
                child: const Text(
                  "CONTINUE",
                  style: TextStyle(
                    fontFamily: "walle",
                  ),
                ),
                onPressed: () {
                  saveContact(context);
                },
              ),
              const Padding(padding: EdgeInsets.only(top: 50)),
              Container(
                  height: 60,
                  width: 150,
                  child: const Image(
                      image: AssetImage("assets/images/wallie_logo.png"))),
            ])),
      ),
    );
  }


   // bool isselected = false;
   // bool clickagain = false ;

  getDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 60),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        pickedDate = value;
        // isselected = true;
        // clickagain = true;
        _dateofbirth = DateFormat.yMMMMd().format(pickedDate);
      });
      print(_dateofbirth);
      // if( clickagain){
      //   setState(() {
      //     isselected = false;
      //     clickagain = false;
      //   });
      // }
    });
  }
}
