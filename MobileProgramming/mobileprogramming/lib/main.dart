import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}
class HomePage extends StatelessWidget{
  const HomePage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("FirstApp"),
      actions: [
        IconButton(onPressed: () => {}, icon: Icon(Icons.save)),
        IconButton(onPressed: () => {}, icon: Icon(Icons.delete)),
        IconButton(onPressed: () => {}, icon: Icon(Icons.update)),
        ]
      ),
      body: Center(
        child: Text("Hello first app")
      ),
    );
  }
}