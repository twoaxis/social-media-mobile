import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media_mobile/data/color.dart';
import 'package:social_media_mobile/models/profile_model.dart';
import 'package:social_media_mobile/ui/components/common/follow/follow.dart';
import 'package:social_media_mobile/ui/components/common/post/post_tile.dart';
import 'package:social_media_mobile/ui/screens/app/profile/customize_profile.dart';

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
    log(token!);

    String yourToken = token;
    Map<String, dynamic> decodedToken = JwtDecoder.decode(yourToken);
    log(decodedToken.toString());

    String username = decodedToken['Username'];
    log(username);

    if (username == widget.profile?.username) isMyProfile = true;
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
                                      widget.profile?.name ?? 'Full name',
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
                                      backgroundImage: AssetImage(
                                          'assets/images/icon-user.png'),
                                    ),
                                  ),
                                  Text(
                                    widget.profile?.bio ??
                                        'Hello! This is our OSS project.',
                                    style: const TextStyle(
                                      color: primaryColor,
                                      fontSize: 16,
                                    ),
                                  ),
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
                                                onPressed: () {
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
