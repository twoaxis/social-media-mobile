import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:social_media_mobile/data/color.dart';
import 'package:social_media_mobile/ui/screens/app/menu/menu.dart';
import 'package:social_media_mobile/ui/screens/app/search/search.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    this.title = '',
    this.image = '',
    required this.isCenter,
  });

  final String title;
  final String image;
  final bool isCenter;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      shadowColor: Colors.black,
      elevation: 3.5,
      leadingWidth: image.isNotEmpty ? 125 : 40,
      automaticallyImplyLeading: false,
      leading: image.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Image.asset(image),
            )
          : title == 'Following' || title == 'Followers'
              ? IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    size: 25,
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                )
              : null,
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 23,
          color: kSecondaryColor,
        ),
      ),
      centerTitle: isCenter,
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
                    pageBuilder: (context, animation, secondaryAnimation) =>
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
              icon: const Icon(FluentIcons.navigation_16_filled),
            ),
          ),
        ),
      ],
    );
  }
}
