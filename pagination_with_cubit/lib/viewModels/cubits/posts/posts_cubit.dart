import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pagination_with_cubit/models/post.dart';
import 'package:pagination_with_cubit/viewModels/database/network/dio_helper.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(PostsInitial());

  static PostsCubit get(context) => BlocProvider.of(context);
  int page = 1;
  List<Post> postsList = [];

  Future<List<Post>> fetchPosts(int page) async {
    emit(LoadingFetchPosts());
    await DioHelper()
        .getData(
            url:
                "https://jsonplaceholder.typicode.com/posts?_limit=5&_page=$page")
        .then((response) {
      final data = response.data as List<dynamic>;
      postsList = data.map((e) => Post.fromJson(e)).toList();
      emit(SuccessFetchPosts());
    }).catchError((error) {
      emit(FailedFetchPosts());
    });
    return postsList;
  }
}
