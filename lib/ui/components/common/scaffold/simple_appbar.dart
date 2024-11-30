import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:social_media_mobile/data/color.dart';
import 'package:social_media_mobile/ui/components/common/text/custom_text.dart';

class SimpleAppbar extends StatelessWidget implements PreferredSizeWidget {
  const SimpleAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;

    return AppBar(
      backgroundColor: kPrimaryColor,
      shadowColor: Colors.black,
      elevation: 2.5,
      leadingWidth: maxWidth * 0.1,
      title: CustomText(
        text: 'Edit Profile',
        fontSize: 20,
        fontWeight: FontWeight.bold,
        colorName: 'red',
      ),
      centerTitle: true,
      leading: Padding(
        padding: EdgeInsets.only(left: maxWidth * 0.01),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: kGray.withOpacity(0.05),
          ),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(FluentIcons.arrow_left_12_filled),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
