import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:walliefinal/screens/mylogin.dart';
import 'screens/spalahscreeen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    // bool isWeb;
    // try {
    //   if (Platform.isAndroid || Platform.isIOS) {
    //     isWeb = false;
    //   } else {
    //     isWeb = true;
    //   }
    // } catch (e) {
    //   isWeb = true;
    // }
    // var platformTitle = !isWeb ? 'Login' : 'Login Page';
    return MaterialApp(
      title: 'Wallie',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: //MyHomePage(),
          FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("Error");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return MyHomePage();
          }
          return CircularProgressIndicator();
        },
      ),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "/Mylogin": (context) => MyLogin(),
      },
    );
  }
}
