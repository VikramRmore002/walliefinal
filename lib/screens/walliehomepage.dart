import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart' as rbund;

class WallieHomePage extends StatefulWidget {
  const WallieHomePage({Key? key}) : super(key: key);

  @override
  _WallieHomePageState createState() => _WallieHomePageState();
}

class _WallieHomePageState extends State<WallieHomePage> {
  List<Object> items = [];

  Future<void> readJson() async {
    final String response = await rbund.rootBundle.loadString("assets/data.json");
    final data = await json.decode(response);
    setState(() {
      items = data["items"];
    });
    debugPrint(items.toString());
  }

  @override
  void initState() {
    super.initState();
    readJson();
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
                  onTap: readJson,
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
                Column(
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
                        height: 100,
                        width: double.infinity,
                        child: SizedBox(
                          height: 100,
                          child: items.isEmpty
                              ? Container(
                                  height: 95,
                                  width: 95,
                                  color: Colors.yellow,
                                  // child: StreamBuilder,
                                )
                              : ListView.builder(
                                  itemCount: items.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        Container(
                                          height: 95,
                                          width: 95,
                                          color: Colors.black,
                                          // child: StreamBuilder,
                                        ),
                                      ],
                                    );
                                  },
                                ),
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 30)),
                    const Text(
                      "BOTTOMS",
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
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              height: 95,
                              width: 95,
                              color: Colors.black,
                            ),
                          ],
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
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              height: 95,
                              width: 95,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
