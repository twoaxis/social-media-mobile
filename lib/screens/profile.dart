import 'package:flutter/material.dart';
import 'package:social_media_mobile/data/color.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
          color: primarycolor,
        ),
        centerTitle: true,
        title: const Text(
          'Full name',
          style: TextStyle(
            color: primarycolor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: red2,
        actions: [
          IconButton(
            onPressed: () {
              follow();
            },
            color: primarycolor,
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      backgroundColor: primarycolor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Stack(
                children: [
                  Image(
                    image: AssetImage('assets/images/background3.png'),
                  ),
                  Center(
                    child: Column(
                      children: [
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
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: secondarycolor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                'Add Friend',
                                style: TextStyle(color: primarycolor),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    backgroundColor: gray),
                                child: const Text(
                                  'Follow',
                                  style: TextStyle(color: primarycolor),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void follow() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 200,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Follow',
                    style: TextStyle(
                      color: black,
                      fontSize: 20,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Followers',
                    style: TextStyle(
                      color: black,
                      fontSize: 20,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Following',
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
}
