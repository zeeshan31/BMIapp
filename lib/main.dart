

import 'package:flutter/material.dart';

import 'HomePage.dart';

main() => runApp(BMIapp());

class BMIapp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BMIappState();
  }
}

class _BMIappState extends State<BMIapp> {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.black, scaffoldBackgroundColor: Colors.black),
      home: HomePage()
    );
  }
}
