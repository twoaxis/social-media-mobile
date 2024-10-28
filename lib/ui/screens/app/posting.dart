import 'package:flutter/material.dart';

class Posting extends StatelessWidget {
  const Posting({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.lightGreen),
      child: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Back')),
      ),
    );
  }
}
