import 'package:social_media_mobile/models/post.dart';

class ProfileModel {
  int id;
  String name;
  String username;
  String bio;
  int followerCount;
  int followingCount;
  List<Post> posts;
  bool isFollowing;

  ProfileModel({
    required this.name,
    required this.username,
    required this.followerCount,
    required this.followingCount,
    required this.posts,
    required this.id,
    this.isFollowing = false,
    required this.bio,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name'] ?? 'name',
      username: json['username'] ?? 'username',
      bio: json['bio'] ?? 'Hello, I am using TwoAxis Social Media App',
      followerCount: json['followerCount'] ?? 0,
      followingCount: json['followingCount'] ?? 0,
      posts: (json['posts'] as List<dynamic>?)
              ?.map((x) => Post.fromJson(x as Map<String, dynamic>))
              .toList() ??
          [],
      id: json['id'] ?? 0,
    );
  }
}