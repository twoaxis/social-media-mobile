import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media_mobile/data/constants.dart';
import 'package:social_media_mobile/models/notification_model.dart';

Dio dio = Dio();

// get Notification
Future<List<NotificationModel>> getNotifications() async {
  List<NotificationModel> notifications = [];
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('authToken');
  try {
    Response response = await dio.get(
      '$baseUrl/notifications',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
    notifications = (response.data as List)
        .map((e) => NotificationModel.fromJson(e))
        .toList();
  } on DioException {
    log("An error has occurred");
  }
  return notifications;
}
