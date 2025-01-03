import 'package:flutter/material.dart';
import 'package:social_media_mobile/data/constants.dart';
import 'package:social_media_mobile/models/user.dart';
import 'package:social_media_mobile/services/api.dart';

Future<List<User>> followers(String username) async {
  List<dynamic> jsonList = await Api.get(
    '$baseUrl/users/$username/followers',
  );
  List<User> followers = [];

  debugPrint(
    jsonList.toString(),
  );
  for (Map<String, dynamic> json in jsonList) {
    followers.add(
      User.fromJson(json),
    );
  }

  return followers;
}

Future<bool> isFollower(String username, String followerUsername) async {
  List<User> followersList = await followers(username);

  return followersList.any((user) => user.username == followerUsername);
}


Future<List<User>> following(String username) async {
  List<dynamic> jsonList = await Api.get(
    '$baseUrl/users/$username/following',
  );
  List<User> following = [];

  debugPrint(
    jsonList.toString(),
  );
  for (Map<String, dynamic> json in jsonList) {
    following.add(
      User.fromJson(json),
    );
  }

  return following;
}
