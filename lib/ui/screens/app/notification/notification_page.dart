import 'package:flutter/material.dart';
import 'package:social_media_mobile/ui/components/common/notification/notification.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
    );
  }
}
