import 'package:bloc_practice/Bloc/Favourite/favourite_bloc.dart';
import 'package:bloc_practice/Bloc/Favourite/favourite_event.dart';
import 'package:bloc_practice/Bloc/Favourite/favourite_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FavouriteBloc>().add(FavouriteList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text('Favourite Screen'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<FavouriteBloc,FavouriteState>(
            builder: (context,state){
               switch(state.listStatus){
                 case ListStatus.loading :
                   return const CircularProgressIndicator();
                 case ListStatus.failure :
                   return const Center(child: Text('something went wrong'),);
                 case ListStatus.success :
                   ListView.builder(
                       itemBuilder: (context,index){
                         final item = state.favouriteItemList[index];
                         return Card(
                           child: ListTile(
                             title: Text(item.value.toString()),
                             trailing: IconButton(onPressed: (){}, icon:const  Icon(Icons.favorite_outline)),
                           ),
                         );
                       });
               }
            }),
      ),
    );
  }
}
