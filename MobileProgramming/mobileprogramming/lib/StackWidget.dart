// // ignore_for_file: prefer_const_constructors

// // ignore: unused_import
// import 'dart:math';

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget{
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: ProfilePage(),
//     );
//   }
// }

// class ProfilePage extends StatelessWidget{
//   const ProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;

//     double centerX = screenWidth/2;
//     double centerY = screenHeight/2;

//     return Scaffold(
//       backgroundColor: Colors.grey,
//       body: Center(
//         child:Stack(
//           //fit: StackFit.loose,
//           //alignment: Alignment.topRight,
//           children: [
//             Center(),
//             //Padding(padding: EdgeInsets.all(100)),
//             Positioned(bottom:0, left:0, child: Container(width: 150, height: 150, color: const Color.fromARGB(255, 37, 132, 187))),
//             Positioned(bottom:0, left:100, child: Container(width: 150, height: 150, color: const Color.fromARGB(255, 77, 37, 187))),
//             Positioned(bottom:0, left:200, child: Container(width: 150, height: 150, color: const Color.fromARGB(255, 169, 37, 187))),
//             Positioned(top:30, right:10, child: Icon(Icons.app_registration, color: const Color.fromARGB(255, 222, 255, 104)))
//           ],
//         )
//       )
//     );
//   }
// }
