import 'package:bloc_practice/Bloc/Counter/Counter_Bloc.dart';
import 'package:bloc_practice/Bloc/Counter/Counter_Event.dart';
import 'package:bloc_practice/Bloc/Counter/Counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


  // for Dispose Bloc to prevent the Memory Lekage.


class CounterExample extends StatefulWidget {
  const CounterExample({super.key});

  @override
  State<CounterExample> createState() => _CounterExampleState();
}

class _CounterExampleState extends State<CounterExample> {


  late CounterBloc _counterBloc ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _counterBloc = CounterBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
         create: (_) => _counterBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Counter Example'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder <CounterBloc,CounterState>(
                builder: (context,state){
                  return    Center(
                    child: Text(state.counter.toString(),style:const TextStyle(fontSize: 25),),
                  );
                }
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BlocBuilder <CounterBloc,CounterState>(
                    builder: (context,state){
                      return   ElevatedButton(onPressed: (){
                        context.read<CounterBloc>().add(IncrementCounter());
                      }, child:const  Text('Increment'));
                    }
                ),
                BlocBuilder <CounterBloc,CounterState>(
                    builder: (context,state){
                      return  ElevatedButton(onPressed: (){
                        context.read<CounterBloc>().add(DecrementCounter());
                      }, child:const  Text('Decrement'));
                    }
                ),


                const  SizedBox(width: 20,),

              ],
            )

          ],
        ),
      ),

    );
  }
}

