import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media_mobile/exceptions/auth/invalid_token_exception.dart';
import 'package:social_media_mobile/exceptions/users/missing_or_incorrect_fields_exception.dart';

Dio dio = Dio();

Future<String> createPost(String content) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("authToken");


  try {
    Response response = await dio.put(
      'http://18.193.81.175/posts',
      data: {'content': content},
    );

    if (response.statusCode == 200) {
      return response.data["postId"];
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
