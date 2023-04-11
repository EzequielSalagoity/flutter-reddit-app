import 'package:flutter_reddit_app/features/post/domain/entities/post.dart';

class PostModel extends Post {
  const PostModel(
      {required super.thumbnailImage,
      required super.url,
      required super.title,
      required super.author,
      required super.score,
      required super.comments,
      required super.dateOfCreation});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    int dateOfCreation = (json['created_utc'] as num).toInt();
    return PostModel(
        thumbnailImage: json['thumbnail'], 
        url: json['url'],
        title: json['title'],
        author: json['author'],
        score: json['score'],
        comments: json['num_comments'],
        dateOfCreation: DateTime.fromMillisecondsSinceEpoch(
            dateOfCreation * 1000,
            isUtc: true));
  }

  Map<String, dynamic> toJson() {
    return {
      "thumbnailImage": thumbnailImage,
      "url": url,
      "title": title,
      "author": author,
      "score": score,
      "comments": comments,
      "dateOfCreation": dateOfCreation.millisecondsSinceEpoch~/1000,
    };
  }
}
