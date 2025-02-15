import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 1. Events (Olaylar)
abstract class UserEvent {}

class UpdateNameEvent extends UserEvent {
  final String name;
  UpdateNameEvent(this.name);
}

class UpdateSurnameEvent extends UserEvent {
  final String surname;
  UpdateSurnameEvent(this.surname);
}

class ClearUserEvent extends UserEvent {}

// 2. State (Durum)
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

// 3. BLoC
class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState()) {
    on<UpdateNameEvent>((event, emit) {
      emit(state.copyWith(name: event.name));
    });

    on<UpdateSurnameEvent>((event, emit) {
      emit(state.copyWith(surname: event.surname));
    });

    on<ClearUserEvent>((event, emit) {
      emit(UserState());
    });
  }
}

// 4. UI
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(),
      child: MaterialApp(
        title: 'BLoC Demo',
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
                context.read<UserBloc>().add(UpdateNameEvent(value));
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
                context.read<UserBloc>().add(UpdateSurnameEvent(value));
              },
            ),
            const SizedBox(height: 40),
            // Girilen verileri gösterme
            BlocBuilder<UserBloc, UserState>(
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
            BlocBuilder<UserBloc, UserState>(
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
                context.read<UserBloc>().add(ClearUserEvent());
              },
              child: const Text('Temizle'),
            ),
          ],
        ),
      ),
    );
  }
}
