import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media_mobile/data/color.dart';
import 'package:social_media_mobile/models/profile_model.dart';
import 'package:social_media_mobile/ui/components/common/post/post_tile.dart';
import 'package:social_media_mobile/ui/screens/app/follow/follower_page.dart';
import 'package:social_media_mobile/ui/screens/app/follow/following_page.dart';
import 'package:social_media_mobile/ui/screens/app/profile/customize_profile.dart';
import 'package:social_media_mobile/models/user.dart';
import 'package:social_media_mobile/services/api_follow.dart';
import 'package:social_media_mobile/ui/components/common/misc/profile_image.dart';

class Profile extends StatefulWidget {
  final ProfileModel? profile;
  const Profile({super.key, this.profile});

  @override
  State<Profile> createState() => _ProfileState();
}

bool isFriendAdded = false;
bool isFollowed = false;
bool isMyProfile = false;
bool _initialized = false;

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    onProfile();
  }

  void onProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("authToken");

    String yourToken = token!;
    Map<String, dynamic> decodedToken = JwtDecoder.decode(yourToken);

    String username = decodedToken['Username'];

    if (username == widget.profile?.username) {
      isMyProfile = true;
    } else {
      isMyProfile = false;
    }

    isFollowed = widget.profile!.isFollowing;
    _initialized = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.profile?.username ?? "username",
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: _initialized
          ? SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Image(
                              image:
                                  AssetImage('assets/images/background3.png'),
                            ),
                            Positioned(
                              top: 8,
                              left: 8,
                              child: IconButton(
                                onPressed: widget.profile == null
                                    ? null
                                    : () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                CustomizeProfile(
                                              profile: ProfileModel(
                                                name: widget.profile?.name ??
                                                    'Default Name',
                                                username:
                                                    widget.profile?.username ??
                                                        'default_username',
                                                bio: widget.profile?.bio ?? '',
                                                followerCount: widget.profile
                                                        ?.followerCount ??
                                                    0, // Cast to int
                                                followingCount: widget.profile
                                                        ?.followingCount ??
                                                    0, // Cast to int
                                                posts:
                                                    widget.profile?.posts ?? [],
                                                id: widget.profile?.id ??
                                                    0, // Ensure id is non-null
                                              ),
                                            ),
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
                                      widget.profile?.name ?? 'Full name',
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: BoundedProfileImage(45, 1),
                                  ),
                                  Text(
                                    widget.profile?.bio ??
                                        'Hello! This is our OSS project.',
                                    style: const TextStyle(
                                      color: primaryColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () async {
                                            // openFollowers();
                                            List<User> users =
                                                await getFollowings(
                                              widget.profile!.username,
                                            );
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    FollowingPage(
                                                  users: users,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            'Following: ${widget.profile?.followingCount}',
                                            style: const TextStyle(
                                              color: primaryColor,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            List<User> users =
                                                await getFollowers(
                                              widget.profile!.username,
                                            );
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    FollowerPage(
                                                  users: users,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            'Followers: ${widget.profile?.followerCount}',
                                            style: const TextStyle(
                                              color: primaryColor,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ]),
                                  isMyProfile
                                      ? SizedBox()
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                setState(
                                                  () {
                                                    isFriendAdded =
                                                        !isFriendAdded;
                                                  },
                                                );
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: secondaryColor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              child: Text(
                                                isFriendAdded
                                                    ? 'Cancel Request'
                                                    : 'Add Friend',
                                                style: const TextStyle(
                                                    color: primaryColor),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: ElevatedButton(
                                                onPressed: () async {
                                                  if (isFollowed) {
                                                    await unfollowUser(widget
                                                        .profile!.username);
                                                  } else {
                                                    await followUser(widget
                                                        .profile!.username);
                                                  }
                                                  setState(
                                                    () {
                                                      isFollowed = !isFollowed;
                                                    },
                                                  );
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    backgroundColor: gray),
                                                child: Text(
                                                  isFollowed
                                                      ? 'Unfollow'
                                                      : 'Follow',
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
                  ),
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
