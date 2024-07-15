import 'package:bloc_practice/Bloc/Todo/todo_bloc.dart';
import 'package:bloc_practice/Bloc/Todo/todo_event.dart';
import 'package:bloc_practice/Bloc/Todo/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



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
      body:BlocBuilder<TodoBloc,TodoState>(builder: (context,state){
         if(state.todoList.isEmpty){
             return const Center(child: Text('No Data Found'),);
         }else if(state.todoList.isNotEmpty){
            return  ListView.builder(
                itemCount: state.todoList.length,
                itemBuilder: (context,index){
                  return ListTile(
                    title: Text(state.todoList[index]),
                    trailing: IconButton(onPressed: (){}, icon:const  Icon(Icons.delete)),
                  );
                }
            );
         }else {
           return const SizedBox();
         }

      }),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          for(int  i= 0 ; i < 10 ; i++){
            context.read<TodoBloc>().add(AddTodoEvent(task: 'Task :' + i.toString() ));
          }

        },
        child:const  Icon(Icons.add),),
    );
  }
}
