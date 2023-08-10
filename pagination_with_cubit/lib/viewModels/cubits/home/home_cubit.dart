import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_with_cubit/models/post.dart';
import 'package:pagination_with_cubit/viewModels/cubits/posts/posts_cubit.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final PostsCubit postsCubit;
  HomeCubit(this.postsCubit) : super(HomeInitial());
  // Listen must Be false
  static HomeCubit get(context) => BlocProvider.of(context, listen: false);
  final ScrollController scrollController = ScrollController();
  int page = 1;
  loadPosts() {
    if (state is PostsLoading) return;
    final currentState = state;
    var oldPostsList = <Post>[];
    if (currentState is PostsLoaded) {
      oldPostsList = currentState.postsList;
    }
    emit(PostsLoading(oldPostsList, page == 1));
    postsCubit.fetchPosts(page).then((newPostsList) {
      page++;
      final posts = (state as PostsLoading).oldPostsList;
      posts.addAll(newPostsList);
      emit(PostsLoaded(posts));
    });
  }

  setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          loadPosts();
        }
      }
    });
  }
}
