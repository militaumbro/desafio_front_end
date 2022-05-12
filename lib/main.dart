import 'package:desafio_front_end/Pages/mainPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desafio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(title: ''),
    );
  }
}


