import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:walliefinal/screens/preference.dart';
import 'walliehomepage.dart';
import 'mylogin.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top:  true,
      child: SplashScreen(
          // useLoader: true,
          // Padding: EdgeInsets.all(0),
          loadingText: const Text(""),
          navigateAfterSeconds: const Card(
            child: WallieHomePage(),
          ),
          seconds: 5,
          title: const Text(
            'Welcome To Wallie!',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          image: const Image(
              image: AssetImage("assets/images/wallie_logo.png"),
              fit: BoxFit.scaleDown),
          backgroundColor: Colors.white,
          styleTextUnderTheLoader: const TextStyle(),
          photoSize: 100.0,
          onClick: () => print("flutter"),
          loaderColor: Colors.red),
    );
  }
}
