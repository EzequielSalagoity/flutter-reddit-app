import 'package:dartz/dartz.dart';
import 'package:flutter_reddit_app/core/domain/errors/failure.dart';
import 'package:flutter_reddit_app/core/domain/usecases/usecase.dart';
import 'package:flutter_reddit_app/features/post/domain/entities/post.dart';
import 'package:flutter_reddit_app/features/post/domain/entities/posts_list.dart';
import 'package:flutter_reddit_app/features/post/domain/usecases/get_posts.dart';
import 'package:flutter_reddit_app/features/post/presentation/bloc/post_bloc.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

@GenerateNiceMocks([MockSpec<PostsGetter>()]) // flutter pub run build_runner build
import 'post_bloc_test.mocks.dart';
void main() {
  late PostBloc postBloc;
  late MockPostsGetter mockPostsGetter;

  setUp(() {
    mockPostsGetter = MockPostsGetter();
    postBloc = PostBloc(postsGetter: mockPostsGetter);
  });

  test('initialState should be Empty', () {
    // assert
    expect(postBloc.state, Empty());
  });

  group('PostsGetter', () {
    final tPost = Post(thumbnailImage: "linkTest", url: "linkTest", title: 'titleTest', author: 'authorTest', score: 1, comments: 24, dateOfCreation: DateTime(2023,1,1,8,24));
    test(
      'should get data from the PostsGetter usecase',
      () async {
        // arrange
        when(mockPostsGetter(any)).thenAnswer((_) async => Right(PostsList([tPost])));
        // act
        postBloc.add(GetPostsEvent());
        await untilCalled(mockPostsGetter(any));
        // assert
        verify(mockPostsGetter(NoParams()));
      }
      );

      test(
        'should emit [Loading, Loaded] when data is gotten successfully',
        () async {
          // arrange
          when(mockPostsGetter(any)).thenAnswer((_) async => Right(PostsList([tPost])));
          // assert later
          final expected = [Loading(), Loaded(PostsList([tPost]))];
          expectLater(postBloc.stream, emitsInOrder(expected));
          // act
          postBloc.add(GetPostsEvent());
        }
        );
      
      test(
        'should emit [Loading, Error] with a proper message for the error when getting data fails',
        () async {
          // arrange
          // when(mockPostsGetter(any)).thenAnswer((_) async => const Left(ServerFailure("Server failure")));
          when(mockPostsGetter(any)).thenAnswer((_) async => const Left(NoInternetFailure("No internet failure")));
          // assert later
          // final expected = [Loading(), const Error("Server failure")];
          final expected = [Loading(), const Error("No internet failure")];
          expectLater(postBloc.stream, emitsInOrder(expected));
          // act
          postBloc.add(GetPostsEvent());
        }
        );
  });
}