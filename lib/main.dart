import 'package:bloc_practice/Bloc/Counter/Counter_Bloc.dart';
import 'package:bloc_practice/Bloc/Switch/switch_bloc.dart';
import 'package:bloc_practice/Ui/switch/switch_example.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc() ),
        BlocProvider(create: (_) => SwitchBloc() ),
      ],
        child:const  MaterialApp(
          home: SwitchExample(),
        ),
    );
  }
}

