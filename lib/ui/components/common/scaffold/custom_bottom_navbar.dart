import 'package:flutter/material.dart';
import 'package:scroll_to_hide/scroll_to_hide.dart';
import 'package:social_media_mobile/data/color.dart';

class CustomBottomNavbar extends StatefulWidget {
  final ValueChanged<int> onPageChanged;
  final List<BottomNavigationBarItem> items;
  final ScrollController? scrollController;

  const CustomBottomNavbar(
      {super.key,
      required this.items,
      required this.onPageChanged,
      this.scrollController});

  @override
  State<CustomBottomNavbar> createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends State<CustomBottomNavbar> {
  bool isVisible = true;
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ScrollToHide(
      hideDirection: Axis.vertical,
      scrollController: widget.scrollController!,
      duration: Duration(milliseconds: 400),
      height: 77.5,
      child: BottomNavigationBar(
        elevation: 8,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() => _currentIndex = index);
          widget.onPageChanged(index);
        },
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(237, 219, 219, 219),
        selectedItemColor: kSecondaryColor,
        unselectedItemColor: kGray,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        selectedIconTheme: const IconThemeData(size: 30),
        items: widget.items,
      ),
    );
  }
}
