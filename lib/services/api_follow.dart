import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media_mobile/data/constants.dart';
import 'package:social_media_mobile/exceptions/users/user_not_found_exception.dart';
import 'package:social_media_mobile/models/user.dart';

Future<void> followUser(String username) async {
  var dio = Dio();

  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("authToken");

    await dio.post(
      "$baseUrl/users/$username/follow",
      data: {'username': username},
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
  } on Exception catch (e) {
    log(e.toString());
  }
}

Future<void> unfollowUser(String username) async {
  var dio = Dio();

  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("authToken");

    await dio.post(
      "$baseUrl/users/$username/unfollow",
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
  } on Exception {
    log("An error has occurred");
  }
}

// followers
Future<List<User>> getFollowers(String username) async {
  var dio = Dio();
  List<dynamic> followers = [];
  List<User> users = [];

  try {
    Response response = await dio.get(
      "$baseUrl/users/$username/followers",
      data: {'username': username},
    );

    if (response.statusCode == 200) {
      followers = response.data as List<dynamic>;
      users = followers.map((follower) => User.fromJson(follower)).toList();
    }
  } on DioException catch (e) {
    if (e.response?.statusCode == 404) {
      throw UserNotFoundException();
    }
  }
  return users;
}

// followings
Future<List<User>> getFollowings(String username) async {
  var dio = Dio();
  List<dynamic> followings = [];
  List<User> users = [];

  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("authToken");

    Response response = await dio.get(
      "$baseUrl/users/$username/following",
      data: {'username': username},
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    if (response.statusCode == 200) {
      followings = response.data as List<dynamic>;
      users =
          followings.map((followings) => User.fromJson(followings)).toList();
    }
  } on DioException catch (e) {
    log(e.toString());
    if (e.response?.statusCode == 404) {
      throw UserNotFoundException();
    }
  }
  return users;
}
