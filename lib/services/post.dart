import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media_mobile/exceptions/auth/invalid_token_exception.dart';
import 'package:social_media_mobile/exceptions/users/missing_or_incorrect_fields_exception.dart';
import 'package:social_media_mobile/models/post.dart';

Dio dio = Dio();

Future<String> createPost(String content) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("authToken");
  log(token!);

  String yourToken = token;
  Map<String, dynamic> decodedToken = JwtDecoder.decode(yourToken);
  log(decodedToken.toString());

  String userId = decodedToken['sub'];
  log(userId);
  try {
    Response response = await dio.put(
      'http://18.193.81.175/posts',
      data: {'content': content},
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ),
    );

    if (response.statusCode == 200) {
      return response.data["postId"].toString();
    }
  } on DioException catch (e) {
    if (e.response?.statusCode == 400) {
      throw MissingOrIncorrectFieldsException();
    } else if (e.response?.statusCode == 401) {
      throw InvalidTokenException();
    }
  }
  return "";
}

Future<List<dynamic>> getPosts({required String token}) async {
  List<Post> posts = [];
  try {
    Response response = await dio.get(
      'http://18.193.81.175/posts',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ),
    );

    if (response.statusCode == 200) {
      for (Map<String, dynamic> json in response.data) {
        posts.add(Post.fromJson(json));
      }
    }
  } on DioException catch (e) {
    if (e.response?.statusCode == 401) {
      throw InvalidTokenException();
    }
  }
  return [];
}