import 'package:flutter/material.dart';
import 'package:social_media_mobile/models/post.dart';
import 'package:social_media_mobile/ui/components/common/custom_bottom_navbar.dart';
import 'package:social_media_mobile/ui/components/common/post_tile.dart';
import 'package:social_media_mobile/ui/components/common/custom_sliver_app_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
	return Scaffold(
	  body: CustomScrollView(
		slivers: [
		  CustomSliverAppBar(),
		  SliverList(
			delegate: SliverChildBuilderDelegate(
			  childCount: 10,
			  (context, index) => PostTile(
				post: Post(
				
				  commentCount: 10,
				  likeCount: 10,
				  profileImageUrl: 'https://picsum.photos/200/300',
				  userName: 'John Doe',
				  postContent: 'Hello World',
				),
			  ),
			),
		  )
		],
	  ),
	  bottomNavigationBar: CustomBottomNavbar.bottomNavBar(),
	);
  }
}
