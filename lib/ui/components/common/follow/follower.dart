import 'package:flutter/material.dart';

bool isfollow = true;

class Followers extends StatefulWidget {
  const Followers({super.key});

  @override
  State<Followers> createState() => _FollowersState();
}

class _FollowersState extends State<Followers> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
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
              radius: 38,
              backgroundImage: AssetImage('assets/images/Sillycat.jpeg'),
            ),
          ),
          Text(
            'Ahmed Helmy',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: 40,
          ),
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
                  isfollow = !isfollow;
                },
              );
            },
            child: Text(
              isfollow ? 'unfollow' : 'follow',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
