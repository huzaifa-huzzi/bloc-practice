import 'package:bloc_practice/Bloc/Posts%20Api/posts_bloc.dart';
import 'package:bloc_practice/Bloc/Posts%20Api/posts_event.dart';
import 'package:bloc_practice/Bloc/Posts%20Api/posts_state.dart';
import 'package:bloc_practice/Utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PostBloc>().add(PostFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text('Post Apis'),
        centerTitle: true,
      ),
      body: BlocBuilder<PostBloc,PostState>(
          builder: (context,state){
            switch(state.postStatus){
              case PostStatus.loading :
                return const  CircularProgressIndicator();
              case PostStatus.failure:
                return  Text(state.message.toString());
              case PostStatus.success:
                return  Column(
                  children: [
                    TextFormField(
                      decoration:const  InputDecoration(
                        hintText: 'Enter with email',
                        border: OutlineInputBorder()
                      ),
                      onChanged: (filterKey){
                       context.read<PostBloc>().add(SearchItem(filterKey));
                      },
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.postList.length,
                          itemBuilder: (context,index){
                          final item = state.postList[index];
                            return 
                                 Card(
                                   child: ListTile(
                                      title: Text(item.email.toString()),
                                      subtitle: Text(item.body.toString()),
                                      
                                    ),
                                 );
                      
                          }),
                    ),
                  ],
                );
            }


          }),
    );
  }
}
