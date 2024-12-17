import 'package:flutter/material.dart';
import 'package:social_media_mobile/models/user.dart';
import 'package:social_media_mobile/ui/components/common/follow/following_tile.dart';

class FollowingPage extends StatefulWidget {
  const FollowingPage({super.key, required this.users});

  final List<User> users;

  @override
  State<FollowingPage> createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Followings'),
      ),
      body: (widget.users.isEmpty)
          ? const Center(
              child: Text('No followings yet.'),
            )
          : ListView.builder(
              itemCount: widget.users.length,
              itemBuilder: (context, index) {
                return Followings(
                  user: widget.users[index],
                );
              },
            ),
    );
  }
}
