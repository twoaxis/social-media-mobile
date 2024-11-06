import 'package:flutter/material.dart';

class CustomDevider extends StatelessWidget {
  const CustomDevider({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: constraints.maxWidth * 0.015),
          child: SizedBox(
            width: constraints.maxWidth * 0.75,
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
        );
      },
    );
  }
}
