import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media_mobile/data/constants.dart';
import 'package:social_media_mobile/services/api.dart';

Future<Map<String, dynamic>> getProfile(String username) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("authToken");
  Map<String, dynamic>? profile =
      await Api.get('$baseUrl/users/$username', header: {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  });

  log(profile.toString());
  return profile ?? {};
}
