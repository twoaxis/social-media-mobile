import 'package:flutter/material.dart';
import 'package:social_media_mobile/models/user.dart';

class Following extends StatelessWidget {
  final User user;

  const Following({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 8,
      ),
        constraints: BoxConstraints(
        minHeight: 80,
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
            Text(
              user.name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
    );
  }
}
