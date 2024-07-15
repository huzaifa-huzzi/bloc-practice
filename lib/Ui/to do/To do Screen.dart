import 'dart:js_interop_unsafe';

import 'package:flutter/material.dart';



class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: ListView.builder(
        itemCount: 10,
          itemBuilder: (context,index){
          return ListTile(
            title: Text(index.toString()),
            trailing: IconButton(onPressed: (){}, icon:const  Icon(Icons.delete)),
          );
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child:const  Icon(Icons.add),),
    );
  }
}
