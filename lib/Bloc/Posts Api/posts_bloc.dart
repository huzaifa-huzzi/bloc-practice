import 'package:bloc/bloc.dart';
import 'package:bloc_practice/Bloc/Posts%20Api/posts_event.dart';
import 'package:bloc_practice/Bloc/Posts%20Api/posts_state.dart';
import 'package:bloc_practice/Repository/PostRepository.dart';
import 'package:bloc_practice/Utils/enum.dart';


class PostBloc extends Bloc<PostEvent,PostState>{

   final PostRepository  postRepository = PostRepository();

  PostBloc():super(const PostState()){
    on<PostFetched>(_postFetched);
  }

   void _postFetched(PostFetched event ,Emitter<PostState>emit){

    postRepository.fetchPost().then((value){
      emit(state.copyWith(
        postStatus: PostStatus.success,
        message: 'Your data is fetched successfully',
        postList: value
      ));
    }).onError((error,stackTrace){
       emit(state.copyWith(postStatus: PostStatus.failure,message: error.toString()));
    });

   }

}
