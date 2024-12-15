import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media_mobile/data/constants.dart';

Future<void> followUser(String username) async {
  var dio = Dio();

  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("authToken");

    await dio.post("$baseUrl/users/$username/follow",
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }));
  } on Exception catch (e) {
    print(e);
  }
}

Future<void> unfollowUser(String username) async {
  var dio = Dio();

  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("authToken");

    await dio.post("$baseUrl/users/$username/unfollow",
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }));
  } on Exception {
    print("An error has occurred");
  }
}
