import 'package:flutter/material.dart';
import 'package:social_media_mobile/data/color.dart';

@override
void Follow(BuildContext context) {
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
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 150.0, // Control horizontal padding
                    vertical: 13.0, // Control vertical padding
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Follow',
                  style: TextStyle(
                    color: black,
                    fontSize: 20,
                  ),
                ),
              ),
              Divider(),
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 150.0, // Control horizontal padding
                    vertical: 13.0, // Control vertical padding
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Followers',
                  style: TextStyle(
                    color: black,
                    fontSize: 20,
                  ),
                ),
              ),
              Divider(),
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 150.0, // Control horizontal padding
                    vertical: 13.0, // Control vertical padding
                  ),
                ),
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
