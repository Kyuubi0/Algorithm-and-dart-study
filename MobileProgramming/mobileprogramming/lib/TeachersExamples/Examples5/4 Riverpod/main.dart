import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// State provider'larımız
final nameProvider = StateProvider<String>((ref) => '');
final surnameProvider = StateProvider<String>((ref) => '');

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

// HomePage widget'ı
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ana Sayfa'),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const DetailPage()),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // İsim alanı
            Consumer(
              builder: (context, ref, child) {
                return TextField(
                  decoration: const InputDecoration(
                    labelText: 'Ad',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) =>
                      ref.read(nameProvider.notifier).state = value,
                );
              },
            ),
            const SizedBox(height: 20),
            // Soyad alanı
            Consumer(
              builder: (context, ref, child) {
                return TextField(
                  decoration: const InputDecoration(
                    labelText: 'Soyad',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) =>
                      ref.read(surnameProvider.notifier).state = value,
                );
              },
            ),
            const SizedBox(height: 40),
            // Girilen verileri gösterme
            Consumer(
              builder: (context, ref, child) {
                final name = ref.watch(nameProvider);
                final surname = ref.watch(surnameProvider);
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text('Ad: $name'),
                        Text('Soyad: $surname'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Detay Sayfası
class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detay Sayfası'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Kullanıcı Bilgileri',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            // İsim ve soyisim gösterme
            Consumer(
              builder: (context, ref, child) {
                final name = ref.watch(nameProvider);
                final surname = ref.watch(surnameProvider);
                return Column(
                  children: [
                    Text(
                      '$name $surname',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 40),
            // Temizle butonu
            Consumer(
              builder: (context, ref, child) {
                return ElevatedButton(
                  onPressed: () {
                    ref.read(nameProvider.notifier).state = '';
                    ref.read(surnameProvider.notifier).state = '';
                  },
                  child: const Text('Temizle'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
