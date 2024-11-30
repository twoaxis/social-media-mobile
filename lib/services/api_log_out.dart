import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media_mobile/data/constants.dart';
import 'package:social_media_mobile/exceptions/auth/unauthorized_exception.dart';

Dio dio = Dio();

Future<void> logOut() async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('authToken');
    await dio.post(
      '$baseUrl/auth/logout',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      ),
    );
    await prefs.remove('authToken');
  } on DioException catch (e) {
    if (e.response?.statusCode == 401) {
      throw UnauthorizedException();
    }
  }
}
