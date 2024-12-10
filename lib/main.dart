import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media_mobile/data/color.dart';
import 'package:social_media_mobile/ui/components/common/loading/loading_screen.dart';
import 'package:social_media_mobile/ui/screens/app/scaffold/main_scaffold.dart';
import 'package:social_media_mobile/ui/screens/onboarding/login_page.dart';

void main() {
  runApp(
    const SocialMedia(),
  );
}

class SocialMedia extends StatefulWidget {
  const SocialMedia({super.key});

  @override
  State<SocialMedia> createState() => _SocialMediaState();
}

class _SocialMediaState extends State<SocialMedia> {

  var loading = true;
  var isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    checkLoginState();
  }

  void checkLoginState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      loading = false;
      isLoggedIn = prefs.getString("authToken") != null;
      },
    );
  }

  void setLoginState (state) {
    setState(() {
      isLoggedIn = state;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: colorScheme
      ),
      home: loading
          ? LoadingScreen()
          : (isLoggedIn
              ? MainScaffold()
              : LoginPage(setLoginState: setLoginState)),
    );
  }
}
