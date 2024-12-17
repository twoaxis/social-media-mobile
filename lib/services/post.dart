import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media_mobile/data/constants.dart';
import 'package:social_media_mobile/exceptions/auth/invalid_token_exception.dart';
import 'package:social_media_mobile/exceptions/users/already_liked_this_post_exception.dart';
import 'package:social_media_mobile/exceptions/users/didnot_like_this_post_exception.dart';
import 'package:social_media_mobile/exceptions/users/missing_or_incorrect_fields_exception.dart';
import 'package:social_media_mobile/models/post.dart';

Dio dio = Dio();

Future<String> createPost(String content) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("authToken");

  // String yourToken = token!;
  // Map<String, dynamic> decodedToken = JwtDecoder.decode(yourToken);

  // String userId = decodedToken['sub'];

  try {
    Response response = await dio.put(
      '$baseUrl/posts',
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

Future<List<Post>> getPosts({required String token}) async {
  List<Post> posts = [];
  try {
    Response response = await dio.get(
      '$baseUrl/posts',
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
  return posts;
}

// create the like function
Future<void> likePost({required int postId}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("authToken");

  try {
    // ignore: unused_local_variable
    Response response = await dio.post(
      '$baseUrl/posts/$postId/like',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ),
    );
  } on DioException catch (e) {
    log(e.response!.statusCode.toString());
    if (e.response?.statusCode == 401) {
      throw InvalidTokenException();
    } else if (e.response?.statusCode == 409) {
      throw AlreadyLikedThisPostException();
    }
  }
}

Future<void> unlikePost({required int postId}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("authToken");
  try {
    // ignore: unused_local_variable
    Response response = await dio.post(
      '$baseUrl/posts/$postId/unlike',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ),
    );
  } on DioException catch (e) {
    log(e.response!.statusCode.toString());
    if (e.response?.statusCode == 401) {
      throw InvalidTokenException();
    } else if (e.response?.statusCode == 409) {
      throw DidNotLikeThisPostException();
    }
  }
}

// create the comment function
Future<String> createComment(String content, int postId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("authToken");

  try {
    Response response = await dio.put(
      '$baseUrl/posts/$postId/comment',
      data: {'content': content},
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ),
    );

    if (response.statusCode == 200) {
      return response.data["commentId"].toString();
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
