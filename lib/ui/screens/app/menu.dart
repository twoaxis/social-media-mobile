import 'package:flutter/material.dart';
import 'package:social_media_mobile/ui/components/common/custom_bottomnavbar.dart';

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
      bottomNavigationBar: CustomBottomnavbar.bottomNavBar(),
    );
  }
}
