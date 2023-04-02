import 'package:dartz/dartz.dart';
import 'package:flutter_reddit_app/core/domain/errors/failure.dart';
import 'package:flutter_reddit_app/features/post/domain/entities/posts_list.dart';

abstract class PostRepository {
  Future<Either<Failure,PostsList>> getPosts();
}