import 'package:dio/dio.dart';

Dio dio = Dio();

class AuthService {

  Future<dynamic> signUp (
      String name,
      String username,
      String email,
      String password

      ) async {

    Response response = await dio.post(
      'http://18.193.81.175/auth/signup',
      data: {
        'name': name,
        'username': username,
        'email': email,
        'password': password
      },
    );

    return response;

  }
}