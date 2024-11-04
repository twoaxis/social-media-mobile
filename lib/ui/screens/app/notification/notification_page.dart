import 'package:flutter/material.dart';
import 'package:social_media_mobile/ui/components/common/navigation/custom_bottom_navbar.dart';
import 'package:social_media_mobile/ui/components/common/appbar/custom_sliver_app_bar.dart';
import 'package:social_media_mobile/ui/components/common/notification/notification.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 10,
              (context, index) => Notificate(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavbar.bottomNavBar(),
    );
  }
}
