import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:social_media_mobile/data/color.dart';
import 'package:social_media_mobile/models/post.dart';
import 'package:social_media_mobile/services/post.dart';
import 'package:social_media_mobile/ui/components/common/post/comment_tile.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage({super.key, required this.post});

  final Post post;
  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return CommentTile(
                    commentModel: widget.post.comments[index],
                  );
                },
                itemCount: widget.post.comments.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 10);
                },
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    onSubmitted: (value) {
                      _controller.clear();
                    },
                    decoration: const InputDecoration(
                      hintText: 'Write a comment',
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
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(10),
                    backgroundColor: primaryColor,
                    elevation: 4,
                    shadowColor: Colors.grey,
                  ),
                  onPressed: () async {
                    await createComment(_controller.text, widget.post.id);
                    log(_controller.text);
                    _controller.clear();
                  },
                  child: const Icon(
                    Icons.send,
                    color: secondaryColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
