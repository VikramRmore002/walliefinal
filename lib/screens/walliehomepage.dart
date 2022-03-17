import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart' as rbund;
import 'package:walliefinal/custom_class/Product.dart';
import '../custom_class/product.dart' as prd;

class WallieHomePage extends StatefulWidget {
  const WallieHomePage({Key? key}) : super(key: key);

  @override
  _WallieHomePageState createState() => _WallieHomePageState();
}

class _WallieHomePageState extends State<WallieHomePage> {
  CollectionReference<Map<String, dynamic>> _firebaseFirestore =
      FirebaseFirestore.instance.collection("items");

  bool istrue = true;

  var itemindex;

  Future<List<prd.Product>> ReadJsonData() async {
    //read json file
    final jsondata = await rbund.rootBundle.loadString('assets/data.json');
    //decode json data as list
    final list = json.decode(jsondata) as List<dynamic>;
    //map json and initialize using DataModel
    return list.map((e) => prd.Product.fromJson(e)).toList();
  }

  // Future<List> fetchAllitem() async {
  //   List contactList = [];
  //    var collectionReference =  await _firebaseFirestore.doc("4").get();
  //   contactList = collectionReference  as List;
  //   print(contactList);
  //   return contactList;
  // }
  @override
  void initState() {
    super.initState();
    // ReadJsonData();
    // fetchAllitem();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Card(
          child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Colors.black54, width: 2.0),
        ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 12,
                ),
                Image.asset(
                  'assets/images/wallie_logo.png',
                  fit: BoxFit.contain,
                  height: 70,
                ),
              ],
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_sharp),
              color: Colors.black,
            ),
            actions: [
              GestureDetector(
                  onTap: ReadJsonData,
                  child: const CircleAvatar(
                      minRadius: 25,
                      backgroundColor: Colors.black,
                      child: Image(
                        image: AssetImage("assets/images/product/basket.png"),
                      )))
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (context) {},
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  color: Colors.black,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                label: 'search',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings_outlined,
                  color: Colors.black,
                ),
                label: 'My Preferences',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.black,
                ),
                label: 'my favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.black,
                ),
                label: 'my account',
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(padding: EdgeInsets.only(top: 30)),
                const Text(
                  "Welcome John!",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "walle",
                      fontSize: 22.0,
                      height: 1.4,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    // alignment: Alignment.center,
                    // padding: EdgeInsets.only(top: 1),
                    height: 50,
                    child: TextFormField(
                      // textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black,
                          fontFamily: "walle",
                          fontSize: 16.0,
                          height: 1.4,
                          fontWeight: FontWeight.w300),
                      decoration: InputDecoration(
                        hintText: "What are you looking for?",
                        focusColor: Colors.black,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.black38, width: 2.0),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        border: const OutlineInputBorder(),
                        suffixIcon: const Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: ListView(
                    children: [
                      const Text(
                        "TOPS",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "walle",
                            fontSize: 18.0,
                            height: 1.4,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SizedBox(
                          height: 300,
                          width: 300,
                          child: SizedBox(
                            height: 100,
                            child: FutureBuilder(
                              future: ReadJsonData(),
                              builder: (BuildContext context, data) {
                                if (data.hasError) {
                                  return Container(
                                    height: 95,
                                    width: 95,
                                    color: Colors.yellow,
                                    // child: StreamBuilder,
                                  );
                                } else if (data.hasData) {
                                  var items = data.data as List<prd.Product>;

                                  return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: items[1].childrenIds?.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      var itemid =
                                          items[1].childrenIds.toString();
                                      print(itemid);
                                      return Card(
                                        elevation: 5,
                                        color: Colors.black,
                                        child: LayoutBuilder(builder: (contxt, Constraints) {
                                          return Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [

                                              Container(
                                                height: Constraints.maxHeight * 0.8,
                                                child: Image( image: NetworkImage(items[index + 3].image.toString() ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),

                                              Padding(
                                                padding: const EdgeInsets.all(15.0),
                                                child: Text(
                                                  items[index +3].name.toString(),
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ],
                                          );
                                        })
                                        // child: StreamBuilder,
                                      );
                                    },
                                  );
                                } else {
                                  return const CircularProgressIndicator(
                                    color: Colors.red,
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        "BOTTOM",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "walle",
                            fontSize: 18.0,
                            height: 1.4,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SizedBox(
                          height: 300,
                          width: 300,
                          child: SizedBox(
                            height: 100,
                            child: FutureBuilder(
                              future: ReadJsonData(),
                              builder: (BuildContext context, data) {
                                if (data.hasError) {
                                  return Container(
                                    height: 95,
                                    width: 95,
                                    color: Colors.yellow,
                                    // child: StreamBuilder,
                                  );
                                } else if (data.hasData) {
                                  var items = data.data as List<prd.Product>;

                                  return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: items[2].childrenIds?.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      var itemidbottom =
                                      items[2].childrenIds.toString();
                                      print(itemidbottom);
                                      return Card(
                                          elevation: 5,
                                          color: Colors.black,
                                          child: LayoutBuilder(builder: (contxt, Constraints) {
                                            return Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [

                                                Container(
                                                  height: Constraints.maxHeight * 0.8,
                                                  child: Image( image: NetworkImage(items[index + 10].image.toString() ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),

                                                Padding(
                                                  padding: const EdgeInsets.all(15.0),
                                                  child: Text(
                                                    items[index + 10 ].name.toString(),
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ],
                                            );
                                          })
                                        // child: StreamBuilder,
                                      );
                                    },
                                  );
                                } else {
                                  return const CircularProgressIndicator(
                                    color: Colors.red,
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        "NEW ARRIVALS",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "walle",
                            fontSize: 18.0,
                            height: 1.4,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SizedBox(
                          height: 300,
                          width: 300,
                          child: SizedBox(
                            height: 100,
                            child: FutureBuilder(
                              future: ReadJsonData(),
                              builder: (BuildContext context, data) {
                                if (data.hasError) {
                                  return Container(
                                    height: 95,
                                    width: 95,
                                    color: Colors.yellow,
                                    // child: StreamBuilder,
                                  );
                                } else if (data.hasData) {
                                  var items = data.data as List<prd.Product>;

                                  return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: items[1 ].childrenIds?.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Card(
                                          elevation: 5,
                                          color: Colors.black,
                                          child: LayoutBuilder(builder: (contxt, Constraints) {
                                            return Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [

                                                Container(
                                                  height: Constraints.maxHeight * 0.8,
                                                  child: Image( image: NetworkImage(items[index+21].image.toString() ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),

                                                Padding(
                                                  padding: const EdgeInsets.all(15.0),
                                                  child: Text(
                                                    items[index +21].name.toString(),
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ],
                                            );
                                          })
                                        // child: StreamBuilder,
                                      );
                                    },
                                  );
                                } else {
                                  return const CircularProgressIndicator(
                                    color: Colors.red,
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
