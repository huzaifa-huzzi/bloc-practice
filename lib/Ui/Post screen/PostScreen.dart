import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text('Post Apis'),
        centerTitle: true,
      ),
      body: BlocBuilder(
          builder: (context,state){
            return ListView.builder(
                itemBuilder: (context,index){
                 return ListTile();

            });

          }),
    );
  }
}
