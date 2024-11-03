import 'package:flutter/material.dart';
import 'package:social_media_mobile/data/color.dart';
import 'package:social_media_mobile/models/post.dart';
import 'package:social_media_mobile/ui/components/common/comment_tile.dart';
import 'package:social_media_mobile/ui/screens/app/comments_page.dart';
import 'package:social_media_mobile/ui/screens/app/full_screen_image.dart';

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
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(width: 10),
              CircleAvatar(
                radius: 21,
                backgroundColor: secondarycolor,
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(widget.post.profileImageUrl),
                ),
              ),
              SizedBox(width: 10),
              Text(widget.post.userName,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              widget.post.postContent,
              overflow: TextOverflow.fade,
            ),
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
                      color: isLiked ? secondarycolor : Colors.grey,
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
          Row(
            children: [
              SizedBox(width: 16),
              Expanded(child: CommentTile()),
            ],
          ),
        ],
      ),
    );
  }
}
