part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class Empty extends PostState {}

class Loading extends PostState {}

class Loaded extends PostState {
  final PostsList posts;

  const Loaded(this.posts);
}

class Error extends PostState {
  final String message;

  const Error(this.message);
}
