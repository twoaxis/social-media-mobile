import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:social_media_mobile/data/color.dart';
import 'package:social_media_mobile/ui/components/common/text/custom_text.dart';

class SimpleAppbar extends StatelessWidget implements PreferredSizeWidget {
  SimpleAppbar({required this.title, this.actions, super.key});
  String title;
  List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;

    return AppBar(
      backgroundColor: primaryColor,
      shadowColor: Colors.black,
      elevation: 2.5,
      leadingWidth: maxWidth * 0.1,
      actions: actions,
      title: CustomText(
        text: title,
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
            color: gray.withOpacity(0.05),
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