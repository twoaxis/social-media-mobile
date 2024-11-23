import 'package:flutter/material.dart';
import 'package:social_media_mobile/ui/components/common/notification/notification.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return 
         
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 10,
              (context, index) => Notificate(),
            ),
          );
  }
}
