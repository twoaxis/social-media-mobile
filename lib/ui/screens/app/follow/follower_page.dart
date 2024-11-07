import 'package:flutter/material.dart';
import 'package:social_media_mobile/models/user.dart';
import 'package:social_media_mobile/ui/components/common/appbar/custom_sliver_app_bar.dart';
import 'package:social_media_mobile/ui/components/common/follow/follower_tile.dart';

class FollowerPage extends StatelessWidget {
  const FollowerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 10,
              (context, index) => Followers(
                user: User(
                  username: '',
                  name: 'Eldeeb',
                  id: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
