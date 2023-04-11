import 'dart:convert';

import 'package:flutter_reddit_app/core/domain/errors/exceptions.dart';
import 'package:flutter_reddit_app/features/post/data/datasources/post_remote_data_source.dart';
import 'package:flutter_reddit_app/features/post/data/models/post_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
// import 'package:mockito/mockito.dart';
import '../../../../fixtures/fixture_reader.dart';
import 'package:http/http.dart' as http;

@GenerateNiceMocks([
  MockSpec<http.Client>(),
]) // flutter pub run build_runner build
import "post_remote_data_source_impl_test.mocks.dart";

void main() {
  late PostRemoteDataSourceImpl dataSource;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = PostRemoteDataSourceImpl(client: mockHttpClient);
  });

  void setUpMockClientSuccess200() {
    when(mockHttpClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response(fixture("posts.json"), 200));
  }

  void setUpMockClientFailure404() {
    when(mockHttpClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response("Something went wrong", 404));
  }

  group('getPosts', () {
    final tPostModel = PostModel.fromJson(json.decode(fixture('post.json')));

    // Comentar respuesta de 
    test(
        'should perform GET request on a URL with a topic being the endpoint and with application/json header',
        () async {
      // arrange
      setUpMockClientSuccess200();
      // act
      await dataSource.getPosts();
      // assert
      verify(mockHttpClient.get(
          Uri.parse("https://api.reddit.com/r/pics/hot.json"),
          headers: {'Content-Type': 'application/json'}));
    });

    test('should return Post when the response code is 200 (success)',
        () async {
      // arrange
      setUpMockClientSuccess200();
      // act
      final result = await dataSource.getPosts();
      // assert
      expect(result, [tPostModel]);
    });
    test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
      // arrange
      setUpMockClientFailure404();
      // act
      final call = dataSource.getPosts;
      // assert
      expect(call, throwsA(const TypeMatcher<ServerException>()));
    });
  });
}
