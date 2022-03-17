import 'dart:core';
import 'walliehomepage.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:walliefinal/custom_class/contact.dart';
import 'package:walliefinal/screens/walliehomepage.dart';

class Preference extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String dateofbirth;
  final String phoneNumber;
  final List tops;
  final List bottoms;
  const Preference({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.dateofbirth,
    required this.tops,
    required this.bottoms,
  }) : super(key: key);

  @override
  _PreferenceState createState() => _PreferenceState(
      phoneNumber, firstName, lastName, email, dateofbirth, tops, bottoms);
}

class _PreferenceState extends State<Preference> {
  bool colorsS   = true; //for change color of bottons
  bool colorsM   = true; //for change color of bottons
  bool colorsL   = true; //for change color of bottons
  bool colorsXL  = true; //for change color of bottons
  bool colorsXXL = true; //for change color of bottons
  bool colors26  = true; //for change color of bottons
  bool colors28  = true; //for change color of bottons
  bool colors30  = true; //for change color of bottons
  bool colors32  = true; //for change color of bottons
  bool colors34  = true; //for change color of bottons
  bool colors36  = true; //for change color of bottons
  bool colors38  = true; //for change color of bottons
  bool colors40  = true; //for change color of bottons
  bool colors42  = true; //for change color of bottons
  bool colors44  = true; //for change color of bottons
  String phoneNumber;
  String firstName;
  String lastName;
  String email;
  String dateofbirth;
  List tops;
  List bottoms;

  _PreferenceState(this.phoneNumber, this.firstName, this.lastName, this.email,
      this.dateofbirth, this.tops, this.bottoms);

  colorChange1() {
    colorsS
        ? setState(() {
            colorsS = false;
            sizeS = "S";
          })
        : setState(() {
            colorsS = true;
            sizeS = "";
          });
  }

  colorChange2() {
    colorsM
        ? setState(() {
            colorsM = false;
            sizeM = "M";
          })
        : setState(() {
            colorsM = true;
            sizeM = "";
          });
  }

  colorChange3() {
    colorsL
        ? setState(() {
            colorsL = false;
            sizeL = "L";
          })
        : setState(() {
            colorsL = true;
            sizeL = "";
          });
  }

  colorChange4() {
    colorsXL
        ? setState(() {
            colorsXL = false;
            sizeXL = "XL";
          })
        : setState(() {
            colorsXL = true;
            sizeXL = "";
          });
  }

  colorChange5() {
    colorsXXL
        ? setState(() {
            colorsXXL = false;
            sizeXXL = "XXL";
          })
        : setState(() {
            colorsXXL = true;
            sizeXXL = "";
          });
  }

  colorChange26() {
    colors26
        ? setState(() {
            colors26 = false;
            bottom26 = "26";
          })
        : setState(() {
            colors26 = true;
            bottom26 = "";
          });
  }

  colorChange28() {
    colors28
        ? setState(() {
            colors28 = false;
            bottom28 = "28";
          })
        : setState(() {
            colors28 = true;
            bottom28 = "";
          });
  }

  colorChange30() {
    colors30
        ? setState(() {
            colors30 = false;
            bottom30 = "30";
          })
        : setState(() {
            colors30 = true;
            bottom30 = "";
          });
  }

  colorChange32() {
    colors32
        ? setState(() {
            colors32 = false;
            bottom32 = "32";
          })
        : setState(() {
            colors32 = true;
            bottom32 = "";
          });
  }

  colorChange34() {
    colors34
        ? setState(() {
            colors34 = false;
            bottom34 = "34";
          })
        : setState(() {
            colors34 = true;
            bottom34 = "";
          });
  }

  colorChange36() {
    colors36
        ? setState(() {
            colors36 = false;
            bottom36 = "36";
          })
        : setState(() {
            colors36 = true;
            bottom36 = "";
          });
  }

  colorChange38() {
    colors38
        ? setState(() {
            colors38 = false;
            bottom38 = "38";
          })
        : setState(() {
            colors38 = true;
            bottom38 = "";
          });
  }

  colorChange40() {
    colors40
        ? setState(() {
            colors40 = false;
            bottom40 = "40";
          })
        : setState(() {
            colors40 = true;
            bottom40 = "";
          });
  }

