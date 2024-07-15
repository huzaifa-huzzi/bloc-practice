import 'package:bloc/bloc.dart';
import 'package:bloc_practice/Bloc/Favourite/favourite_event.dart';
import 'package:bloc_practice/Bloc/Favourite/favourite_state.dart';
import 'package:bloc_practice/Repository/favourite_repositor.dart';

import '../../model/Favourite_item_model.dart';


class FavouriteBloc extends Bloc<FavouriteEvent,FavouriteState> {

   List<FavouriteItemModel> favouriteList = [] ;
 final  FavouriteRepository favouriteRepository ;
  FavouriteBloc(this.favouriteRepository) :super(const FavouriteState()){
    on<FavouriteList>(_fetchFavouriteList);
  }

  void _fetchFavouriteList(FavouriteEvent event , Emitter<FavouriteState>emit)async{
    favouriteList =await favouriteRepository.fetchItem();
    emit(state.copyWith(favouriteItemList: List.from(favouriteList) ,listStatus: ListStatus.success ));
  }

}
