// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Önce sayaç için ChangeNotifier sınıfımızı oluşturalım
class CounterModel extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}

void main() {
  runApp(
    // ChangeNotifierProvider ile uygulamamızı sarıyoruz
    ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

// Ana Sayfa
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Provider'dan veriyi dinleme
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sayaç Uygulaması (Provider)'),
        actions: [
          IconButton(
            icon: const Icon(Icons.navigation),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondPage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Mevcut Sayı:',
              style: TextStyle(fontSize: 24),
            ),
            // Consumer widget'ı ile sayacı dinleme
            Consumer<CounterModel>(
              builder: (context, counter, child) {
                return Text(
                  '${counter.count}',
                  style: const TextStyle(
                      fontSize: 48, fontWeight: FontWeight.bold),
                );
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Context.read ile fonksiyonlara erişme
                ElevatedButton(
                  onPressed: () => context.read<CounterModel>().decrement(),
                  child: const Text('Azalt'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => context.read<CounterModel>().increment(),
                  child: const Text('Artır'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// İkinci Sayfa
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('İkinci Sayfa'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Diğer Sayfadaki Sayı:',
              style: TextStyle(fontSize: 24),
            ),
            // Burada da Consumer kullanıyoruz
            Consumer<CounterModel>(
              builder: (context, counter, child) {
                return Text(
                  '${counter.count}',
                  style: const TextStyle(
                      fontSize: 48, fontWeight: FontWeight.bold),
                );
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => context.read<CounterModel>().decrement(),
                  child: const Text('Azalt'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => context.read<CounterModel>().increment(),
                  child: const Text('Artır'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
