import 'package:bloc_practice/model/Favourite_item_model.dart';
import 'package:equatable/equatable.dart';


abstract class FavouriteEvent extends Equatable {
  const FavouriteEvent();

  @override
  List<Object> get props => [];
}

class FavouriteList extends FavouriteEvent {}
class FavouriteItem extends FavouriteEvent {
  final FavouriteItemModel item ;
 const  FavouriteItem({required this.item});
}
class CheckBoxEvent extends FavouriteEvent {
  final FavouriteItemModel item ;
  const CheckBoxEvent({required this.item});
}
class UnCheckBoxEvent extends FavouriteEvent {

    final FavouriteItemModel item ;
    const UnCheckBoxEvent({required this.item});
}
class  DeleteItem extends FavouriteEvent {}