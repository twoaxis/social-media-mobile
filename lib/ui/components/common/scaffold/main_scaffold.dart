import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:scroll_to_hide/scroll_to_hide.dart';
import 'package:social_media_mobile/data/color.dart';
import 'package:social_media_mobile/ui/components/common/scaffold/custom_bottom_navbar.dart';
import 'package:social_media_mobile/ui/components/common/scaffold/custom_sliver_app_bar.dart';
import 'package:social_media_mobile/ui/screens/app/friend_page.dart';
import 'package:social_media_mobile/ui/screens/app/home/home.dart';
import 'package:social_media_mobile/ui/screens/app/notification/notification_page.dart';
import 'package:social_media_mobile/ui/screens/app/profile/profile.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _currentIndex = 0;
  List<String> titles = ['Home', 'Profile', 'Friend', 'Notification'];
  List<Widget> screens = [
    const Home(),
    const Profile(),
    const FriendPage(),
    const NotificationPage(),
  ];
  final ScrollController _scrollController = ScrollController();
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            CustomSliverAppBar(
              isCenter: titles[_currentIndex] == 'Home',
              title: titles[_currentIndex],
              image: titles[_currentIndex] == 'Home'
                  ? 'assets/images/logo.png'
                  : '',
            ),
            screens[_currentIndex],
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavbar(
        scrollController: _scrollController,
        onPageChanged: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavigationBarItem(
            label: titles[0],
            tooltip: titles[0],
            icon: _currentIndex == 0
                ? const Icon(FluentIcons.home_12_filled)
                : const Icon(FluentIcons.home_12_regular),
          ),
          BottomNavigationBarItem(
            label: titles[1],
            tooltip: titles[1],
            icon: _currentIndex == 1
                ? CircleAvatar(
                    radius: 19.75,
                    backgroundColor: kSecondaryColor,
                    child: CircleAvatar(
                      radius: 18,
                      foregroundImage: const AssetImage(
                        'assets/images/Sillycat.jpeg',
                      ),
                    ),
                  )
                : CircleAvatar(
                    radius: 16,
                    foregroundImage: const AssetImage(
                      'assets/images/Sillycat.jpeg',
                    ),
                  ),
          ),
          BottomNavigationBarItem(
            label: titles[2],
            tooltip: titles[2],
            icon: _currentIndex == 2
                ? const Icon(FluentIcons.people_12_filled)
                : const Icon(FluentIcons.people_12_regular),
          ),
          BottomNavigationBarItem(
            label: titles[3],
            tooltip: titles[3],
            icon: _currentIndex == 3
                ? const Icon(FluentIcons.alert_12_filled)
                : const Icon(FluentIcons.alert_12_regular),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ScrollToHide(
        hideDirection: Axis.vertical,
        scrollController: _scrollController,
        duration: const Duration(milliseconds: 400),
        child: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {},
          tooltip: 'Add New Post',
          child: Icon(FluentIcons.add_12_filled),
        ),
      ),
    );
  }
}
