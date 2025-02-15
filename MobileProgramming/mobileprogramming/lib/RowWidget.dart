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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, //behaves horizontally for row
          crossAxisAlignment: CrossAxisAlignment.center, //behaves vertically for row
          children: [
            Container(
              color: const Color.fromARGB(255, 22, 115, 221),
              width:50,
              height:100,
            ),
            Container(
              color: const Color.fromARGB(255, 255, 237, 74),
              width:50,
              height:150,
            ),
            Container(
              color: const Color.fromARGB(255, 214, 49, 49),
              width:50,
              height:50,
            )
          ],
        ),
      )
    );
  }
}
