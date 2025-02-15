// 01-Row Widget

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
          title: Text('Row Widget Örneği'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround, // Yatay hizalama
            crossAxisAlignment: CrossAxisAlignment.center, // Dikey hizalama
            children: [
              Container(
                width: 50,
                height: 50,
                color: Colors.blue,
                child: Icon(Icons.home, color: Colors.white),
              ),
              Container(
                width: 50,
                height: 50,
                color: Colors.green,
                child: Icon(Icons.favorite, color: Colors.white),
              ),
              Container(
                width: 50,
                height: 50,
                color: Colors.orange,
                child: Icon(Icons.settings, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
