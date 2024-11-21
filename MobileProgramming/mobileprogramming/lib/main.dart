// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}
class HomePage extends StatelessWidget{
  const HomePage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 246, 248),
      appBar: AppBar(
      // ignore: prefer_const_constructors
      title: Text("FirstApp"),
      actions: [
        IconButton(onPressed: () => {}, icon: Icon(Icons.save)),
        IconButton(onPressed: () => {}, icon: Icon(Icons.delete)),
        // ignore: prefer_const_constructors
        IconButton(onPressed: () => {}, icon: Icon(Icons.update)),
        ]
      ),
      body: Center(
        child: RichText(
          text: TextSpan(
            text: "Rich Text is good for design \n",
            style: TextStyle(
              color: const Color.fromARGB(255, 45, 155, 245),
              fontSize: 20,
              fontStyle: FontStyle.italic,
            ),
            children: [
              TextSpan(
                text: "Hello there!\n",
                style: TextStyle(
                color: const Color.fromARGB(255, 10, 173, 179),
                fontSize: 20,
                fontStyle: FontStyle.italic,
                ),
              ),
              TextSpan(
                text: "Hello there!\n",
                style: TextStyle(
                color: const Color.fromARGB(255, 88, 146, 81),
                fontSize: 20,
                fontStyle: FontStyle.italic,
                ),
              ),
              TextSpan(
                text: "Hello there!\n",
                style: TextStyle(
                color: const Color.fromARGB(255, 96, 101, 173),
                fontSize: 20,
                fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
        // Text(
        //   "Hello first app",
        //   textAlign: TextAlign.center,
        //   textDirection: TextDirection.rtl,
        //   style: TextStyle(
        //     fontSize: 36,
        //     color: const Color.fromARGB(255, 48, 175, 192),
        //     fontWeight: FontWeight.bold,
        //     //decoration: TextDecoration.underline,
        //     wordSpacing: 10,
        //     letterSpacing: 2,
        //     fontStyle: FontStyle.italic,
        //     //backgroundColor: const Color.fromARGB(255, 154, 211, 211),
        //     ),
        // ),
      ),
    );
  }
}