import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_with_cubit/models/post.dart';
import 'package:pagination_with_cubit/viewModels/cubits/home/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homeCubit = HomeCubit.get(context);
    homeCubit.setupScrollController(context);
    homeCubit.loadPosts();
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is PostsLoading && state.isFirstFetch) {
            return _loadingIndicator();
          }
          List<Post> posts = [];
          bool isLoading = false;

          if (state is PostsLoading) {
            posts = state.oldPostsList;
            isLoading = true;
          } else if (state is PostsLoaded) {
            posts = state.postsList;
          }
          return ListView.separated(
            controller: homeCubit.scrollController,
            itemCount: posts.length + (isLoading ? 1 : 0),
            itemBuilder: (context, index) {
              print(homeCubit.page);
              if (index < posts.length) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${posts[index].id}. ${posts[index].title}",
                        style: const TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10.0),
                      Text(posts[index].body)
                    ],
                  ),
                );
              } else {
                Timer(const Duration(milliseconds: 30), () {
                  homeCubit.scrollController.jumpTo(
                      homeCubit.scrollController.position.maxScrollExtent);
                });
                return _loadingIndicator();
              }
            },
            separatorBuilder: (context, index) =>
                Divider(color: Colors.grey.shade400),
          );
        },
      ),
    );
  }

  Widget _loadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
