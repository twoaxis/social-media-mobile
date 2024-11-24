import 'package:flutter/material.dart';
import 'package:social_media_mobile/ui/components/common/friend.dart';

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
    return 
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: names.length,
              (context, index) => Friend(
                name: names[index],
                onRemove: () => removeFriend(index),
              ),
            ),
          );
  }
}
