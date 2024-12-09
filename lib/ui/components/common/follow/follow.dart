import 'package:flutter/material.dart';
import 'package:social_media_mobile/data/color.dart';
import 'package:social_media_mobile/helpers/follow_function.dart';
import 'package:social_media_mobile/ui/screens/app/follow/follower_page.dart';
import 'package:social_media_mobile/ui/screens/app/follow/following_page.dart';

@override
void follow(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        height: 130,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 100.0, // Control horizontal padding
                    vertical: 13.0, // Control vertical padding
                  ),
                ),
                onPressed: () {
                  //followers('ahmed');
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FollowerPage(),
                    ),
                  );
                },
                child: const Text(
                  'Followers',
                  maxLines: 1,
                  style: TextStyle(
                    color: black,
                    fontSize: 20,
                  ),
                ),
              ),
              Divider(),
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 100.0, // Control horizontal padding
                    vertical: 13.0, // Control vertical padding
                  ),
                ),
                onPressed: () {
                  following('ahmed');
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FollowingPage(),
                    ),
                  );
                },
                child: const Text(
                  'Following',
                  maxLines: 1,
                  style: TextStyle(
                    color: black,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
