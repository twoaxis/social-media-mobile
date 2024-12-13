import 'package:flutter/material.dart';
import 'package:social_media_mobile/data/color.dart';
import 'package:social_media_mobile/models/user.dart';
import 'package:social_media_mobile/ui/components/common/follow/follower_tile.dart';
import 'package:social_media_mobile/ui/components/common/follow/following_tile.dart';

class Follow extends StatelessWidget {
  const Follow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Follow',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              labelColor: secondaryColor,
              labelStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              tabs: [
                Tab(
                  text: 'Followers',
                ),
                Tab(
                  text: 'Following',
                ),
              ],
              dividerColor: Colors.grey.shade300,
              indicatorColor: secondaryColor,
              indicatorSize: TabBarIndicatorSize.values[1],
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) => Followers(
                      user: User(
                        username: '',
                        name: 'Eldeeb',
                        id: 1,
                      ),
                    ),
                  ),
                  ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) => Following(
                      user: User(
                        username: '',
                        name: 'Hegazy',
                        id: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// void follow(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     builder: (BuildContext context) {
//       return SizedBox(
//         height: 130,
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextButton(
//                 style: TextButton.styleFrom(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 100.0, // Control horizontal padding
//                     vertical: 13.0, // Control vertical padding
//                   ),
//                 ),
//                 onPressed: () {
// followers('ahmed');
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => FollowerPage(),
//                     ),
//                   );
//                 },
//                 child: const Text(
//                   'Followers',
//                   maxLines: 1,
//                   style: TextStyle(
//                     color: black,
//                     fontSize: 20,
//                   ),
//                 ),
//               ),
//               Divider(),
//               TextButton(
//                 style: TextButton.styleFrom(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 100.0, // Control horizontal padding
//                     vertical: 13.0, // Control vertical padding
//                   ),
//                 ),
//                 onPressed: () {
//                   following('ahmed');
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => FollowingPage(),
//                     ),
//                   );
//                 },
//                 child: const Text(
//                   'Following',
//                   maxLines: 1,
//                   style: TextStyle(
//                     color: black,
//                     fontSize: 20,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }
