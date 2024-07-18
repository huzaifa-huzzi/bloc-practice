import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:bloc/bloc.dart';
import 'package:bloc_practice/Bloc/Posts%20Api/posts_event.dart';
import 'package:bloc_practice/Bloc/Posts%20Api/posts_state.dart';
import 'package:bloc_practice/Repository/PostRepository.dart';
import 'package:bloc_practice/Utils/enum.dart';
import 'package:bloc_practice/model/PostModel.dart';


class PostBloc extends Bloc<PostEvent,PostState>{

   final PostRepository  postRepository = PostRepository();
   List<PostModel> tempPostList = [] ;

  PostBloc():super(const PostState()){
    on<PostFetched>(_postFetched);
    on<SearchItem>(_filterList);
  }

   void _postFetched(PostFetched event ,Emitter<PostState>emit)async{

   await  postRepository.fetchPost().then((value){
      emit(state.copyWith(
        postStatus: PostStatus.success,
        message: 'Your data is fetched successfully',
        postList: value
      ));
    }).onError((error,stackTrace){
      print(error);
      print(stackTrace);
       emit(state.copyWith(postStatus: PostStatus.failure,message: error.toString()));
    });

   }

   // This is second ftn
   void _filterList(SearchItem event ,Emitter<PostState>emit)async{

          if(event.search.isEmpty){
            emit(state.copyWith(tempPostList: [],searchMessage: ''));
          }else{
           // tempPostList = state.postList.where((element) => element.email.toString() == event.search.toString()).toList();
            tempPostList = state.postList.where((element) => element.email.toString().toLowerCase().contains(event.search.toLowerCase())).toList();
              if(tempPostList.isEmpty){
                emit(state.copyWith(tempPostList: tempPostList,searchMessage: 'No data found'));
              }else{
                emit(state.copyWith(tempPostList: tempPostList,searchMessage: ''));
              }
          }
   }

}
