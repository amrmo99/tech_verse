import 'package:flutter/material.dart';
import 'package:session7test/Components/blog_posts.dart';
import 'package:session7test/Components/recent_posts.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            BlogPosts(),
            const ColoredBox(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Recent Posts",
                      style: TextStyle(
                        color: Color(0xff385f98),
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(
                        color: Color(0xff385f98),
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            RecentPosts(),
          ],
        ),
      ],
    );
  }
}
