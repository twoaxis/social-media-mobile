import 'package:flutter/material.dart';
import 'package:social_media_mobile/data/color.dart';

class Friend extends StatefulWidget {
  const Friend({
    super.key,
    required this.name,
    required this.onRemove,
  });

  final String name;
  final VoidCallback onRemove;

  @override
  State<Friend> createState() => _FriendState();
}

class _FriendState extends State<Friend> {
  bool isFriendAdded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      constraints: BoxConstraints(
        maxHeight: 100,
      ),
      decoration: BoxDecoration(
        color: Colors.white, // Optional background color
        borderRadius: BorderRadius.circular(12),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 15.0,
                ),
                child: Text(
                  widget.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        backgroundColor: secondarycolor,
                        padding: EdgeInsets.symmetric(
                          horizontal: 18.0,
                          vertical: 8,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          isFriendAdded = !isFriendAdded;
                        });
                      },
                      child: Text(
                        isFriendAdded ? 'Cancel Request' : 'Add Friend',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        backgroundColor: Colors.grey,
                        padding: EdgeInsets.symmetric(
                          horizontal: 18.0,
                          vertical: 8,
                        ),
                      ),
                      onPressed: () {
                        widget.onRemove();
                      },
                      child: Text(
                        'Remove',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
