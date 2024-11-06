import 'package:flutter/material.dart';
import 'package:social_media_mobile/ui/screens/app/home/home.dart';
import 'package:social_media_mobile/ui/screens/app/profile/customize_profile.dart';

void main() {
  runApp(const SocialMedia());
}

GlobalKey<FormState> formKey = GlobalKey<FormState>();

class SocialMedia extends StatelessWidget {
  const SocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: Home(),
      home: CustomizeProfile(),
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: Color.fromARGB(53, 179, 44, 44),
          selectionHandleColor: Color(0xFFB32C2C),
        ),
      ),
    );
  }
}
