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
      title: Text("FirstApp"),
      actions: [
        IconButton(onPressed: () => {}, icon: Icon(Icons.save)),
        IconButton(onPressed: () => {}, icon: Icon(Icons.delete)),
        IconButton(onPressed: () => {}, icon: Icon(Icons.update)),
        ]
      ),
      body: Center(
        child: Text(
          "Hello first app",
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontSize: 36,
            color: const Color.fromARGB(255, 48, 175, 192),
            fontWeight: FontWeight.bold,
            //decoration: TextDecoration.underline,
            wordSpacing: 10,
            letterSpacing: 2,
            fontStyle: FontStyle.italic,
            //backgroundColor: const Color.fromARGB(255, 154, 211, 211),
            ),
        ),
      ),
    );
  }
}