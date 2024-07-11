import 'package:bloc_practice/Equatable/Equatable%20testing.dart';
import 'package:bloc_practice/Ui/Counter_example.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
      home: CounterExample(),
    );
  }
}

