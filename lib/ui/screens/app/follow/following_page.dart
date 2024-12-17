import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media_mobile/models/user.dart';
import 'package:social_media_mobile/ui/components/common/follow/following_tile.dart';

class FollowingPage extends StatefulWidget {
  const FollowingPage({
    super.key,
    required this.users,
    required this.username,
  });

  final List<User> users;
  final String username;

  @override
  State<FollowingPage> createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> {
  late String myUsername = '';
  @override
  void initState() {
    following();
    super.initState();
  }

  void following() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("authToken");

    String yourToken = token!;
    Map<String, dynamic> decodedToken = JwtDecoder.decode(yourToken);

    String username = decodedToken['Username'];

    setState(() {
      myUsername = username;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Followings'),
      ),
      body: (widget.users.isEmpty)
          ? const Center(
              child: Text('No followings yet.'),
            )
          : ListView.builder(
              itemCount: widget.users.length,
              itemBuilder: (context, index) {
                return Followings(
                  user: widget.users[index],
                  showButtons: widget.username == myUsername,
                );
              },
            ),
    );
  }
}
