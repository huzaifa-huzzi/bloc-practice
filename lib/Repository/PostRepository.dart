import 'dart:convert';

import 'package:bloc_practice/model/PostModel.dart';
import 'package:http/http.dart'as http;

class PostRepository {

  Future<List<PostModel>> fetchPost()async {
    
    try {
      final response =await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));

      if(response.statusCode == 200) {
        final body = jsonDecode(response.body) as List;
        return body.map((e){
          return PostModel(
            postId: e['postId'],
            email: e['title'] as String,
            body: e['body'] as String,
          );
        }).toList();
      }

    }catch (e){
      
    }
    
    
  }


}