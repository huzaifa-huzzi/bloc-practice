import 'package:bloc_practice/Bloc/Switch/switch_bloc.dart';
import 'package:bloc_practice/Bloc/Switch/switch_event.dart';
import 'package:bloc_practice/Bloc/Switch/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example Two'),
        centerTitle: true,
      ),
      body:  Padding(
        padding:const  EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                       const  Text('Notifications'),
                       BlocBuilder<SwitchBloc,SwitchState>(
                           builder: (context,state){
                              return   Switch(value: state.isSwitch, onChanged: (newValue){
                                context.read<SwitchBloc>().add(EnableOrDisableNotifications());
                              });
                    }
                       ),
                  ],
                ),
                const SizedBox(height: 30,),
                Container(
                  height: 200,
                  color: Colors.red.withOpacity(.2),
                ),
                const SizedBox(height: 50,),
                Slider(value: .4, onChanged: (value){})
              ],
            ),
      ),
    );
  }
}
