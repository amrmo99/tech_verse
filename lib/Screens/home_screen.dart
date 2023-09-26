
import 'package:flutter/material.dart';
import 'package:session7test/Components/blog_posts.dart';

import 'package:session7test/Components/recent_posts.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Container(
          height: 40,
          margin: EdgeInsets.only(top: 17),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color(0xff385f98), width: 1)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    'Search',
                    style: TextStyle(fontSize: 15),
                  ),
                )),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.search_rounded,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              margin: EdgeInsets.only(top: 15),
              height: 50,
              width: 40,
              decoration: BoxDecoration(
                  color: Color(0xff385f98),
                  borderRadius: BorderRadius.circular(10)),
              child: Icon(
                Icons.notifications,
                color: Colors.white,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.white,
      ),
     
      body: ListView(
        children: <Widget>[ 

          Column(
            children: <Widget>[
             
              BlogPosts(), 
              Container(
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
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        "See all",
                        style: TextStyle(
                          color: Color(0xff385f98),
                          fontSize: 16.0
                        ),
                      )
                    ],
                  ),
                ),
              ), 
              RecentPosts()
            ],
          ) 
        ],
      ),
    );
  }
}