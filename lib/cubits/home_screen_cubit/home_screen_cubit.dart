import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:social_media_mobile/data/constants.dart';
import 'package:social_media_mobile/models/post.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenInitial()) {
    getPosts(
        token:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MiIsImVtYWlsIjoibWhtYWxkeWI1MTBAZ21haWwuY29tIiwiZXhwIjoxNzMzMDYxOTUxLCJpc3MiOiJ0d29heGlzLnh5eiJ9.MdUXZ0gexoBjPKSf3lBAFwaONFH8-cG_CzowegFKTSI');
  }

  Future<List<Post>> getPosts({required String token}) async {
    Dio dio = Dio();

    List<Post> posts = [];
    emit(HomeScreenLoading());
    try {
      var response = await dio.get(
        '$baseUrl/posts',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          },
        ),
      );
      for (Map<String, dynamic> json in response.data) {
        posts.add(Post.fromJson(json));
      }
      emit(HomeScreenLoaded(posts: posts));
    } on DioException catch (e) {
      log(e.response.toString());
      log(e.response?.statusCode.toString()??'no status code');
      emit(HomeScreenError());
    }
    return [];
  }
}
