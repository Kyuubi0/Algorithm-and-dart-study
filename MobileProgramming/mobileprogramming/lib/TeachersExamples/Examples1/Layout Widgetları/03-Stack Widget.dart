//03-Stack Widget

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
          title: Text('Stack Widget Örneği'),
        ),
        body: Center(
          child: Stack(
            alignment: Alignment.center, // Tüm çocukları ortalar
            children: [
              // Alt katmanda büyük bir kare
              Container(
                width: 200,
                height: 200,
                color: Colors.blue,
              ),
              
              // Ortadaki katmanda daha küçük bir kare
              Container(
                width: 150,
                height: 150,
                color: Colors.green,
              ),
              
              // En üstte bir ikon, Positioned ile konumlandırılıyor
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.orange,
                  child: Icon(Icons.star, color: Colors.white),
                ),
              ),
              
              // Sol altta başka bir ikon, Positioned ile konumlandırılıyor
              Positioned(
                bottom: 10,
                left: 10,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                  child: Icon(Icons.favorite, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
