import 'package:bloc_practice/Utils/enum.dart';
import 'package:bloc_practice/model/PostModel.dart';
import 'package:equatable/equatable.dart';


class PostState extends Equatable {

  final PostStatus postStatus ;
  final List<PostModel> postList ;
  final List<PostModel> tempPostList ;
  final String message;

  const PostState({
    this.postStatus = PostStatus.loading,
    this.postList = const <PostModel>[],
    this.tempPostList = const <PostModel>[],
    this.message = '',
});

  PostState copyWith({PostStatus? postStatus , List<PostModel>? postList , String? message,List<PostModel>? tempPostList}){
    return PostState(
    postList:postList ?? this.postList ,
    postStatus:postStatus ?? this.postStatus ,
    message:message ?? this.message,
      tempPostList: tempPostList ?? this.tempPostList,
    );
}

  @override
  List<Object> get props => [postList,postStatus,message,tempPostList];

}
