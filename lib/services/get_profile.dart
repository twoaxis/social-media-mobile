import 'dart:developer';

import 'package:social_media_mobile/services/api.dart';

Future<Map<String, dynamic>> getProfile(String username) async {
    Map<String,dynamic> profile = await Api().get('http://18.193.81.175/users/$username');
  

  log(profile.toString());
  return profile;
}
