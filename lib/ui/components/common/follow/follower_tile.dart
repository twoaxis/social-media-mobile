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
                backgroundColor: const Color.fromARGB(255, 104, 168, 225),
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
