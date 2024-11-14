import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:social_media_mobile/ui/screens/app/friend_page.dart';
import 'package:social_media_mobile/ui/screens/app/home/home.dart';
import 'package:social_media_mobile/ui/screens/app/notification/notification_page.dart';
import 'package:social_media_mobile/ui/screens/app/profile/profile.dart';

class CustomBottomNavbar extends StatefulWidget {
  const CustomBottomNavbar.bottomNavBar({super.key});

  @override
  State<CustomBottomNavbar> createState() => _CustomBottomNavbarState();
}

int currentPageIndex = 0;
List<String> bottomNavItems = ['Home', 'Profile', 'Friends', 'Notifications'];

class _CustomBottomNavbarState extends State<CustomBottomNavbar> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      Home(),
      Profile(),
      FriendPage(),
      NotificationPage(),
    ];
    void navBarOnTap(int index) {
      setState(
        () {
          currentPageIndex = index;
        },
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => pages[index],
        ),
      );
    }

    return SizedBox(
      height: 77.5,
      child: BottomNavigationBar(
        onTap: navBarOnTap,
          currentIndex: currentPageIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color.fromARGB(237, 219, 219, 219),
          selectedItemColor: const Color.fromARGB(255, 179, 44, 44),
          unselectedItemColor: const Color.fromARGB(255, 111, 110, 110),
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          selectedIconTheme: const IconThemeData(size: 30),
          items: [
          BottomNavigationBarItem(
            label: bottomNavItems[0],
            icon: currentPageIndex == 0
                ? const Icon(FluentIcons.home_12_filled)
                : const Icon(FluentIcons.home_12_regular),
          ),
          BottomNavigationBarItem(
              label: bottomNavItems[1],
              icon: currentPageIndex == 1
                  ? const Icon(Icons.person)
                  : const Icon(Icons.person_outline),
          ),
          BottomNavigationBarItem(
            label: bottomNavItems[2],
              icon: currentPageIndex == 2
                  ? const Icon(FluentIcons.people_12_filled)
                  : const Icon(FluentIcons.people_12_regular),
            ),
            BottomNavigationBarItem(
              label: bottomNavItems[3],
              icon: currentPageIndex == 3
                  ? const Icon(FluentIcons.alert_12_filled)
                  : const Icon(FluentIcons.alert_12_regular),
            ),
        ],
      ),
    );
  }
}
