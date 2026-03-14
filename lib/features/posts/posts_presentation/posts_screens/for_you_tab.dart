import 'package:flutter/material.dart';
class ForYouTab extends StatelessWidget {
  const ForYouTab({super.key});

  @override
  Widget build(BuildContext context) {
    // dummy posts
    final posts = List.generate(5, (index) => "Suggested post #$index");

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(posts[index]),
          ),
        );
      },
    );
  }
}