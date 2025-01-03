import 'package:flutter/material.dart';
import 'package:social_media_mobile/data/color.dart';
import 'package:social_media_mobile/helpers/time_difference.dart';
import 'package:social_media_mobile/models/notification_model.dart';

class Notificate extends StatelessWidget {
  const Notificate({
    super.key,
    required this.notification,
  });
  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
          constraints: BoxConstraints(
            minHeight: 80,
          ),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  top: 5.0,
                  bottom: 5.0,
                  right: 10.0,
                ),
                child: Text(
                  notification.title!,
                  style: TextStyle(
                    color: secondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: Text(
                  notification.description!,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(

                  right: 8.0,
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    timeDifference(notification.createdAt!, 'yyyy-MM-ddTHH:mm:ssZ'),
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
