import 'package:social_media_mobile/models/user.dart';

class Post {
  int id;
  final String userName;
  final String content;
  final int likeCount;
  final int commentCount;
  final String imageUrl;
  DateTime createdAt;
  User author;

  Post({
    required this.userName,
    required this.content,
    this.likeCount = 10,
    this.commentCount = 10,
    this.imageUrl = '',
    required this.id,
    required this.createdAt,
    required this.author,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(

      id: json['id'],
      content: json['content'],
      createdAt: DateTime.parse(json['createdAt']),
      author: User.fromJson(json['author']),
      
      userName: json['userName'],
      likeCount: json['likeCount'],
      commentCount: json['commentCount'],
      imageUrl: json['imageUrl'],
    );
  }
}
