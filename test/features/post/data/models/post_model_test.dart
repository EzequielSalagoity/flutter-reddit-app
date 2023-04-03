import 'dart:convert';
import 'package:flutter_reddit_app/features/post/data/models/post_model.dart';
import 'package:flutter_reddit_app/features/post/domain/entities/post.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tPostModel = PostModel(
      thumbnailImage:
          "https://b.thumbs.redditmedia.com/-zlGHAiCDo23OjfMiAoztQV26byIKvE0NAHkazBlsnU.jpg",
      title: "This is a post title",
      author: "TestAuthor",
      score: 12345,
      comments: 234,
      dateOfCreation:
          DateTime.fromMillisecondsSinceEpoch(1680411633 * 1000, isUtc: true));

  test('should be a subclass of Post entity', () async {
    // assert
    expect(tPostModel, isA<Post>());
  });

  group('fromJson', () {
    test('should return a valid model', () async {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture("post.json"));
      // act
      final result = PostModel.fromJson(jsonMap);
      // assert
      expect(result, tPostModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing the proper data', () async {
      // act
      final result = tPostModel.toJson();
      // assert
      final expectedMap = {
        "thumbnailImage":
            "https://b.thumbs.redditmedia.com/-zlGHAiCDo23OjfMiAoztQV26byIKvE0NAHkazBlsnU.jpg",
        "title": "This is a post title",
        "author": "TestAuthor",
        "score": 12345,
        "comments": 234,
        "dateOfCreation": 1680411633
      };
      expect(result, expectedMap);
    });
  });
}
