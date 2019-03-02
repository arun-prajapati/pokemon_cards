import 'dart:async';

import 'package:flutter/material.dart';
import 'Home.dart';
import 'mainpage.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApplication(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Gotham'),
      routes: {
        'home':(context)=>Home(),
        'detail':(context)=>MainPage()
      },
    );
  }
}

class MyApplication extends StatefulWidget {
  @override
  _MyApplicationState createState() => _MyApplicationState();
}

class _MyApplicationState extends State<MyApplication> {

  static const timeout = const Duration(seconds: 3);
  static const ms = const Duration(milliseconds: 1);

  startTimeout([int milliseconds]) {
    var duration = milliseconds == null ? timeout : ms * milliseconds;
    return new Timer(duration, handleTimeout);
  }

  void handleTimeout() {  // callback function
  Navigator.of(context).pushReplacementNamed('home');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/background.png"),fit: BoxFit.cover)
      ),
        child: Center(
          child:Image.asset("assets/images/logo.png",height: 200,width: 200,)
        ),
      ),
    );
  }
}

