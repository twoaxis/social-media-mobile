import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const SocialMedia());
}

GlobalKey<FormState> formKey = GlobalKey<FormState>();

class SocialMedia extends StatelessWidget {
  const SocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(),
    );
  }
}
