import 'dart:developer';

import 'package:social_media_mobile/data/constants.dart';
import 'package:social_media_mobile/services/api.dart';

Future<Map<String, dynamic>> getProfile(String username) async {
  Map<String, dynamic> profile = await Api.get('$baseUrl/users/$username');

  log(profile.toString());
  return profile;
}
