import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.lightGreen),
      child: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
          child: Text('Back'),
        ),
      ),
    );
  }
}
