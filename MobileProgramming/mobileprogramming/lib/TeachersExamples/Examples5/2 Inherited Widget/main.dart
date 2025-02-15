// main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Sayaç verilerini tutan InheritedWidget
class CounterProvider extends InheritedWidget {
  final int count;
  final Function increment;
  final Function decrement;

  const CounterProvider({
    super.key,
    required this.count,
    required this.increment,
    required this.decrement,
    required Widget child,
  }) : super(child: child);

  // Veriyi almak için kullanılan statik metod
  static CounterProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>()!;
  }

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return count != oldWidget.count;
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _count = 0;

  void _increment() {
    setState(() {
      _count++;
    });
  }

  void _decrement() {
    setState(() {
      _count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      count: _count,
      increment: _increment,
      decrement: _decrement,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}

// Ana Sayfa
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = CounterProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sayaç Uygulaması'),
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
            Text(
              '${counter.count}',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => counter.decrement(),
                  child: const Text('Azalt'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => counter.increment(),
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
    final counter = CounterProvider.of(context);

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
            Text(
              '${counter.count}',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => counter.decrement(),
                  child: const Text('Azalt'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => counter.increment(),
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
