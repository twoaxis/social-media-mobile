import 'package:social_media_mobile/models/post.dart';

class ProfileModel {
  int id;
  String name;
  String username;
  int followerCount;
  int followingCount;
  List<Post> posts;

  ProfileModel({
    required this.name,
    required this.username,
    required this.followerCount,
    required this.followingCount,
    required this.posts,
    required this.id,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name'],
      username: json['username'],
      followerCount: json['followerCount'],
      followingCount: json['followingCount'],
      posts: List<Post>.from(
        json['posts'].map(
          (x) => Post.fromJson(x),
        ),
      ),
      id: json['id'],
    );
  }
}
