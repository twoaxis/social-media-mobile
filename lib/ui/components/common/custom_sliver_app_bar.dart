import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:social_media_mobile/data/color.dart';
import 'package:social_media_mobile/ui/screens/app/menu.dart';
import 'package:social_media_mobile/ui/screens/app/search.dart';
import 'custom_bottom_navbar.dart';

List<String> appBarTitles = [
  'Home',
  'Profile',
  'Friends',
  'Notifications',
];

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      shadowColor: Colors.black,
      elevation: 3.5,
      leadingWidth: 125,
      leading: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Image.asset(
          'assets/images/logo.png',
        ),
      ),
      title: Text(
        appBarTitles[currentPageIndex],
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: secondarycolor,
        ),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color.fromARGB(255, 151, 150, 149).withOpacity(0.05),
            ),
            child: Search(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color.fromARGB(255, 151, 150, 149).withOpacity(0.05),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimaiton) =>
                        const Menu(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(1.0, 0.0);
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
              iconSize: 25,
              icon: const Icon(FluentIcons.navigation_24_filled),
            ),
          ),
        ),
      ],
    );
  }
}
