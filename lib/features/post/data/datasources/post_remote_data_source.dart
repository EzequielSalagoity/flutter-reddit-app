import 'dart:convert';

import 'package:flutter_reddit_app/core/domain/errors/exceptions.dart';
import 'package:flutter_reddit_app/features/post/data/models/post_model.dart';
import 'package:http/http.dart' as http;

abstract class PostRemoteDataSource {
  // Calls the https://api.reddit.com/r/pics/hot.json endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<PostModel>> getPosts();
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final http.Client client;

  PostRemoteDataSourceImpl({required this.client});
  @override
  Future<List<PostModel>> getPosts() async {
    final response = await client.get(
        Uri.parse( "https://api.reddit.com/r/pics/hot.json"),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      // response['data']['dist'] has 25 posts
      final Map<String, dynamic> responseBody = json.decode(response.body);
      final List<Map<String, dynamic>> posts = List<Map<String, dynamic>>.from(responseBody['data']['children']);
      return posts
          .map((post) => PostModel.fromJson(post['data']))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
