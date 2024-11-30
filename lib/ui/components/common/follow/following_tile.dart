import 'package:flutter/material.dart';
import 'package:social_media_mobile/models/user.dart';
import 'package:social_media_mobile/ui/components/common/misc/profile_image.dart';

class Following extends StatelessWidget {
  final User user;

  const Following({
    super.key,
    required this.user,
  });

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
              child: ProfileImage(35),
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
      ),
    );
  }
}
