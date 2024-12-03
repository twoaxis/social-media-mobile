import 'package:flutter/material.dart';
import 'package:social_media_mobile/ui/components/common/appbar/custom_app_bar.dart';
import 'package:social_media_mobile/ui/components/common/navigation/custom_bottom_navbar.dart';
import 'package:social_media_mobile/ui/components/common/notification/notification.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title: 'Notifications',
              isCenter: false,
              image: '',
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => Notificate(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavbar.bottomNavBar(),
    );
  }
}
