import 'package:equatable/equatable.dart';
import 'package:flutter_reddit_app/features/post/domain/entities/post.dart';

class PostsList extends Equatable{
  final List<Post> posts;

  PostsList(this.posts);

  bool get isEmpty => posts.isEmpty;

  int get length => posts.length;
  
  @override
  List<Object?> get props => [posts];
  
}