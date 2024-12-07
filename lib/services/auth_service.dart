import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media_mobile/exceptions/auth/email_not_verified_exception.dart';
import 'package:social_media_mobile/exceptions/auth/email_taken_exception.dart';
import 'package:social_media_mobile/exceptions/auth/invalid_credentials_exception.dart';
import 'package:social_media_mobile/exceptions/auth/invalid_token_exception.dart';
import 'package:social_media_mobile/exceptions/auth/name_not_english_exception.dart';
import 'package:social_media_mobile/exceptions/auth/sessionId_incorrect.dart';
import 'package:social_media_mobile/exceptions/auth/user_name_taken_exception.dart';
import 'package:social_media_mobile/exceptions/users/missing_or_incorrect_fields_exception.dart';

Dio dio = Dio();

class AuthService {
  Future<String> signUp(String name,
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
      return response.data["sessionId"];
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

  Future logIn(String email, String password) async {
    try {
      Response response = await dio.post(
        'http://18.193.81.175/auth/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      final status = response.data["status"];
      if (status == "email-verification") {
        throw EmailNotVerifiedException(sessionId: response.data["sessionId"]);
      } else if (status == "complete") {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final token = response.data["token"];
        prefs.setString('authToken', token);
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw NameNotEnglishException();
      } else if (e.response?.statusCode == 401) {
        throw InvalidCredentialsExceptions();
      }
      throw InvalidCredentialsExceptions();
    }
  }

  Future<void> logOut() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("authToken");
      log(token!);
      await dio.post(
        'http://18.193.81.175/auth/logout',

        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      prefs.remove("authToken");
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw InvalidTokenException();
      }
    }
  }

  Future<void> verifyEmail({
    required String sessionId,
    String? code,
  }) async {
    try {
      Response response = await dio.post(
        'http://18.193.81.175/auth/verifyemail',
        data: {
          'sessionId': sessionId,
          'code': code,
        },
      );

      if (response.statusCode == 200) {
        String token = response.data["token"];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('authToken', token);
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw MissingOrIncorrectFieldsException;
      } else if (e.response?.statusCode == 401) {
        throw SessionIdAndCodeIncorrect;
      }
    }
  }
}