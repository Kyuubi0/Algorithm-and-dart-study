//04-Image Widget

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
          title: Text('Resim Gösterimi Örnekleri'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 1. Ağ üzerinden (URL ile) resim gösterimi
              Image.network(
                'https://flutter.dev/assets/homepage/carousel/slide_1-layer_0-2x-7cb1cd283262b8e8ab7ec1a8dd88de4730f5dc5b8cd1282e02ab4a14a78db03b.png',
                width: 300,
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),

              // 2. Varlık (assets) klasöründen resim gösterimi
              // `pubspec.yaml` dosyasına resim yolunu eklemeyi unutmayın!
              Image.asset(
                'assets/images/sample_image.png',
                width: 300,
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),

              // 3. Dosya (local file) üzerinden resim gösterimi
              // Bu örnekte dosya yolunu doğrudan vermek yerine `FileImage` ile kullanmak gerekebilir.
              // Image.file(File('path/to/local/image.png')) şeklinde kullanılır.

              // 4. Hafif yer tutucu (placeholder) resmi
              FadeInImage.assetNetwork(
                placeholder: 'assets/images/placeholder.png', // Yer tutucu resmi
                image: 'https://flutter.dev/assets/homepage/carousel/slide_1-layer_0-2x-7cb1cd283262b8e8ab7ec1a8dd88de4730f5dc5b8cd1282e02ab4a14a78db03b.png',
                width: 300,
                height: 200,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
