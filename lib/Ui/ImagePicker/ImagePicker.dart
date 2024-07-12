import 'dart:io';

import 'package:bloc_practice/Bloc/Image/image_bloc.dart';
import 'package:bloc_practice/Bloc/Image/image_event.dart';
import 'package:bloc_practice/Bloc/Image/image_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class ImagePicker extends StatefulWidget {
  const ImagePicker({super.key});

  @override
  State<ImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Image Picker Bloc'),
      ),
      body: Center(
        child: BlocBuilder<ImageBloc,ImageState>(
            builder:(context,state) {
              if(state.file == null){
                return InkWell(
                  onTap: (){
                   context.read<ImageBloc>().add(CameraImage());
                  },
                  child:const  CircleAvatar(
                    child: Icon(Icons.camera),
                  ),
                );
              }else{
                 return Image.file(File(state.file!.path.toString()));
              }
            },),
      ),
    );
  }
}
