import 'package:flutter/material.dart';
import 'package:social_media_mobile/data/color.dart';

class CommentTile extends StatelessWidget {
  const CommentTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(125, 225, 225, 225),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: secondaryColor,
                child: CircleAvatar(
                  radius: 14,
                  backgroundImage: NetworkImage(
                      'https://static.vecteezy.com/system/resources/previews/005/544/718/original/profile-icon-design-free-vector.jpg'),
                ),
              ),
              SizedBox(width: 10),
              Text(
                'username',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            'python is overrated 😂😂😂 ',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
