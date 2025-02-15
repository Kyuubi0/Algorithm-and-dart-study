//02-Column Widget

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
          title: Text('Column Widget Örneği'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Dikey hizalama
            crossAxisAlignment: CrossAxisAlignment.center, // Yatay hizalama
            children: [
              Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: Icon(Icons.home, color: Colors.white),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.green,
                child: Icon(Icons.favorite, color: Colors.white),
              ),
              Container(
                width: 100,
                height: 100,
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
