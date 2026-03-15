import 'package:flutter/material.dart';
import 'package:simple_social_media_app/features/home/home_presentation/home_widgets/app_background.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Color(0xFFF9F8F6),
        title: Padding(
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
                      hintText: "Search",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0xFF9E968D),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search, color: Color(0xFF9E968D)),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      body: AppBackground(child: Center(child: Image.asset("images/logo.png"))),
    );
  }
}
