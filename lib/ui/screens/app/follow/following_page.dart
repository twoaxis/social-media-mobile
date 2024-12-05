import 'package:flutter/material.dart';
import 'package:social_media_mobile/models/user.dart';
import 'package:social_media_mobile/ui/components/common/follow/following_tile.dart';

class FollowingPage extends StatelessWidget {
  const FollowingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => Following(
                user: User(
                    username: '',
                    name: 'Hegazy',
                    id: 2,
                  ),
                ),
              ),
          ),
        ],
      ),
    );
  }
}
