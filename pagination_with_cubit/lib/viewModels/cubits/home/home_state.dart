part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class PostsLoaded extends HomeState {
  final List<Post> postsList;

  PostsLoaded(this.postsList);
}

class PostsLoading extends HomeState {
  final List<Post> oldPostsList;
  final bool isFirstFetch;

  PostsLoading(this.oldPostsList, this.isFirstFetch);
}

class SetupScrollControllerState extends HomeState {}
