import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media_mobile/ui/components/common/scaffold/main_scaffold.dart';
import 'package:social_media_mobile/ui/screens/onboarding/login_page.dart';

void main() {
  runApp(const SocialMedia());
}

class SocialMedia extends StatelessWidget {
  const SocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future<SharedPreferences> prefs = SharedPreferences.getInstance();
    var navigator = Navigator.of(context);
    prefs.then(
      (value) {
        if (value.getString('authToken') != null &&
            value.getString('authToken') != '') {
          navigator.pushReplacement(
            MaterialPageRoute(
              builder: (context) => const MainScaffold(),
            ),
          );
        } else {
          navigator.pushReplacement(
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
          );
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
            Text('Loading...'),
          ],
        ),
      ),
    );
  }
}
