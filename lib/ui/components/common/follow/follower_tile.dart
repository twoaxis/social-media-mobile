import 'package:flutter/material.dart';
import 'package:social_media_mobile/models/user.dart';

bool isFollow = true;

class Followers extends StatefulWidget {
  final User user;

  const Followers({
    super.key,
    required this.user,
  });

  @override
  State<Followers> createState() => _FollowersState();
}

class _FollowersState extends State<Followers> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
      ),
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        constraints: BoxConstraints(
          minHeight: 100,
        ),
        decoration: BoxDecoration(
          color: Colors.white, // Optional background color
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ],
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
                radius: 35,
                backgroundImage: AssetImage('assets/images/Sillycat.jpeg'),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              widget.user.name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 10,
                ),
                backgroundColor: const Color.fromARGB(255, 107, 171, 223),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                setState(
                  () {
                    isFollow = !isFollow;
                  },
                );
              },
              child: Text(
                isFollow ? 'unfollow' : 'follow',
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
      ),
    );
  }
}
