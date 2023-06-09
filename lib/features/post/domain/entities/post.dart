import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final String thumbnailImage;
  final String url;
  final String title;
  final String author;
  final int score;
  final int comments;
  final DateTime dateOfCreation;

  const Post(
      {required this.thumbnailImage,
      required this.url,
      required this.title,
      required this.author,
      required this.score,
      required this.comments,
      required this.dateOfCreation});

  @override
  List<Object?> get props =>
      [thumbnailImage, url, title, author, score, comments, dateOfCreation];
}
