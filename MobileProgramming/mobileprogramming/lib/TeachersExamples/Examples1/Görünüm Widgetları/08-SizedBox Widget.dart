08-SizedBox Widget

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
          title: Text('SizedBox ve Placeholder Örneği'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Sabit boyutlu boş bir alan oluşturmak için SizedBox
              SizedBox(
                width: 100,
                height: 50,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Center(
                    child: Text(
                      'SizedBox',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              
              SizedBox(height: 20), // İki widget arasında dikey boşluk

              // Sabit genişlik veya yükseklik olmadan sadece boş alan oluşturmak için
              SizedBox(
                width: 50, // Yatay boşluk
              ),
              
              SizedBox(height: 20), // İki widget arasında dikey boşluk

              // Geçici bir widget alanı göstermek için Placeholder
              Placeholder(
                color: Colors.red, // Placeholder çerçeve rengi
                strokeWidth: 2, // Çerçeve kalınlığı
                fallbackWidth: 150, // Varsayılan genişlik
                fallbackHeight: 100, // Varsayılan yükseklik
              ),
            ],
          ),
        ),
      ),
    );
  }
}
