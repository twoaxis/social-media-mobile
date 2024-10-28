import 'package:dio/dio.dart';
import 'package:social_media_mobile/exceptions/auth/invalid_credentials_exception.dart';
import 'package:social_media_mobile/exceptions/auth/name_not_english_exception.dart';
import 'package:social_media_mobile/exceptions/auth/email_taken_exception.dart';
import 'package:social_media_mobile/exceptions/auth/user_name_taken_exception.dart';

Dio dio = Dio();

class AuthService {
  Future<String> signUp(
      String name,
      String username,
      String email,
    String password,
  ) async {
    try {
      Response response = await dio.post(
        'http://18.193.81.175/auth/signup',
        data: {
          'name': name,
          'username': username,
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return response.data["token"];
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw NameNotEnglishException();
      } else if (e.response?.statusCode == 409) {
        if (e.response?.data['code'] == 'auth/email-taken') {
          throw EmailTakenException();
        } else if (e.response?.data['code'] == 'auth/username-taken') {
          throw UserNameTakenException();
        }
      }
    }
    return "";
  }

  Future<String> logIn(String email, String password) async {
    try {
      Response response = await dio.post(
        'http://18.193.81.175/auth/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        return response.data["token"];
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw NameNotEnglishException();
      } else if (e.response?.statusCode == 401) {
        throw InvalidCredentialsExceptions();
      }
      throw InvalidCredentialsExceptions();
    }
    return "";
  }
}
