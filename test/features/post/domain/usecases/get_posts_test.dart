import 'package:dartz/dartz.dart';
import 'package:flutter_reddit_app/core/domain/errors/failure.dart';
import 'package:flutter_reddit_app/core/domain/usecases/usecase.dart';
import 'package:flutter_reddit_app/features/post/domain/usecases/get_posts.dart';
import 'package:flutter_reddit_app/features/post/domain/entities/post.dart';
import 'package:flutter_reddit_app/features/post/domain/entities/posts_list.dart';
import 'package:flutter_reddit_app/features/post/domain/repositories/post_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

@GenerateNiceMocks([MockSpec<PostRepository>()]) // flutter pub run build_runner build
import 'get_posts_test.mocks.dart';
void main() {
  late PostsGetter usecase;
  late MockPostRepository mockPostRepository;

  setUp(() {
    mockPostRepository = MockPostRepository();
    usecase = PostsGetter(mockPostRepository);
  });

  final tPost = Post(thumbnailImage: "linkTest", url: "linkTest", title: 'titleTest', author: 'authorTest', score: 1, comments: 24, dateOfCreation: DateTime(2023,1,1,8,24));

  test(
    'should get post from the repository',
    () async {
      // arrange
      when(mockPostRepository.getPosts()).thenAnswer((_) async => Right(PostsList([tPost])));
      // act
      final result = await usecase(NoParams());
      // assert
      expect(result, Right<Failure, PostsList> (PostsList([tPost])));
      verify(mockPostRepository.getPosts());
      verifyNoMoreInteractions(mockPostRepository);
    }
  );

  
}