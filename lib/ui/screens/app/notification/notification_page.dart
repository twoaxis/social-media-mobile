import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:social_media_mobile/models/notification_model.dart';
import 'package:social_media_mobile/services/api_notification.dart';
import 'package:social_media_mobile/ui/components/common/notification/notification.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<NotificationModel> notifications = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchNotifications();
  }

  Future<void> _fetchNotifications() async {
    try {
      notifications = await getNotifications();
      setState(() {
        isLoading = false;
      });
    } catch (error) {
      log('Error fetching notifications: $error');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : notifications.isEmpty
            ? const Center(
                child: Text(
                  'No notifications found.',
                  style: TextStyle(fontSize: 18),
                ),
              )
            : ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  return Notificate(notification: notifications[index]);
                },
              );
  }
}
