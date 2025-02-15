// ignore_for_file: prefer_const_constructors

// ignore: unused_import
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget{
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Row(
          children: [
            Expanded(flex: 20, child: Container(width: 100, height: 100, color: Colors.red,)),
            Expanded(flex: 30, child: Container(width: 100, height: 100, color: Colors.yellow,)),
            Expanded(flex: 15, child: Container(width: 100, height: 100, color: Colors.blue,)),
          ]
        ),
      )
    );
  }
}
