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
//       home: ProfilePage(),
//     );
//   }
// }

// class ProfilePage extends StatelessWidget{
//   const ProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 15),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center, //behaves vertically for column
//           crossAxisAlignment: CrossAxisAlignment.center,//behaves horizontally for column
//           children: [
//             Container(color: const Color.fromARGB(255, 36, 91, 211), height: 100, width: 100),
//             Container(color: const Color.fromARGB(255, 255, 211, 80), height: 100, width: 200),
//             Container(color: const Color.fromARGB(255, 214, 51, 51), height: 100, width: 300),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(color: const Color.fromARGB(255, 127, 214, 77), height: 100, width: 100),
//                 Container(color: const Color.fromARGB(255, 179, 96, 187), height: 100, width: 100),
//                 Container(color: const Color.fromARGB(255, 180, 72, 117), height: 100, width: 100,
//                   child:
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       Container(color: const Color.fromARGB(255, 167, 231, 130), height: 20, width: 20),
//                       Container(color: const Color.fromARGB(255, 214, 155, 219), height: 20, width: 20),
//                       Container(color: const Color.fromARGB(255, 199, 131, 159), height: 20, width: 20),
//                     ],
//                   )
//                 ),
//               ],
//             )
//           ],
//         ),
//       )
//     );
//   }
// }
