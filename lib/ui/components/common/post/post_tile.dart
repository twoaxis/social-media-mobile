import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:social_media_mobile/data/color.dart';
import 'package:social_media_mobile/models/post.dart';
import 'package:social_media_mobile/services/get_profile.dart';
import 'package:social_media_mobile/services/post.dart';
import 'package:social_media_mobile/ui/components/common/post/comment_tile.dart';
import 'package:social_media_mobile/ui/screens/app/posting/comments_page.dart';
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
  late bool isLiked;
  late int likeCount;

  @override
  void initState() {

    setState(() {
      likeCount = widget.post.likeCount;
      isLiked =  widget.post.isLiked;
    });
    super.initState();
  }

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
              Map<String, dynamic>? profile = await getProfile('ahmed');
              log(profile.toString());
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Profile(
                    profile: null,
                  ),
                ),
              );
            },
            child: Row(
              children: [
                CircleAvatar(
                  radius: 21,
                  backgroundColor: secondaryColor,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/icon-user.png'),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  widget.post.author.name,
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
                      if (isLiked) {
                        setState(() {
                          likeCount--;
                          isLiked = false;
                        });
                        unlikePost(postId: widget.post.id);
                      } else {
                        setState(() {
                          likeCount++;
                          isLiked = true;
                        });
                        likePost(postId: widget.post.id);
                      }
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: isLiked ? secondaryColor : Colors.grey,
                    ),
                  ),
                  Text(likeCount.toString()),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommentsPage(
                            post: widget.post,
                          ),
                        ),
                      );
                    },
                    icon: Icon(Icons.comment),
                  ),
                  Text(
                    widget.post.comments.length.toString(),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            color: Colors.grey.withOpacity(0.3),
            thickness: 1,
          ),
          widget.post.comments.isNotEmpty
              ? InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CommentsPage(
                          post: widget.post,
                        ),
                      ),
                    );
                  },
                  child: CommentTile(
                    commentModel: widget.post.comments[0],
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
