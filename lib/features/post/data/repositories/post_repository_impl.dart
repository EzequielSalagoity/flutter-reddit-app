import 'package:flutter_reddit_app/core/domain/errors/exceptions.dart';
import 'package:flutter_reddit_app/core/domain/network/network_info.dart';
import 'package:flutter_reddit_app/features/post/data/datasources/post_remote_data_source.dart';
import 'package:flutter_reddit_app/features/post/domain/entities/posts_list.dart';
import 'package:flutter_reddit_app/core/domain/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_reddit_app/features/post/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  PostRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, PostsList>> getPosts() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.getPosts();
        return Right(PostsList(remotePosts));
      } on ServerException {
        return const Left(ServerFailure("Server failure"));
      }
    } else {
      return const Left(NoInternetFailure("No internet failure"));
    }
  }
}
