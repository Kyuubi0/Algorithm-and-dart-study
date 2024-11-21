// ignore_for_file: prefer_const_constructors

// ignore: unused_import
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
      // ignore: duplicate_ignore
      // ignore: prefer_const_constructors
      title: Text("FirstApp"),
      actions: [
        IconButton(onPressed: () => {}, icon: Icon(Icons.save)),
        IconButton(onPressed: () => {}, icon: Icon(Icons.delete)),
        // ignore: duplicate_ignore
        // ignore: prefer_const_constructors
        IconButton(onPressed: () => {}, icon: Icon(Icons.update)),
        ]
      ),
      body: Center( //Container
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 300,
              padding: EdgeInsets.all(10),
              //color: const Color.fromARGB(255, 12, 59, 131),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color.fromARGB(255, 22, 123, 148),
                width: 4,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 5,
                    blurRadius:15,
                  )
                ],
                gradient: LinearGradient(
                  colors: [const Color.fromARGB(255, 1, 62, 112), const Color.fromARGB(255, 20, 172, 114)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(60)
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                  "https://www.mystopiagame.com/SplashArt.png"
                  ),
                ),
                ),
            ),
            SizedBox(height: 25,),
            Text("Mystopia is the greatest game you can ever see.",style: TextStyle(color: const Color.fromARGB(255, 13, 155, 96)),)
          ],
        ),
      ),
    );
  }
}
      // Center(
      //   child: //Image.asset("assets/images/akali.png"),

        // child: Icon(
        //   Icons.access_alarm,
        //   //Icons.heart_broken_outlined,
        //   color: const Color.fromARGB(255, 12, 119, 207),
        //   size: 72,
        // ),
        // child: RichText(
        //   text: TextSpan(
        //     text: "Rich Text is good for design \n",
        //     style: TextStyle(
        //       color: const Color.fromARGB(255, 45, 155, 245),
        //       fontSize: 20,
        //       fontStyle: FontStyle.italic,
        //     ),
        //     children: [
        //       TextSpan(
        //         text: "Hello there!\n",
        //         style: TextStyle(
        //         color: const Color.fromARGB(255, 10, 173, 179),
        //         fontSize: 20,
        //         fontStyle: FontStyle.italic,
        //         ),
        //       ),
        //       TextSpan(
        //         text: "Hello there!\n",
        //         style: TextStyle(
        //         color: const Color.fromARGB(255, 88, 146, 81),
        //         fontSize: 20,
        //         fontStyle: FontStyle.italic,
        //         ),
        //       ),
        //       TextSpan(
        //         text: "Hello there!\n",
        //         style: TextStyle(
        //         color: const Color.fromARGB(255, 96, 101, 173),
        //         fontSize: 20,
        //         fontStyle: FontStyle.italic,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
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
          // child: Image.network(
          //   width: 300,
          //   height:  300,
          //   "https://www.mystopiagame.com/SplashArt.png",
          //   fit: BoxFit.scaleDown,
          // ),