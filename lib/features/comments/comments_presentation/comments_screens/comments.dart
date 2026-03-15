import 'package:flutter/material.dart';
import 'package:simple_social_media_app/features/home/home_presentation/home_widgets/app_background.dart';

import '../../comments_domain/comments_domain_entities/comments_entity.dart';
import '../comments_widgets/others_comment_tile.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Comment> dummyComments = [
      Comment(
        authorName: "Alice",
        authorAvatar: "images/alice.jpg",
        text: "This is the first comment!",
        createdAt: DateTime.now().subtract(const Duration(minutes: 5)),
      ),
      Comment(
        authorName: "Bob",
        authorAvatar: "images/bob.jpg",
        text: "Nice post, I really like it.",
        createdAt: DateTime.now().subtract(const Duration(minutes: 2)),
      ),
      Comment(
        authorName: "Charlie",
        authorAvatar: "images/mypic.jpg",
        text: "Thanks for sharing!",
        createdAt: DateTime.now(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Comments"),
        backgroundColor: Color(0xFFF9F8F6),
        toolbarHeight: 65,
      ),

      body: AppBackground(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
            itemCount: dummyComments.length,
            itemBuilder: (context, index) =>
                OthersCommentTile(comment: dummyComments[index]),
          ),
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFD9CFC7),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: "Add a comment...",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}