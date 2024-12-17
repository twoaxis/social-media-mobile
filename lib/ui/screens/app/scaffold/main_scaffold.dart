import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:social_media_mobile/data/color.dart';
import 'package:social_media_mobile/ui/screens/app/friends/friend_page.dart';
import 'package:social_media_mobile/ui/screens/app/posting/posting_page.dart';
import 'package:social_media_mobile/ui/screens/app/home/home.dart';
import 'package:social_media_mobile/ui/screens/app/notification/notification_page.dart';
import 'package:social_media_mobile/ui/screens/app/option/option.dart';
import 'package:social_media_mobile/ui/screens/app/search/search_screen.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _AppState();
}

class _AppState extends State<MainScaffold> {
  var index = 0;

  static const screenTitles = [
    "Home",
    "Friends",
    "Search",
    "Notifications",
    "Options"
  ];

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
          SearchScreen(),
          NotificationPage(),
          Option(),
        ],
      ),
      floatingActionButton: index == 0
          ? FloatingActionButton(
              shape: const CircleBorder(),
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.onPrimary,
              child: Icon(
                Icons.add,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        PostingPage(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(0.0, 1.0);
                      const end = Offset.zero;
                      const curve = Curves.easeInOut;

                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));
                      var offsetAnimation = animation.drive(tween);
                      return SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      );
                    },
                  ),
                );
              },
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            label: screenTitles[0],
            tooltip: screenTitles[0],
            icon: index == 0
                ? const Icon(FluentIcons.home_12_filled)
                : const Icon(FluentIcons.home_12_regular),
          ),
          BottomNavigationBarItem(
            label: screenTitles[1],
            tooltip: screenTitles[1],
            icon: index == 1
                ? const Icon(FluentIcons.people_12_filled)
                : const Icon(FluentIcons.people_12_regular),
          ),
          BottomNavigationBarItem(
            label: screenTitles[2],
            tooltip: screenTitles[2],
            icon: index == 2
                ? const Icon(FluentIcons.alert_12_filled)
                : const Icon(FluentIcons.alert_12_regular),
          ),
          BottomNavigationBarItem(
            label: screenTitles[3],
            tooltip: screenTitles[3],
            icon: index == 3
                ? const Icon(FluentIcons.navigation_16_filled)
                : const Icon(FluentIcons.navigation_16_regular),
          ),
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
