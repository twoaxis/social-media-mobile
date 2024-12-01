import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:social_media_mobile/data/constants.dart';
import 'package:social_media_mobile/helpers/api.dart';

Dio dio = Dio();

class AuthService {
  static Future<String> signUp({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> json =
        await Api.post(url: '$baseUrl/auth/signup', data: {
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    });

    String sessionId = json['sessionId'];
    log(sessionId);
    return sessionId;
  }

  static Future<Map<String, dynamic>> logIn({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> json =
        await Api.post(url: '$baseUrl/auth/login', data: {
      'email': email,
      'password': password,
      },
    );

    return json;
  }

  static Future<String> emailVerification({
    required String sessionId,
    required String code,
  }) async {
    try {
      Response response = await dio.post(
        '$baseUrl/auth/verifyemail',
        data: {
          'code': code,
          'sessionId': sessionId,
        },
      );
      return response.data['token'];
    } on DioException catch (e) {
      log(e.response.toString());
      log(e.response!.statusCode.toString());
      rethrow;
    }
  }
}
