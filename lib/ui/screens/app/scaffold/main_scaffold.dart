import 'package:flutter/material.dart';
import 'package:social_media_mobile/data/color.dart';
import 'package:social_media_mobile/ui/screens/app/friends/friend_page.dart';
import 'package:social_media_mobile/ui/screens/app/posting/posting_page.dart';
import 'package:social_media_mobile/ui/screens/app/home/home.dart';
import 'package:social_media_mobile/ui/screens/app/notification/notification_page.dart';
import 'package:social_media_mobile/ui/screens/app/option/option.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _AppState();
}

class _AppState extends State<MainScaffold> {
  var index = 0;

  static const screenTitles = ["Home", "Friends", "Notifications", "Options"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          screenTitles[index],
        ),
      ),
      body: IndexedStack(
        index: index,
        children: [
          Home(),
          FriendPage(),
          NotificationPage(),
          Option(),
        ],
      ),
      floatingActionButton: index == 0
          ? FloatingActionButton(
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.onPrimary,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PostingPage(),
                  ),
                );
              },
              child: Icon(
                Icons.add,
              ),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "Friends"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: "Notifications"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Options")
        ],
        onTap: (selection) {
          setState(
            () {
              index = selection;
            },
          );
        },
      ),
    );
  }
}
