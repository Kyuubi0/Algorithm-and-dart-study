//importlanan kütüphaneler
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

//main fonksiyonum
void main() {
  runApp(const MyApp()); // MyApp'i çağırıyoruz.
}

//Daily Rate classı
// class Daily{
//   var date;
//   var note;
//   int rate;
// }

//MyApp classı
class MyApp extends StatelessWidget{
  const MyApp({Key? key});

  @override //override edilmiş build fonksiyonu
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tracker',
      home: const HomePage(), // HomePage çağırıldı.
    );
  }
}

//Tracker classı
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold widgeti
      backgroundColor: const Color.fromARGB(255, 246, 239, 255),
      appBar: AppBar( // AppBar widgeti
        title: const Text('Tracker', style : TextStyle(color: Colors.white),),
        backgroundColor: const Color.fromRGBO(171, 134, 214, 1),
        centerTitle: true,
      ),
      body: Center( // Center widgeti
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Calendar(), //Takvim widgeti

            const SizedBox(height: 10),
            const SizedBox(height: 10),

            // IconButton Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton( //Add button
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SelectionMenu(), //SelectionMenu'ye yönlendiriyor
                      ),
                    );
                  },
                  icon: const Icon(Icons.add), color: Colors.black,
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 20),
              ],
              ),
            ],
          ),
        ),
    );
  }

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;


  Widget Calendar(){ //Takvim widgeti
    return Column(
      children: [
        Container(
          child: TableCalendar(
            firstDay: DateTime.utc(2025, 1, 1),
            lastDay: DateTime.utc(2025, 12, 31),
            DateTime? _selectedDay;
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              }
            },
            onPageChanged: (focusedDay) {
            // No need to call `setState()` here
            _focusedDay = focusedDay;
            },
          ),
        )
      ],
    );
  }

  // Widget content(){ //Takvim widgeti
  //   return Column(
  //     children: [
  //       Container(
  //         child: TableCalendar(
  //           focusedDay: DateTime.now(),
  //           firstDay: DateTime.utc(2025, 1, 1),
  //           lastDay: DateTime.utc(2025, 12, 31)
  //           ),
  //       )
  //     ],
  //   );
  // }

  Widget SelectionMenu() {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 226, 255),
      appBar: AppBar(
        title: const Text('Selection Menu'),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(171, 134, 214, 1),

      ),
      body: Center(
        child: Container(
          height: 600,
          width: 300,
          color: const Color.fromARGB(255, 209, 151, 248),
        ),
      ),
    );
  }
}