  colorChange42() {
    colors42
        ? setState(() {
            colors42 = false;
            bottom42 = "42";
          })
        : setState(() {
            colors42 = true;
            bottom42 = "";
          });
  }

  colorChange44() {
    colors44
        ? setState(() {
            colors44 = false;
            bottom44 = "44";
          })
        : setState(() {
            colors44 = true;
            bottom44 = "";
          });
  }

  String sizeS = "";
  String sizeM = "";
  String sizeL = "";
  String sizeXL = "";
  String sizeXXL = "";
  String bottom26 = "";
  String bottom28 = "";
  String bottom30 = "";
  String bottom32 = "";
  String bottom34 = "";
  String bottom36 = "";
  String bottom38 = "";
  String bottom40 = "";
  String bottom42 = "";
  String bottom44 = "";
  Map<String, dynamic> updatedata() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "dateOfBirth": dateofbirth,
      "phoneNumber": phoneNumber,
      "tops": [sizeS, sizeL, sizeM, sizeXL, sizeXXL],
      "bottoms": [
        bottom26,
        bottom28,
        bottom30,
        bottom32,
        bottom34,
        bottom36,
        bottom38,
        bottom40,
        bottom42,
        bottom44
      ]
    };
  }

  final CollectionReference<Map<String, dynamic>> _firebaseFirestore =
      FirebaseFirestore.instance.collection("users");
  UpdateUser(BuildContext context) async {
    await _firebaseFirestore.doc(phoneNumber).update(updatedata());
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  _signOut() async {
    _firebaseAuth.signOut();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Card(
        child: Container(
            // color: Colors.white,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(color: Colors.black54, width: 3.0),
            ),
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
                ],
              ),
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
              const Padding(padding: EdgeInsets.only(top: 60)),
              const Text(
                "Set your Preferences",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "walle",
                    fontSize: 30.0,
                    height: 1.4,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const Text(
                "Set your ideal sizes for shopping!",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "walle",
                    fontSize: 14.0,
                    height: 1.4,
                    fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              Container(
                padding: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(color: Colors.grey.shade300),
                width: 308,
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "TOPS",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "walle",
                          fontSize: 14.0,
                          height: 1.4,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            child: _circleButton(
                                "S",
                                25,
                                colorsS ? Colors.black : Colors.white,
                                colorsS ? Colors.white : Colors.black),
                            onTap: () => colorChange1(),
                          ),
                          const SizedBox(
                            width: 9,
                          ),
                          GestureDetector(
                            child: _circleButton(
                                "M",
                                25,
                                colorsM ? Colors.black : Colors.white,
                                colorsM ? Colors.white : Colors.black),
                            onTap: () => colorChange2(),
                          ),
                          const SizedBox(
                            width: 9,
                          ),
                          GestureDetector(
                            child: _circleButton(
                                "L",
                                25,
                                colorsL ? Colors.black : Colors.white,
                                colorsL ? Colors.white : Colors.black),
                            onTap: () => colorChange3(),
                          ),
                          const SizedBox(
                            width: 9,
                          ),
                          GestureDetector(
                            child: _circleButton(
                                "XL",
                                25,
                                colorsXL ? Colors.black : Colors.white,
                                colorsXL ? Colors.white : Colors.black),
                            onTap: () => colorChange4(),
                          ),
                          const SizedBox(
                            width: 9,
                          ),
                          GestureDetector(
                            child: _circleButton(
                                "XXL",
                                25,
                                colorsXXL ? Colors.black : Colors.white,
                                colorsXXL ? Colors.white : Colors.black),
                            onTap: () => colorChange5(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              Container(
                padding: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(color: Colors.grey.shade300),
                width: 308,
                height: 170,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "BOTTOMS",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "walle",
                          fontSize: 14.0,
                          height: 1.4,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                      child: Row(
                        children: [
                          GestureDetector(
                            child: _circleButton(
                                "26",
                                20,
                                colors26 ? Colors.black : Colors.white,
                                colors26 ? Colors.white : Colors.black),
                            onTap: () => colorChange26(),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          GestureDetector(
                            child: _circleButton(
                                "28",
                                20,
                                colors28 ? Colors.black : Colors.white,
                                colors28 ? Colors.white : Colors.black),
                            onTap: () => colorChange28(),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          GestureDetector(
                            child: _circleButton(
                                "30",
                                20,
                                colors30 ? Colors.black : Colors.white,
                                colors30 ? Colors.white : Colors.black),
                            onTap: () => colorChange30(),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          GestureDetector(
                            child: _circleButton(
                                "32",
                                20,
                                colors32 ? Colors.black : Colors.white,
                                colors32 ? Colors.white : Colors.black),
                            onTap: () => colorChange32(),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          GestureDetector(
                            child: _circleButton(
                                "34",
                                20,
                                colors34 ? Colors.black : Colors.white,
                                colors34 ? Colors.white : Colors.black),
                            onTap: () => colorChange34(),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                        child: Row(children: [
                          GestureDetector(
                            child: _circleButton(
                                "36",
                                20,
                                colors36 ? Colors.black : Colors.white,
                                colors36 ? Colors.white : Colors.black),
                            onTap: () => colorChange36(),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          GestureDetector(
                            child: _circleButton(
                                "38",
                                20,
                                colors38 ? Colors.black : Colors.white,
                                colors38 ? Colors.white : Colors.black),
                            onTap: () => colorChange38(),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          GestureDetector(
                            child: _circleButton(
                                "40",
                                20,
                                colors40 ? Colors.black : Colors.white,
                                colors40 ? Colors.white : Colors.black),
                            onTap: () => colorChange40(),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          GestureDetector(
                            child: _circleButton(
                                "42",
                                20,
                                colors42 ? Colors.black : Colors.white,
                                colors42 ? Colors.white : Colors.black),
                            onTap: () => colorChange42(),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          GestureDetector(
                            child: _circleButton(
                                "44",
                                20,
                                colors44 ? Colors.black : Colors.white,
                                colors44 ? Colors.white : Colors.black),
                            onTap: () => colorChange44(),
                          ),
                        ])),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              Container(
                width: 308,
                padding: EdgeInsets.only(top: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.white70),
                            minimumSize:
                                MaterialStateProperty.all(const Size(130, 40)),
                          ),
                          child: const Text(
                            "SKIP",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: "walle",
                            ),
                          ),
                          onPressed: () {
                            Navigate();
                          }),
                      SizedBox(
                        width: 40,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: (!colorsS ||
                                        !colorsM ||
                                        !colorsL ||
                                        !colorsXL ||
                                        !colorsXXL) &&
                                    (!colors26 ||
                                        !colors28 ||
                                        !colors30 ||
                                        !colors32 ||
                                        !colors34 ||
                                        !colors36 ||
                                        !colors38 ||
                                        !colors40 ||
                                        !colors42 ||
                                        !colors44)
                                ? MaterialStateProperty.all<Color>(
                                    Colors.black87)
                                : MaterialStateProperty.all<Color>(
                                    Colors.grey.shade300),
                            minimumSize:
                                MaterialStateProperty.all(const Size(130, 40)),
                          ),
                          child: const Text(
                            "SHOP NOW",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "walle",
                            ),
                          ),
                          onPressed: () {
                            if ((!colorsS ||
                                    !colorsM ||
                                    !colorsL ||
                                    !colorsXL ||
                                    !colorsXXL) &&
                                (!colors26 ||
                                    !colors28 ||
                                    !colors30 ||
                                    !colors32 ||
                                    !colors34 ||
                                    !colors36 ||
                                    !colors38 ||
                                    !colors40 ||
                                    !colors42 ||
                                    !colors44)) {
                              UpdateUser(context);
                              Navigate();
                            } else {
                              () {};
                            }
                          }),
                    ]),
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              Container(
                height: 60,
                width: 150,
                child: const Image(
                    image: AssetImage("assets/images/wallie_logo.png")),
              ),
            ])),
      ),
    );
  }

  Navigate() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => WallieHomePage()));
  }

  Widget _circleButton(
      String text, double radius, Color colors, Color bColors) {
    return CircleAvatar(
      child: Text(
        text,
        style: TextStyle(
          color: colors,
          fontFamily: "walle",
        ),
      ),
      minRadius: radius,
      backgroundColor: bColors,
      // color ? Colors.white : Colors.black,
    );
  }
}
