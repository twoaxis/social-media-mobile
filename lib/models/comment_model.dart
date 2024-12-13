import 'package:social_media_mobile/models/user.dart';

class CommentModel {
  int? id;
  String? content;
  String? createdAt;
  User? author;

  CommentModel({
    required this.id,
    required this.content,
    required this.createdAt,
    required this.author,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        id: json['id'],
        content: json['content'],
        createdAt: json['createdAt'],
        author: User.fromJson(json['author']),
      );
}
