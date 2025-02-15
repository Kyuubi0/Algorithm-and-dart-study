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
          title: Text('Text Widget Özellikleri'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Bu bir Flutter Text widget örneğidir!',
              style: TextStyle(
                color: Colors.blue, // Metin rengi
                fontSize: 20, // Yazı boyutu
                fontWeight: FontWeight.bold, // Kalınlık
                fontStyle: FontStyle.italic, // İtalik yazı
                letterSpacing: 1.5, // Harf aralığı
                wordSpacing: 5.0, // Kelime aralığı
                backgroundColor: Colors.yellow, // Arka plan rengi
                decoration: TextDecoration.underline, // Alt çizgi
                decorationColor: Colors.red, // Çizgi rengi
                decorationStyle: TextDecorationStyle.dashed, // Çizgi stili
              ),
              textAlign: TextAlign.center, // Metin hizalaması
              textDirection: TextDirection.ltr, // Metin yönü (ltr veya rtl)
              maxLines: 2, // Maksimum satır sayısı
              overflow: TextOverflow.ellipsis, // Taşma biçimi
              softWrap: true, // Metni sarma
              textScaleFactor: 1.2, // Ölçek faktörü
              locale: Locale('tr', 'TR'), // Dil ve yerel ayar
              semanticsLabel: 'Flutter metin widget örneği', // Erişilebilirlik etiketi
            ),
          ),
        ),
      ),
    );
  }
}
