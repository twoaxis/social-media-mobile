import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:social_media_mobile/data/color.dart';
import 'package:social_media_mobile/models/post.dart';
import 'package:social_media_mobile/models/profile_model.dart';
import 'package:social_media_mobile/services/get_profile.dart';
import 'package:social_media_mobile/ui/components/common/post/comment_tile.dart';
import 'package:social_media_mobile/ui/screens/app/posting/comments_page.dart';
import 'package:social_media_mobile/ui/screens/app/posting/full_screen_image.dart';
import 'package:social_media_mobile/ui/screens/app/profile/profile.dart';

class PostTile extends StatefulWidget {
  final Post post;

  const PostTile({
    super.key,
    required this.post,
  });

  @override
  State<PostTile> createState() => _PostTileState();
}

class _PostTileState extends State<PostTile> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () async {
              Map<String, dynamic> profile = await getProfile('mhmaldyb510');
              log(profile.toString());
              Navigator.push(
                  // ignore: use_build_context_synchronously
                  context,
                  MaterialPageRoute(
                    builder: (context) => Profile(
                      profile: ProfileModel.fromJson(profile),
                    ),
                  ));
            },
            child: Row(
              children: [
                CircleAvatar(
                  radius: 21,
                  backgroundColor: kSecondaryColor,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/icon-user.png'),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  widget.post.userName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Text(
            widget.post.content,
            overflow: TextOverflow.fade,
          ),
          SizedBox(height: 10),
          widget.post.imageUrl.isNotEmpty
              ? GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FullScreenImage(),
                    ),
                  ),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.width,
                    width: double.infinity,
                    child: Image.network(
                      widget.post.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : SizedBox(),
          Divider(
            color: Colors.grey.withOpacity(0.3),
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      isLiked = !isLiked;
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: isLiked ? kSecondaryColor : Colors.grey,
                    ),
                  ),
                  Text(isLiked
                      ? '${widget.post.likeCount + 1}'
                      : '${widget.post.likeCount}'),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommentsPage(),
                        ),
                      );
                    },
                    icon: Icon(Icons.comment),
                  ),
                  Text(widget.post.commentCount.toString()),
                ],
              ),
            ],
          ),
          Divider(
            color: Colors.grey.withOpacity(0.3),
            thickness: 1,
          ),
          CommentTile(),
        ],
      ),
    );
  }
}
