//04-Expanded Widget

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
          title: Text('Expanded Widget Örneği'),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2, // 2 birim genişleyecek
                  child: Container(
                    height: 100,
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        'Expanded 2',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1, // 1 birim genişleyecek
                  child: Container(
                    height: 100,
                    color: Colors.green,
                    child: Center(
                      child: Text(
                        'Expanded 1',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
