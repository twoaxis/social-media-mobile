import 'package:dio/dio.dart';
import 'package:social_media_mobile/exceptions/auth/email_taken_exception.dart';
import 'package:social_media_mobile/exceptions/auth/invalid_credentials_exception.dart';
import 'package:social_media_mobile/exceptions/auth/name_not_english_exception.dart';
import 'package:social_media_mobile/exceptions/auth/user_name_taken_exception.dart';
import 'package:social_media_mobile/exceptions/users/user_not_found_exception.dart';
import 'package:social_media_mobile/exceptions/users/missing_or_incorrect_fields_exception.dart';

class Api {
  //get-----------------------------------------------
  static Future<dynamic> get(String url) async {
    Dio dio = Dio();
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

  //post-----------------------------------------------
  static Future<Map<String, dynamic>> post({required String url,required Object data}) async {
    Dio dio = Dio();
    try {
      Response response = await dio.post(
        url,
        data: data,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      return response.data;
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw NameNotEnglishException();
      }

      if (e.response?.statusCode == 401) {
        throw InvalidCredentialsExceptions();
      }

      if (e.response?.statusCode == 409) {
        if (e.response?.data['code'] == 'auth/email-taken') {
          throw EmailTakenException();
        }

        if (e.response?.data['code'] == 'auth/username-taken') {
          throw UserNameTakenException();
        }
      }
    }
    return {};
  }
}

