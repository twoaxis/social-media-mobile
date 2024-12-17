import 'package:flutter/material.dart';
import 'package:social_media_mobile/data/color.dart';
import 'package:social_media_mobile/models/comment_model.dart';
import 'package:social_media_mobile/models/profile_model.dart';
import 'package:social_media_mobile/services/get_profile.dart';
import 'package:social_media_mobile/ui/components/common/misc/profile_image.dart';
import 'package:social_media_mobile/ui/screens/app/profile/profile.dart';

class CommentTile extends StatelessWidget {
  const CommentTile({super.key, required this.commentModel});

  final CommentModel commentModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(125, 225, 225, 225),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                child: BoundedProfileImage(14, 1),
                onTap: () async {
                  var profile = await getProfile(commentModel.author!.username);

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
              ),
              SizedBox(width: 10),
              Text(
                commentModel.author?.name ?? '',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            commentModel.content ?? '',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
