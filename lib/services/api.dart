import 'package:dio/dio.dart';
import 'package:social_media_mobile/exceptions/users/user_not_found_exception.dart';
import 'package:social_media_mobile/exceptions/users/missing_or_incorrect_fields_exception.dart';

class Api {
  static Future<dynamic> get(String url) async {
    var dio = Dio();
    try {
      var response = await dio.get(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      return response.data;
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw MissingOrIncorrectFieldsException();
      }

      if (e.response?.statusCode == 404) {
        throw UserNotFoundException();
      }
    }
  }
}
