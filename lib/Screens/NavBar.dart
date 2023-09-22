import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:session7test/Screens/BlogsScreen.dart';
import 'package:session7test/Screens/Community.dart';
import 'package:session7test/Screens/ProfilPage.dart';
import 'package:session7test/Screens/ShopScreen.dart';

class MyNevBar extends StatefulWidget {
  @override
  _MyNevBarState createState() => _MyNevBarState();
}

class _MyNevBarState extends State<MyNevBar> {
  int currentIndex = 0;

  List listOfColors = [
    ShopScreen(),
    SocialMedia(),
    BlogsScreen(),
    ProfilPage(
      url: "https://cdn-icons-png.flaticon.com/128/2922/2922506.png",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: listOfColors[currentIndex],
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        onItemSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              activeColor: Color(0xffc64170),
              inactiveColor: Color(0xff385f98)),
          BottomNavyBarItem(
              icon: Icon(Icons.group),
              title: Text('Community'),
              activeColor: Color(0xffc64170),
              inactiveColor: Color(0xff385f98)),
          BottomNavyBarItem(
              icon: Icon(Icons.note_add_outlined),
              title: Text('Blogs'),
              activeColor: Color(0xffc64170),
              inactiveColor: Color(0xff385f98)),
          BottomNavyBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
              activeColor: Color(0xffc64170),
              inactiveColor: Color(0xff385f98)),
        ],
      ),
    );
  }
}
