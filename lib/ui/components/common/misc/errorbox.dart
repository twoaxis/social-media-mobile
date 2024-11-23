import 'package:flutter/material.dart';
import 'package:social_media_mobile/data/color.dart';

class Errorbox extends StatelessWidget {
  const Errorbox({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: kSecondaryColor,
            border: Border.all(
              width: 2.0,
              color: kPrimaryColor,
            ),
          ),
          child: Text(
            content,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
