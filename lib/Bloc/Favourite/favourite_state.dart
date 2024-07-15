import 'package:bloc_practice/model/Favourite_item_model.dart';
import 'package:equatable/equatable.dart';

enum ListStatus{loading,success,failure}
class FavouriteState extends Equatable {

   final List<FavouriteItemModel> favouriteItemList ;
   final List<FavouriteItemModel> tempFavouriteItemList ;
   final ListStatus listStatus ;
   const FavouriteState({
     this.favouriteItemList =const  [],
     this.listStatus = ListStatus.loading,
     this.tempFavouriteItemList = const [],
   });


     FavouriteState copyWith({List<FavouriteItemModel>? favouriteItemList ,ListStatus? listStatus,List<FavouriteItemModel>? tempFavouriteItemList}){
       return FavouriteState(
       favouriteItemList: favouriteItemList ?? this.favouriteItemList,
         listStatus: listStatus ?? this.listStatus,
         tempFavouriteItemList: tempFavouriteItemList ?? this.tempFavouriteItemList
       );
}
     @override
     List<Object?> get props => [favouriteItemList,listStatus,tempFavouriteItemList];

}
