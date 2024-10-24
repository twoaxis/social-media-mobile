import 'package:flutter/material.dart';
import 'package:social_media_mobile/ui/screens/app/menu.dart';
import 'package:social_media_mobile/ui/screens/onboarding/sign_up_page.dart';

void main() {
  runApp(const SocialMedia());
}

GlobalKey<FormState> formKey = GlobalKey<FormState>();

class SocialMedia extends StatelessWidget {
  const SocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      //  home: SignUpPage(),
      home: Menu(),
    );
  }
}
