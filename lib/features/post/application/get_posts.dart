import 'package:dartz/dartz.dart';
import 'package:flutter_reddit_app/core/domain/errors/failure.dart';
import 'package:flutter_reddit_app/core/domain/usecase.dart';
import 'package:flutter_reddit_app/features/post/domain/entities/posts_list.dart';
import 'package:flutter_reddit_app/features/post/domain/repositories/post_repository.dart';

class GetPosts implements UseCase<PostsList, NoParams>{
  final PostRepository postRepository;

  GetPosts(this.postRepository);

  @override
  Future<Either<Failure,PostsList>> call(NoParams params) async {
    return await postRepository.getPosts();
  }
}
