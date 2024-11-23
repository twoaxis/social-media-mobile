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

    String token = json['token'];
    log(token);

    return token;
  }

  static Future<String> logIn({required String email, required String password}) async {
    Map<String, dynamic> json =
        await Api.post(url: '$baseUrl/auth/login', data: {
      'email': email,
      'password': password,
    });

    String token = json['token'];
    log(token);

    return token;
  }
}
