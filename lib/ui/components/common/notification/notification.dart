import 'package:flutter/material.dart';
import 'package:social_media_mobile/data/color.dart';

class Notificate extends StatelessWidget {
  const Notificate({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 0,
          ),
          constraints: BoxConstraints(
            minHeight: 80,
          ),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Colors.grey.shade300
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  top: 5.0,
                  bottom: 5.0,
                  right: 10.0,
                ),
                child: Text(
                  'New Friend Request',
                  style: TextStyle(
                    color: secondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: Text(
                  'You have a new friend request. Please check and accept or decline.',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
