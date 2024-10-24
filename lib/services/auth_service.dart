import 'package:dio/dio.dart';
import 'package:social_media_mobile/exceptions/auth/CredentialTakenException.dart';
import 'package:social_media_mobile/exceptions/auth/InvalidCredentialsException.dart';
import 'package:social_media_mobile/exceptions/auth/NameNotEnglishException.dart';

Dio dio = Dio();

class AuthService {
  Future<String> signUp(
      String name,
      String username,
      String email,
      String password

      ) async {
    try {
      Response response = await dio.post(
        'http://18.193.81.175/auth/signup',
        data: {
          'name': name,
          'username': username,
          'email': email,
          'password': password
        },
      );

      if (response.statusCode == 200) {
        return response.data["token"];
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw NameNotEnglishException();
      } else if (e.response?.statusCode == 409) {
        throw CredentialTakenException();
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
    }
    return "";
  }
}