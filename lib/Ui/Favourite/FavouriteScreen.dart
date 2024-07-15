import 'package:bloc_practice/Bloc/Favourite/favourite_bloc.dart';
import 'package:bloc_practice/Bloc/Favourite/favourite_event.dart';
import 'package:bloc_practice/Bloc/Favourite/favourite_state.dart';
import 'package:bloc_practice/model/Favourite_item_model.dart';
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
        actions: [
          BlocBuilder<FavouriteBloc,FavouriteState>(
              builder: (context,state){
              return  Visibility(
                visible: state.tempFavouriteItemList.isNotEmpty ? true : false,
                child: IconButton(onPressed: (){
                 context.read<FavouriteBloc>().add(DeleteItem());
                }, icon:const  Icon(Icons.delete,color: Colors.red,)),
              );
          })

        ],
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
                  return ListView.builder(
                    itemCount: state.favouriteItemList.length,
                       itemBuilder: (context,index){
                         final item = state.favouriteItemList[index];
                         return Card(
                           child: ListTile(
                             leading: Checkbox(value: state.tempFavouriteItemList.contains(item) ? true : false, onChanged: (value){
                               if(value!){
                                 context.read<FavouriteBloc>().add(CheckBoxEvent(item: item));
                               }else{
                                 context.read<FavouriteBloc>().add(UnCheckBoxEvent(item: item));
                               }
                             }),
                             title: Text(item.value.toString()),
                             trailing: IconButton(onPressed: (){
                               FavouriteItemModel itemModel = FavouriteItemModel(id: item.id, value: item.value,isFavourite: item.isFavourite ? false : true);
                               context.read<FavouriteBloc>().add(FavouriteItem(item: itemModel ));
                             }, icon:Icon(item.isFavourite ? Icons.favorite : Icons.favorite_outline_rounded)),
                           ),
                         );
                       });
                 case ListStatus.values :
                  return const  SizedBox();
               }
            }),
      ),
    );
  }
}
