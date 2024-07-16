import 'package:bloc_practice/Utils/enum.dart';
import 'package:bloc_practice/model/PostModel.dart';
import 'package:equatable/equatable.dart';


class PostState extends Equatable {

  final PostStatus postStatus ;
  final List<PostModel> postList ;
  final String message;

  const PostState({
    this.postStatus = PostStatus.loading,
    this.postList = const <PostModel>[],
    this.message = '',
});

  PostState copyWith({PostStatus? postStatus , List<PostModel>? postList , String? message}){
    return PostState(
    postList:postList ?? this.postList ,
    postStatus:postStatus ?? this.postStatus ,
    message:message ?? this.message,
    );
}

  @override
  List<Object> get props => [postList,postStatus,message];

}
