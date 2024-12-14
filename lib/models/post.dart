import 'package:social_media_mobile/models/comment_model.dart';
import 'package:social_media_mobile/models/user.dart';

class Post {
  List<CommentModel> comments = [];
  final int id;
  final String content;
  final int likeCount;
  final int commentCount;
  final bool isLiked;
  DateTime createdAt;
  User author;

  Post({
    required this.comments,
    required this.content,
    this.likeCount = 10,
    this.commentCount = 10,
    required this.isLiked,
    required this.id,
    required this.createdAt,
    required this.author,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] ?? 0,
      content: json['content'] ?? '',
      createdAt: DateTime.parse(json['createdAt'] ?? ''),
      author: User.fromJson(json['author']),
      likeCount: json['likeCount'] ?? 0,
      commentCount: json['commentCount'] ?? 0,
      isLiked: json['isLiked'],
      comments: json['comments'] != null
          ? List.generate(json['comments'].length,
              (index) => CommentModel.fromJson(json['comments'][index]))
          : [],
    );
  }
}
