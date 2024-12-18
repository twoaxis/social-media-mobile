import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media_mobile/data/color.dart';
import 'package:social_media_mobile/models/post.dart';
import 'package:social_media_mobile/models/profile_model.dart';
import 'package:social_media_mobile/services/get_profile.dart';
import 'package:social_media_mobile/services/post.dart';
import 'package:social_media_mobile/ui/components/common/post/post_tile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Post> posts = [];
  bool isLoading = true;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  Future<void> _fetchPosts() async {
    setState(() {
      isLoading = true;
      hasError = false;
    });

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("authToken");
      final List<Post> response = await getPosts(token: token!);

      posts = response;

      String yourToken = token;
      Map<String, dynamic> decodedToken = JwtDecoder.decode(yourToken);

      String userName = decodedToken['Username'];

      Map<String, dynamic> profile = await getProfile(userName);

      ProfileModel profileModel = ProfileModel.fromJson(profile);
      List<Post> ownPosts = profileModel.posts;
      posts += ownPosts;
      posts.shuffle();

      setState(() {
        isLoading = false;
      });
    } catch (error) {
      log('Error fetching posts: $error');
      setState(() {
        hasError = true;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 4.0,
          ),
          child: const CircularProgressIndicator(),
        ),
      );
    }

    if (hasError) {
      return Center(
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 2.5,
          ),
          child: Column(
            children: [
              const Text(
                'Something went wrong',
                style: TextStyle(fontSize: 20),
              ),
              ElevatedButton(
                onPressed: _fetchPosts,
                style: ElevatedButton.styleFrom(
                  backgroundColor: secondaryColor,
                ),
                child: const Text(
                  'Refresh',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (posts.isEmpty) {
      return Center(
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 3.5,
          ),
          child: Column(
            children: [
              const Text(
                'No Posts',
                style: TextStyle(fontSize: 20),
              ),
              ElevatedButton(
                onPressed: _fetchPosts,
                style: ElevatedButton.styleFrom(
                  backgroundColor: secondaryColor,
                ),
                child: const Text(
                  'Refresh',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
    }
    return RefreshIndicator(
      onRefresh: () async {
        return _fetchPosts();
      },
      child: ListView.builder(
        itemBuilder: (context, index) => PostTile(post: posts[index]),
        itemCount: posts.length,
      ),
    );
  }
}
