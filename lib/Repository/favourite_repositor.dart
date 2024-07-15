
import 'package:bloc_practice/model/Favourite_item_model.dart';

class FavouriteRepository {
  
  Future<List<FavouriteItemModel>> fetchItem() async {
    await Future.delayed(const Duration(seconds: 3));
    return List.of(_generalList(10));
  }
  
  List<FavouriteItemModel> _generalList(int length){
    return List.generate(length, (index) => FavouriteItemModel(id: index.toString(), value: 'Item $index'));
  }
  
}