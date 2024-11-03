import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:social_media_mobile/ui/screens/app/menu.dart';
import 'package:social_media_mobile/ui/screens/app/search.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final int currentIndex;
  const CustomAppbar({required this.currentIndex, super.key});

  @override
  Widget build(BuildContext context) {
    List<String> appBarTitles = [
      'Profile',
      'Home',
      'Friends',
      'Notifications',
      'Menu',
      'Search',
    ];
    return AppBar(
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
      // title: Text(
      //   appBarTitles[currentPageIndex],
      //   style: const TextStyle(
      //     fontWeight: FontWeight.bold,
      //     fontSize: 20,
      //     color: Color.fromARGB(255, 179, 44, 44),
      //   ),
      // ),
      // centerTitle: true,
      actions: [
        Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color.fromARGB(255, 151, 150, 149)
                      .withOpacity(0.05)),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimaiton) =>
                          const Search(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const begin = Offset(1.0, 0);
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
              icon: const Icon(
                FluentIcons.search_16_filled,
              ),
            ),
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

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
