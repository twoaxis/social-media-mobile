import 'package:flutter/material.dart';
import 'package:social_media_mobile/data/color.dart';
import 'package:social_media_mobile/models/profile_model.dart';
import 'package:social_media_mobile/ui/components/common/follow/follow.dart';
import 'package:social_media_mobile/ui/screens/app/profile/customize_profile.dart';

class Profile extends StatefulWidget {
  final ProfileModel? profile;
  const Profile({super.key, this.profile});

  @override
  State<Profile> createState() => _ProfileState();
}

bool isFriendAdded = false;
bool isFollowed = false;

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("username"),
        actions: [
            IconButton(
              onPressed: () {
                // follow(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Follow(),
                  ),
                );
              },
              icon: Icon(Icons.more_vert),
            ),
          ],
        ),
      body: Column(
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                      Image(
                        image: AssetImage('assets/images/background3.png'),
                      ),
                      Positioned(
                        top: 8,
                        left: 8,
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CustomizeProfile(),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Center(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: Text(
                                'Full name',
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 20,
                                ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: CircleAvatar(
                              radius: 45,
                              backgroundImage:
                                  AssetImage('assets/images/icon-user.png'),
                            ),
                          ),
                          const Text(
                            'Hello! This is our OSS project.',
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 16,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  setState(
                                    () {
                                      isFriendAdded = !isFriendAdded;
                                    },
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: secondaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text(
                                  isFriendAdded
                                      ? 'Cancel Request'
                                      : 'Add Friend',
                                  style: const TextStyle(color: primaryColor),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(
                                      () {
                                        isFollowed = !isFollowed;
                                      },
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      backgroundColor: gray),
                                  child: Text(
                                    isFollowed ? 'Unfollow' : 'Follow',
                                    style: const TextStyle(
                                      color: primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
