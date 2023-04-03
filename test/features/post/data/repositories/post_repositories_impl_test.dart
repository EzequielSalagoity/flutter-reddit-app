import 'package:dartz/dartz.dart';
import 'package:flutter_reddit_app/core/domain/errors/exceptions.dart';
import 'package:flutter_reddit_app/core/domain/errors/failure.dart';
import 'package:flutter_reddit_app/core/domain/network/network_info.dart';
import 'package:flutter_reddit_app/features/post/data/datasources/post_remote_data_source.dart';
import 'package:flutter_reddit_app/features/post/data/models/post_model.dart';
import 'package:flutter_reddit_app/features/post/data/repositories/post_repository_impl.dart';
import 'package:flutter_reddit_app/features/post/domain/entities/post.dart';
import 'package:flutter_reddit_app/features/post/domain/entities/posts_list.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([
  MockSpec<PostRemoteDataSource>(),
  MockSpec<NetworkInfo>()
]) // flutter pub run build_runner build
import 'post_repositories_impl_test.mocks.dart';

void main() {
  late PostRepositoryImpl repository;
  late MockPostRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockPostRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = PostRepositoryImpl(
        remoteDataSource: mockRemoteDataSource, networkInfo: mockNetworkInfo);
  });

  group('getPost', () {
    final tPostModel = PostModel(
        thumbnailImage:
            "https://b.thumbs.redditmedia.com/-zlGHAiCDo23OjfMiAoztQV26byIKvE0NAHkazBlsnU.jpg",
        title: "This is a post title",
        author: "TestAuthor",
        score: 12345,
        comments: 234,
        dateOfCreation: DateTime.fromMillisecondsSinceEpoch(1680411633 * 1000,
            isUtc: true));

    final Post tPost = tPostModel;
    test('should check if the device is online', () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // act
      final result = repository.getPosts();
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        // arrange
        when(mockRemoteDataSource.getPosts())
            .thenAnswer((_) async => [tPostModel]);
        // act
        final result = await repository.getPosts();
        // assert
        verify(mockRemoteDataSource.getPosts());
        expect(result, Right(PostsList([tPostModel])));
      });

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // arrange
          when(mockRemoteDataSource.getPosts()).thenThrow(ServerException());
          // act
          final result = await repository.getPosts();
          // assert
          verify(mockRemoteDataSource.getPosts());
          verifyNoMoreInteractions(mockRemoteDataSource);
          expect(result, const Left(ServerFailure("Server failure")));
        }
        );
    });

    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

       test(
          'should return no internet failure when the call to getPost is unsuccessful',
          () async {
        // act
        final result = await repository.getPosts();
        // assert
        verify(repository.getPosts());
        expect(result, const Left(NoInternetFailure("No internet failure")));
      });
    });
  });
}
