import 'package:flutter/material.dart';


class CounterExample extends StatefulWidget {
  const CounterExample({super.key});

  @override
  State<CounterExample> createState() => _CounterExampleState();
}

class _CounterExampleState extends State<CounterExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Example'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         const  Center(
            child: Text('0',style: TextStyle(fontSize: 25),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){}, child:const  Text('Increment')),
             const  SizedBox(width: 20,),
              ElevatedButton(onPressed: (){}, child:const  Text('Decrement')),
            ],
          )

        ],
      ),
    );
  }
}
