import 'package:flutter/material.dart';
import 'package:simple_social_media_app/features/home/home_presentation/home_widgets/app_background.dart';
import 'package:simple_social_media_app/features/posts/posts_presentation/posts_widgets/for_you_post_card.dart';

import '../../posts_domain/posts_domain_entities/posts_entity.dart';
import '../posts_widgets/feed_post_card.dart';

class ForYouTab extends StatelessWidget {
  const ForYouTab({super.key});

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
      child: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: posts.length,
        itemBuilder: (context, index) => ForYouPostCard(post: posts[index]),
      ),
    );
  }
}