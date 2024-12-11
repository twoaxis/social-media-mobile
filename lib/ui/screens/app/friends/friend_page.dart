import 'package:flutter/material.dart';
import 'package:social_media_mobile/data/color.dart';
import 'package:social_media_mobile/ui/components/common/friend/friend.dart';
import 'package:social_media_mobile/ui/components/common/friend/myFriend.dart';

class FriendPage extends StatefulWidget {
  const FriendPage({super.key});

  @override
  State<FriendPage> createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPage> {
  final List<String> names = <String>[
    'John Doe',
    'Mary Smith',
    'Mohamed Ali',
    'Elon Musk',
    'Steve Jobs',
    'Bill Gates',
    'Steve Wozniak',
    'Mark Zuckerberg',
    'Salah',
    'Cristiano Ronaldo',
    'Lionel Messi',
  ];

  void removeFriend(int index) {
    setState(() {
      names.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            labelColor: secondaryColor,
            labelStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            tabs: [
              Tab(
                text: 'Requests',
              ),
              Tab(
                text: 'My friends',
              ),
            ],
            dividerColor: Colors.grey.shade300,
            indicatorColor: secondaryColor,
            indicatorSize: TabBarIndicatorSize.values[1],
          ),
          SizedBox(
            height: 8,
          ),
          Expanded(
            child: TabBarView(
              children: [
                ListView.builder(
                  itemCount: names.length,
                  itemBuilder: (context, index) => Friend(
                    name: names[index],
                    onRemove: () => removeFriend(index),
                  ),
                ),
                ListView.builder(
                  itemCount: names.length,
                  itemBuilder: (context, index) => MyFriend(
                    name: names[index],
                    onRemove: () => removeFriend(index),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
