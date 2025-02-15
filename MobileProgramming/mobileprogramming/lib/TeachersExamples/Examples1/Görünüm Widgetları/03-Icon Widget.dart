//03-Icon Widget

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material Design İkonları'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.home,
                color: Colors.blue,
                size: 50.0,
              ),
              Icon(
                Icons.favorite,
                color: Colors.red,
                size: 50.0,
              ),
              Icon(
                Icons.settings,
                color: Colors.grey,
                size: 50.0,
              ),
              Icon(
                Icons.alarm,
                color: Colors.orange,
                size: 50.0,
              ),
              Icon(
                Icons.search,
                color: Colors.green,
                size: 50.0,
              ),
              Icon(
                Icons.camera_alt,
                color: Colors.purple,
                size: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
