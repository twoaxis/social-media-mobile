import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_media_mobile/data/color.dart';

class MyFriend extends StatefulWidget {
  const MyFriend({
    super.key,
    required this.name,
    required this.onRemove,
  });

  final String name;
  final VoidCallback onRemove;

  @override
  State<MyFriend> createState() => _MyFriendState();
}

class _MyFriendState extends State<MyFriend> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 10,
      ),
      constraints: BoxConstraints(
        maxHeight: 100,
      ),
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
              color: Colors.grey.shade300
          )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 10.0,
            ),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/Sillycat.jpeg'),
            ),
          ),
          Text(
            widget.name,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              widget.onRemove();
            },
            icon: Icon(
              FontAwesomeIcons.remove,
              color: secondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
