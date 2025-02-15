05-Container Widget

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
          title: Text('Container Örneği'),
        ),
        body: Center(
          child: Container(
            width: 200.0,  // Genişlik
            height: 200.0, // Yükseklik
            alignment: Alignment.center, // İçindeki widget'ın hizalanması
            padding: EdgeInsets.all(20.0), // İç dolgu
            margin: EdgeInsets.all(10.0), // Dış boşluk
            decoration: BoxDecoration(
              color: Colors.blue[100], // Arka plan rengi
              border: Border.all(
                color: Colors.blue, // Kenarlık rengi
                width: 3.0, // Kenarlık kalınlığı
              ),
              borderRadius: BorderRadius.circular(15.0), // Köşe yuvarlatma
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Gölge rengi
                  spreadRadius: 5, // Gölge yayılma mesafesi
                  blurRadius: 7, // Gölge bulanıklığı
                  offset: Offset(0, 3), // Gölge pozisyonu
                ),
              ],
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.purple], // Lineer gradyan
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Text(
              'Merhaba, Flutter!',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
