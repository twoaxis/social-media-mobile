import 'package:flutter/material.dart';
import 'package:social_media_mobile/data/color.dart';
import 'package:social_media_mobile/ui/components/common/appbar/custom_sliver_app_bar.dart';
import 'package:social_media_mobile/ui/components/common/follow.dart';
import 'package:social_media_mobile/ui/components/common/navigation/custom_bottom_navbar.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

bool isFriendAdded = false;
bool isFollow = false;

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(),
          SliverToBoxAdapter(
            child: Center(
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
                        right: 8,
                        child: IconButton(
                          onPressed: () {
                            Follow(context);
                          },
                          color: primarycolor,
                          icon: const Icon(
                            Icons.more_vert,
                            color: primarycolor,
                          ),
                        ),
                      ),
                      Center(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                'Full name',
                                style: TextStyle(
                                  color: primarycolor,
                                  fontSize: 15,
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
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 7),
                              child: Text(
                                '@Username',
                                style: TextStyle(
                                  color: primarycolor,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            const Text(
                              'Hello! This is our OS project.',
                              style: TextStyle(
                                color: primarycolor,
                                fontSize: 16,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      isFriendAdded = !isFriendAdded;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: secondarycolor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    isFriendAdded
                                        ? 'Cancel Request'
                                        : 'Add Friend',
                                    style: const TextStyle(color: primarycolor),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        isFollow = !isFollow;
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        backgroundColor: gray),
                                    child: Text(
                                      isFollow ? 'unfollow' : 'follow',
                                      style: const TextStyle(
                                        color: primarycolor,
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
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavbar.bottomNavBar(),
    );
  }
}
