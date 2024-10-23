import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:social_media_mobile/ui/screens/app/posting.dart';

class PostFloatingbutton extends StatelessWidget {
  const PostFloatingbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: const Color.fromARGB(255, 179, 44, 44),
      shape: const CircleBorder(),
      onPressed: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimaiton) =>
                const Posting(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(0.0, 1.0);
              const end = Offset.zero;
              const curve = Curves.easeInOut;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);
              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
          ),
        );
      },
      child: const Icon(
        FluentIcons.add_12_filled,
        color: Color.fromARGB(255, 255, 255, 255),
      ),
    );

    // !!!
    // When using this on a BottomNavigationBar "BNB" un-comment these lines to make it be on the top center of the BNB

    // floatingActionButtonLocation:
    // FloatingActionButtonLocation.centerDocked;
  }
}
