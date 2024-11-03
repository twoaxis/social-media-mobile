import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class CustomBottomNavbar extends StatefulWidget {
  const CustomBottomNavbar.bottomNavBar({super.key});

  @override
  State<CustomBottomNavbar> createState() => _CustomBottomNavbarState();
}

int currentPageIndex = 1;
List<String> bottomNavItems = ['Profile', 'Home', 'Friends', 'Notifications'];

class _CustomBottomNavbarState extends State<CustomBottomNavbar> {
  @override
  Widget build(BuildContext context) {
    void navBarOnTap(int index) {
      setState(() {
        currentPageIndex = index;
      });
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
                    ? Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: const Color.fromARGB(255, 179, 44, 44),
                              width: 1.75),
                        ),
                        child: CircleAvatar(
                          radius: 18,
                          foregroundImage: AssetImage(
                            'assets/images/Sillycat.jpeg',
                          ),
                          backgroundColor:
                              const Color.fromARGB(255, 179, 44, 44),
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: const Color.fromARGB(255, 111, 110, 110),
                              width: 1.25),
                        ),
                        child: CircleAvatar(
                          radius: 16,
                          foregroundImage: AssetImage(
                            'assets/images/Sillycat.jpeg',
                          ),
                          backgroundColor:
                              const Color.fromARGB(255, 179, 44, 44),
                        ),
                      )
                // icon: currentPageIndex == 0
                //     ? const Icon(FluentIcons.person_12_filled)
                //     : const Icon(FluentIcons.person_12_regular),
                ),
            BottomNavigationBarItem(
              label: bottomNavItems[1],
              icon: currentPageIndex == 1
                  ? const Icon(FluentIcons.home_12_filled)
                  : const Icon(FluentIcons.home_12_regular),
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
          ],),
    );
  }
}
