import 'package:bloc_practice/Bloc/Counter/Counter_Bloc.dart';
import 'package:bloc_practice/Bloc/Favourite/favourite_bloc.dart';
import 'package:bloc_practice/Bloc/Posts%20Api/posts_bloc.dart';
import 'package:bloc_practice/Bloc/Switch/switch_bloc.dart';
import 'package:bloc_practice/Bloc/Todo/todo_bloc.dart';
import 'package:bloc_practice/Repository/favourite_repositor.dart';
import 'package:bloc_practice/Ui/Favourite/FavouriteScreen.dart';
import 'package:bloc_practice/Ui/Post%20screen/PostScreen.dart';
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
       // BlocProvider(create: (_) => ImageBloc(ImagePickerUtils()) ),
        BlocProvider(create: (_) =>TodoBloc() ),
        BlocProvider(create: (_) =>FavouriteBloc(FavouriteRepository()) ),
        BlocProvider(create: (_) =>PostBloc() ),
      ],
        child:  MaterialApp(
           title: 'Learning Bloc',
          themeMode: ThemeMode.dark,
          theme: ThemeData(
            brightness: Brightness.dark,
            useMaterial3: true
          ),
          home:const  PostScreen()),
        );
  }
}

