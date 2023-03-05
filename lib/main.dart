import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

//import other pages
import 'today.dart';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_page.dart';
import 'home.dart';
import 'past2.dart';

void main() async {

  //initializeApp is asyn function
  //await to ensure firebase initialization
  //ensureinitialized() to prevent flutter errors
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  //starting point of program
  runApp(const MyApp());
}

// top level app class w high level config for app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Journal',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.pink,
      ),

      //MyHomePage is homescreen
      //home: what is the first screen you wanna open?
      home: const MyAuthPage(),
    );
  }
}

