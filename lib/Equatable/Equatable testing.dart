import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


class EquatableTesting extends StatefulWidget {
  const EquatableTesting({super.key});

  @override
  State<EquatableTesting> createState() => _EquatableTestingState();
}

class _EquatableTestingState extends State<EquatableTesting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Person person =const  Person(name: 'Huzaifa', age: 17);
            Person person1 =const  Person(name: 'Huzaifa', age: 17);

            print(person == person1); // It will not be give result true because the dart only compare with the things which have same object so,for these we sue the Equatable Class;

          }
      ), 
    );
  }
}

class Person extends Equatable {

  final String name;
  final int age;

  const Person({required this.name,required this.age});

  @override
  // TODO: implement props
  List<Object?> get props => [name,age];

}
