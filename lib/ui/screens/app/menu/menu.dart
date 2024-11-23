import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:social_media_mobile/ui/components/common/scaffold/custom_bottom_navbar.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.lightBlue),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Back'),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavbar(
        onPageChanged: (index) {},
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: const Icon(FluentIcons.home_12_filled),
          ),
          BottomNavigationBarItem(
            label: 'Home',
            icon: const Icon(FluentIcons.home_12_filled),
          ),
          BottomNavigationBarItem(
            label: 'Home',
            icon: const Icon(FluentIcons.home_12_filled),
          ),
        ],
      ),
    );
  }
}
