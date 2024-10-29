class Post {
  final String profileImageUrl;
  final String userName;
  final String postContent;
  final int likeCount;
  final int commentCount;
  final String imageUrl;

  Post({
    required this.profileImageUrl,
    required this.userName,
    required this.postContent,
    required this.likeCount,
    required this.commentCount,
     this.imageUrl = '',
  });
}