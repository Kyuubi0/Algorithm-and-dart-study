import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 1. State Sınıfı
class UserState {
  final String name;
  final String surname;

  UserState({
    this.name = '',
    this.surname = '',
  });

  UserState copyWith({String? name, String? surname}) {
    return UserState(
      name: name ?? this.name,
      surname: surname ?? this.surname,
    );
  }
}

// 2. Cubit Sınıfı
class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserState());

  void updateName(String name) {
    emit(state.copyWith(name: name));
  }

  void updateSurname(String surname) {
    emit(state.copyWith(surname: surname));
  }

  void clearUser() {
    emit(UserState());
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const HomePage(),
      ),
    );
  }
}

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
            // İsim TextField
            TextField(
              decoration: const InputDecoration(
                labelText: 'Ad',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                context.read<UserCubit>().updateName(value);
              },
            ),
            const SizedBox(height: 20),
            // Soyad TextField
            TextField(
              decoration: const InputDecoration(
                labelText: 'Soyad',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                context.read<UserCubit>().updateSurname(value);
              },
            ),
            const SizedBox(height: 40),
            // Girilen verileri gösterme
            BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text('Ad: ${state.name}'),
                        Text('Soyad: ${state.surname}'),
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
            BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                return Text(
                  '${state.name} ${state.surname}',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            const SizedBox(height: 40),
            // Temizle butonu
            ElevatedButton(
              onPressed: () {
                context.read<UserCubit>().clearUser();
              },
              child: const Text('Temizle'),
            ),
          ],
        ),
      ),
    );
  }
}
