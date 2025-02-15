//05-Flexible Widget      FlexFit.tight =  Expanded gibi davranır

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
          title: Text('Flexible Widget Örneği'),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight, // Tüm alanı kaplayacak
                  child: Container(
                    height: 100,
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        'Tight - 2 Birim',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.loose, // İçeriği kadar genişleyecek
                  child: Container(
                    height: 100,
                    color: Colors.green,
                    child: Center(
                      child: Text(
                        'Loose - 1 Birim',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Flexible(
              flex: 1,
              fit: FlexFit.tight, // Dikey eksende tüm alanı kaplayacak
              child: Container(
                color: Colors.orange,
                child: Center(
                  child: Text(
                    'Dikey Flexible (Tight)',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
