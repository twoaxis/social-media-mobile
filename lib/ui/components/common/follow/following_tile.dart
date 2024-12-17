import 'package:flutter/material.dart';
import 'package:social_media_mobile/models/user.dart';
import 'package:social_media_mobile/services/api_follow.dart';

bool isFollow = true;

class Followings extends StatefulWidget {
  final User user;

  const Followings({
    super.key,
    required this.user,
  });

  @override
  State<Followings> createState() => _FollowingsState();
}

class _FollowingsState extends State<Followings> {
  bool isFollow = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 8,
      ),
      constraints: BoxConstraints(
        minHeight: 90,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 5.0,
            ),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/icon-user.png'),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 100),
            child: Text(
              widget.user.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 10,
              ),
              backgroundColor: const Color.fromARGB(255, 104, 168, 225),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () async {
              if (isFollow) {
                await unfollowUser(widget.user.username);
              } else {
                await followUser(widget.user.username);
              }
              setState(
                () {
                  isFollow = !isFollow;
                },
              );
            },
            child: Text(
              isFollow ? 'UnFollow' : 'Follow',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
