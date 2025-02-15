06-Center Widget

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
          title: Text('Center Widget Örneği'),
        ),
        body: Center(
          child: Container(
            width: 200,
            height: 100,
            color: Colors.blueAccent,
            child: Center(
              child: Text(
                'Merhaba, Flutter!',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
