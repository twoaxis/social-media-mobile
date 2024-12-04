import 'package:flutter/material.dart';
import 'package:social_media_mobile/models/post.dart';
import 'package:social_media_mobile/models/user.dart';
import 'package:social_media_mobile/ui/components/common/appbar/custom_app_bar.dart';
import 'package:social_media_mobile/ui/components/common/navigation/custom_bottom_navbar.dart';
import 'package:social_media_mobile/ui/components/common/post/post_tile.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          CustomAppBar(
            title: '',
            image: 'assets/images/logo.png',
            isCenter: true,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => PostTile(
                post: Post(
                  author: User(
                    username: 'ahmed',
                    name: 'ahmed',
                    id: 15,
                  ),
                  id: 1,
                  createdAt: DateTime.now(),
                  commentCount: 10,
                  likeCount: 10,
                  userName: 'ahmed',
                  content: 'Hello World',
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavbar.bottomNavBar(),
    );
  }
}
