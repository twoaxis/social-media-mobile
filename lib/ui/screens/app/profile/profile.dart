import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:social_media_mobile/data/color.dart';
import 'package:social_media_mobile/models/profile_model.dart';
import 'package:social_media_mobile/ui/components/common/follow/follow.dart';
import 'package:social_media_mobile/ui/components/common/misc/profile_image.dart';
import 'package:social_media_mobile/ui/screens/app/profile/customize_profile.dart';
import 'package:social_media_mobile/ui/components/common/post/post_tile.dart';

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
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Image(
                    image: AssetImage('assets/images/background3.png'),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: IconButton(
                      onPressed: () {
                        follow(context);
                      },
                      color: kPrimaryColor,
                      icon: const Icon(
                        Icons.more_vert,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CustomizeProfile(),
                        ),
                      );
                    },
                    color: kPrimaryColor,
                    icon: Icon(
                      FluentIcons.edit_24_regular,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
                  Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            widget.profile?.name ?? 'name',
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(3.0),
                          child: CircleAvatar(
                            radius: 45,
                            backgroundImage:
                                AssetImage('assets/images/icon-user.png'),
                          ),
                        ),
                        Text(
                          widget.profile?.username ?? 'username',

                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          widget.profile?.bio ?? 'bio',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: kPrimaryColor,
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
                                backgroundColor: kSecondaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                isFriendAdded ? 'Cancel Request' : 'Add Friend',
                                style: const TextStyle(color: kPrimaryColor),
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
                                    backgroundColor: kGray),
                                child: Text(
                                  isFollowed ? 'unfollow' : 'follow',
                                  style: const TextStyle(
                                    color: kPrimaryColor,
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Posts',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          widget.profile?.posts == null
              ? const Text(
                  'No posts!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.profile!.posts.length,
                  itemBuilder: (context, index) {
                    return PostTile(
                      post: widget.profile!.posts[index],
                    );
                  },
                ),
        ],
      ),
    );
  }
}
