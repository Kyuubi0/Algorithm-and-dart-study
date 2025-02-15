07-Padding Widget

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
          title: Text('Padding ve Margin Örneği'),
        ),
        body: Center(
          child: Container(
            width: 200,
            height: 100,
            margin: EdgeInsets.all(20.0), // Dış boşluk ekleme (Margin)
            padding: EdgeInsets.all(10.0), // İç boşluk ekleme (Padding)
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0), // İç boşluk eklemek için özel Padding widget'ı
              child: Text(
                'Merhaba, Flutter!',
                style: TextStyle(
                  fontSize: 18,
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
