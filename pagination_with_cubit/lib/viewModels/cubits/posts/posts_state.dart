part of 'posts_cubit.dart';

@immutable
abstract class PostsState {}

class PostsInitial extends PostsState {}

class LoadingFetchPosts extends PostsState {}

class SuccessFetchPosts extends PostsState {}

class FailedFetchPosts extends PostsState {}
