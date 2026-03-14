import 'package:flutter/material.dart';
import 'package:simple_social_media_app/features/home/home_presentation/home_widgets/app_background.dart';
import 'package:simple_social_media_app/features/posts/posts_presentation/posts_widgets/avatar.dart';

class FeedTab extends StatelessWidget {
  const FeedTab({super.key});

  @override
  Widget build(BuildContext context) {
    // dummy posts
    // final posts = List.generate(5, (index) => "Post from followed user #$index");

    return AppBackground(
      child: ListView(
        // padding: const EdgeInsets.all(12),
        // itemCount: posts.length,
        // itemBuilder: (context, index) {
        //   return Card(
        //     margin: const EdgeInsets.symmetric(vertical: 8),
        //     child: Padding(
        //       padding: const EdgeInsets.all(16),
        //       child: Text(posts[index]),
        //     ),
        //   );
        // },
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFF9F8F6),
                borderRadius: BorderRadius.circular(16),
              ),
                  width: 250,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(children: [
                Avatar(img: "images/mypic.jpg"),
                SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                        decoration: BoxDecoration(
                          color: Color(0xFFD9CFC7),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text("What's on your mind?"
                    ,style: TextStyle(fontSize: 20,color: Color(0xFF8B8987)),)),
                  ),
              ],),
            ),
          ),
        ],
      ),
    );
  }
}
