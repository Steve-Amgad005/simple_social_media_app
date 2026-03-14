import 'package:flutter/material.dart';

import 'feed_tab.dart';
import 'for_you_tab.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF9F8F6),
          title: Image.asset("images/logo.png",width: 100,height: 100,),
          toolbarHeight: 100,
          centerTitle: true,
          bottom: TabBar(
            labelStyle: TextStyle(color: Color(0xFFC9B59C),fontSize: 18,fontWeight: FontWeight.w500),
            unselectedLabelColor: Color(0xFFC9B59C),
            indicatorColor: Color(0xFFBFA989),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 5,
            tabs: [
              Tab(text: "Feed"),
              Tab(text: "For You"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FeedTab(),
            ForYouTab(),
          ],
        ),
      ),
    );
  }
}
