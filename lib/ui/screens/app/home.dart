import 'package:flutter/material.dart';
import 'package:social_media_mobile/models/post.dart';
import 'package:social_media_mobile/ui/components/common/post_tile.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return PostTile(
            post: Post(
              commentCount: 23,
              likeCount: 10,
              postContent: 'Hello World',
              profileImageUrl:
                  'https://static.vecteezy.com/system/resources/previews/005/544/718/original/profile-icon-design-free-vector.jpg',
              userName: 'John Doe',
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
