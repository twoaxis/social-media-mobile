import 'package:flutter/material.dart';
import 'package:social_media_mobile/data/color.dart';
import 'package:social_media_mobile/ui/screens/app/friend_page.dart';
import 'package:social_media_mobile/ui/screens/app/home/home.dart';
import 'package:social_media_mobile/ui/screens/app/notification/notification_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  var index = 0;

  static const screenTitles = [
    "Home",
    "Friends",
    "Notifications",
    "Options"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(screenTitles[index]),
      ),
      body: IndexedStack(
        index: index,
        children: [
          Home(),
          FriendPage(),
          NotificationPage(),
          Home()
        ],
      ),
      floatingActionButton: index == 0 ? FloatingActionButton( 
        child: Icon(Icons.add),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        onPressed: () {
        
        }
      ) : null,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "Friends"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Notifications"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Options")
        ],
        onTap: (selection) {
          setState(() {
            index = selection;
          });
        },
      ),
    );
  }
}
