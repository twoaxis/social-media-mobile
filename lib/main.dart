import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media_mobile/ui/components/common/loading/loading_screen.dart';
import 'package:social_media_mobile/ui/screens/app/app.dart';
import 'package:social_media_mobile/ui/screens/app/home/home.dart';
import 'package:social_media_mobile/ui/screens/onboarding/login_page.dart';

void main() {
  runApp(const SocialMedia());
}

class SocialMedia extends StatefulWidget {
  const SocialMedia({super.key});

  @override
  State<SocialMedia> createState() => _SocialMediaState();
}

class _SocialMediaState extends State<SocialMedia> {

  var loading = true;
  var isLoggedIn = false;

  void initState() {
    super.initState();

    checkLoginstate();
  }

  void checkLoginstate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();


    setState(() {
      loading = false;
      isLoggedIn = prefs.getString("authToken") != null;
    });
  }

  void setLoginState (state) {
    setState(() {
      isLoggedIn = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 195, 48, 48), contrastLevel: 1)
      ),
      home: loading ? LoadingScreen() : (isLoggedIn ? App() : LoginPage(setLoginState: setLoginState)),
    );
  }
}
