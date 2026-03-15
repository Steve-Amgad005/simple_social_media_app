import 'package:flutter/material.dart';
import 'package:simple_social_media_app/features/home/home_presentation/home_widgets/app_background.dart';
import 'package:simple_social_media_app/features/posts/posts_presentation/posts_widgets/avatar.dart';

import '../../posts_domain/posts_domain_entities/posts_entity.dart';
import '../posts_widgets/feed_post_card.dart';

class FeedTab extends StatelessWidget {
  const FeedTab({super.key});

  @override
  Widget build(BuildContext context) {
    final posts = [
      Post(
        authorName: "Charlie",
        authorAvatar: "images/mypic.jpg",
        text: "Suggested post with text only",
        createdAt: DateTime.now(),
      ),
      Post(
        authorName: "Diana",
        authorAvatar: "images/diana.jpg",
        imageUrl: "images/mypic.jpg",
        createdAt: DateTime.now(),
      ),
      Post(
        authorName: "Eve",
        authorAvatar: "images/eve.jpg",
        text: "Suggested post with text + image",
        imageUrl: "images/mypic.jpg",
        createdAt: DateTime.now(),
      ),
    ];

    return AppBackground(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFF9F8F6),
                borderRadius: BorderRadius.circular(16),
              ),
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  Avatar(img: "images/mypic.jpg"),
                  SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: Color(0xFFD9CFC7),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/addPost");
                        },
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "What's on your mind?",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF8B8987),
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // البوستات
          ListView.builder(
            shrinkWrap: true,
            // مهم جداً
            physics: NeverScrollableScrollPhysics(),
            // مهم جداً
            padding: const EdgeInsets.all(12),
            itemCount: posts.length,
            itemBuilder: (context, index) => FeedPostCard(post: posts[index]),
          ),
        ],
      ),
    );
  }
}
