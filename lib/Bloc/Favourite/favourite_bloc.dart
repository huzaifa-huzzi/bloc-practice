import 'package:bloc/bloc.dart';
import 'package:bloc_practice/Bloc/Favourite/favourite_event.dart';
import 'package:bloc_practice/Bloc/Favourite/favourite_state.dart';
import 'package:bloc_practice/Repository/favourite_repositor.dart';

import '../../model/Favourite_item_model.dart';


class FavouriteBloc extends Bloc<FavouriteEvent,FavouriteState> {

   List<FavouriteItemModel> favouriteList = [] ;
   List<FavouriteItemModel> tempFavouriteList = [] ;
 final  FavouriteRepository favouriteRepository ;
  FavouriteBloc(this.favouriteRepository) :super(const FavouriteState()){
    on<FavouriteList>(_fetchFavouriteList);
    on<FavouriteItem>(_favouriteItem);
    on<CheckBoxEvent>(_selectItem);
    on<UnCheckBoxEvent>(_unSelectItem);
    on<DeleteItem>(_deleteItem);
  }

  void _fetchFavouriteList(FavouriteEvent event , Emitter<FavouriteState>emit)async{
    favouriteList =await favouriteRepository.fetchItem();
    emit(state.copyWith(favouriteItemList: List.from(favouriteList) ,listStatus: ListStatus.success ));
  }
  void _favouriteItem(FavouriteItem event ,Emitter<FavouriteState> emit){
   final index = favouriteList.indexWhere((elemnt) => elemnt.id == event.item.id);

   if(event.item.isFavourite){
      if(tempFavouriteList.contains(favouriteList[index])){
        tempFavouriteList.remove(favouriteList[index]);
        tempFavouriteList.add(event.item);
      }

   }else{

     if(tempFavouriteList.contains(favouriteList[index])){
       tempFavouriteList.remove(favouriteList[index]);
       tempFavouriteList.add(event.item);
     }


   }
   favouriteList[index] = event.item ;
   emit(state.copyWith(favouriteItemList: List.from(favouriteList),tempFavouriteItemList: List.from(tempFavouriteList) ));
  }
   void _selectItem (CheckBoxEvent event ,Emitter<FavouriteState> emit){
    tempFavouriteList.add(event.item);
     emit(state.copyWith(favouriteItemList: List.from(tempFavouriteList)));
   }
   void _unSelectItem (UnCheckBoxEvent event ,Emitter<FavouriteState> emit){
     tempFavouriteList.remove(event.item);
     emit(state.copyWith(favouriteItemList: List.from(tempFavouriteList)));
   }
   void  _deleteItem (DeleteItem event ,Emitter<FavouriteState> emit){
     for(int i = 0; i<tempFavouriteList.length ; i++){
       favouriteList.remove(tempFavouriteList[i]);
     }
     tempFavouriteList.clear();
     emit(state.copyWith(
         favouriteItemList: List.from(favouriteList),
       tempFavouriteItemList: List.from(tempFavouriteList),
     ));
   }
}
