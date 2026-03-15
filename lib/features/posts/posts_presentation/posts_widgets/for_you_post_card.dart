import 'package:flutter/material.dart';
import 'package:simple_social_media_app/features/posts/posts_presentation/posts_widgets/avatar.dart';

import '../../posts_domain/posts_domain_entities/posts_entity.dart';

class ForYouPostCard extends StatelessWidget {
  final Post post;

  const ForYouPostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: Avatar + Author
            Row(
              children: [
                Avatar(img: post.authorAvatar),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          post.authorName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(width: 8),
                        MaterialButton(
                          onPressed: () {},
                          color: Color(0xFFC9B59C),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          height: 25,
                          child: Text("Follow", style: TextStyle(fontSize: 12)),
                        ),
                      ],
                    ),
                    Text(
                      "${post.createdAt.hour}:${post.createdAt.minute}",
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.more_vert, color: Color(0xFF8B8987)),
              ],
            ),

            const SizedBox(height: 12),

            // النص لو موجود
            if (post.text != null && post.text!.isNotEmpty)
              Text(post.text!, style: const TextStyle(fontSize: 14)),

            // الصورة لو موجودة
            if (post.imageUrl != null && post.imageUrl!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    post.imageUrl!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 350,
                  ),
                ),
              ),

            const SizedBox(height: 8),

            // Footer: like/comment
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite_border, color: Color(0xFF8B8987)),
                ),
                SizedBox(width: 8),
                Text("0"),
                SizedBox(width: 16),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.comment, color: Color(0xFF8B8987)),
                ),
                SizedBox(width: 8),
                Text("0"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
