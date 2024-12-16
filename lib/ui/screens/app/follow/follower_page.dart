import 'package:flutter/material.dart';
import 'package:social_media_mobile/models/user.dart';
import 'package:social_media_mobile/ui/components/common/follow/follower_tile.dart';

class FollowerPage extends StatefulWidget {
  const FollowerPage({super.key, required this.users});
  final List<User> users;

  @override
  State<FollowerPage> createState() => _FollowerPageState();
}

class _FollowerPageState extends State<FollowerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Followers'),
      ),
      body: (widget.users.isEmpty)
          ? const Center(
              child: Text('No followings yet.'),
            )
          : ListView.builder(
              itemCount: widget.users.length,
              itemBuilder: (context, index) {
                return Followers(
                  user: widget.users[index],
                );
              },
            ),
    );
  }
}
