import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:social_media_mobile/data/constants.dart';

import '../models/user.dart';


Future<List<User>> searchUsers(var query) async {
  var dio = Dio();
  List<User> users = [];

  try {
    var result = await dio.get("$baseUrl/users/search", queryParameters: {
      "query": query
    });

    for (Map<String, dynamic> json in result.data) {
      users.add(User.fromJson(json));
    }
  }
  on Exception {
    if (kDebugMode) {
      print("An error has occured.");
    }
  }

  return users;
}