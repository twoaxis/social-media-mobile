import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_mobile/cubits/home_screen_cubit/home_screen_cubit.dart';
import 'package:social_media_mobile/data/color.dart';
import 'package:social_media_mobile/ui/components/common/post/post_tile.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenCubit(),
      child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
        builder: (context, state) {
          if (state is HomeScreenLoading) {
            return SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 2.5),
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          } else if (state is HomeScreenLoaded) {
            log(state.toString());
            if (state.posts.isEmpty) {
              return SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: (MediaQuery.of(context).size.height) / 2.5),
                    child: Column(
                      children: [
                        Text(
                          'No Posts',
                          style: TextStyle(fontSize: 20),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<HomeScreenCubit>(context).getPosts(
                                token:
                                    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MiIsImVtYWlsIjoibWhtYWxkeWI1MTBAZ21haWwuY29tIiwiZXhwIjoxNzMzMDYxOTUxLCJpc3MiOiJ0d29heGlzLnh5eiJ9.MdUXZ0gexoBjPKSf3lBAFwaONFH8-cG_CzowegFKTSI');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kSecondaryColor,
                          ),
                          child: Text(
                            'Refresh',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => PostTile(post: state.posts[index]),
                  childCount: state.posts.length,
                ),
              );
            }
          } else {
            return SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: (MediaQuery.of(context).size.height) / 2.5),
                  child: Column(
                    children: [
                      Text(
                        'Something went wrong',
                        style: TextStyle(fontSize: 20),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<HomeScreenCubit>(context).getPosts(
                              token:
                                  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MiIsImVtYWlsIjoibWhtYWxkeWI1MTBAZ21haWwuY29tIiwiZXhwIjoxNzMzMDYxOTUxLCJpc3MiOiJ0d29heGlzLnh5eiJ9.MdUXZ0gexoBjPKSf3lBAFwaONFH8-cG_CzowegFKTSI');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kSecondaryColor,
                        ),
                        child: Text(
                          'Refresh',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
