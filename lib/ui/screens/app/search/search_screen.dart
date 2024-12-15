import 'package:flutter/material.dart';
import 'package:social_media_mobile/data/color.dart';
import 'package:social_media_mobile/models/user.dart';
import 'package:social_media_mobile/services/get_profile.dart';
import 'package:social_media_mobile/services/search_api.dart';

import '../../../../models/profile_model.dart';
import '../profile/profile.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  List<User> users = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _controller,
                  onSubmitted: (value) {
                    _controller.clear();
                  },
                  decoration: const InputDecoration(
                    hintText: 'Search for someone!',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(
                        color: secondaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 5),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(10),
                backgroundColor: primaryColor,
                elevation: 4,
                shadowColor: Colors.grey,
              ),
              onPressed: () async {
                var result = await searchUsers(_controller.text);

                setState(() {
                  users = result;
                });
              },
              child: const Icon(
                Icons.search,
                color: secondaryColor,
              ),
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async {

                    var profile = await getProfile(users[index].username);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Profile(
                          profile: ProfileModel.fromJson(
                            profile,
                          ),
                        ),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 31,
                        backgroundColor: secondaryColor,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              AssetImage('assets/images/icon-user.png'),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            users[index].name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("@${users[index].username}"),
                        ],
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Padding(padding: const EdgeInsets.all(8.0));
              },
            ),
          ),
        )
      ],
    );
  }
}
