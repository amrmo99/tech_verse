import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:session7test/features/profile/ui/screens/profile_screen.dart';
import 'package:session7test/ui/screens/community_screen.dart';
import 'package:session7test/ui/screens/home_screen.dart';
import 'package:session7test/ui/screens/posts_screen.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout();

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;

  final List<Widget> listOfColors = [
    const HomeScreen(),
    const CommunityScreen(),
    const PostsScreen(),
    const ProfilePage(
      url: "https://cdn-icons-png.flaticon.com/128/2922/2922506.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: currentIndex != 3
            ? AppBar(
                title: Container(
                  height: 40,
                  margin: const EdgeInsets.only(top: 17),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: const Color(0xff385f98)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              'Search',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: const Icon(
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
                      margin: const EdgeInsets.only(top: 15),
                      height: 50,
                      width: 40,
                      decoration: BoxDecoration(
                          color: const Color(0xff385f98),
                          borderRadius: BorderRadius.circular(10),),
                      child: const Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
                backgroundColor: Colors.white,
              )
            : null,
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
              icon: const Icon(Icons.home),
              title: const Text('Home'),
              activeColor: const Color(0xffc64170),
              inactiveColor: const Color(0xff385f98),
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.group),
              title: const Text('Community'),
              activeColor: const Color(0xffc64170),
              inactiveColor: const Color(0xff385f98),
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.note_add_outlined),
              title: const Text('Blogs'),
              activeColor: const Color(0xffc64170),
              inactiveColor: const Color(0xff385f98),
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.person),
              title: const Text('Profile'),
              activeColor: const Color(0xffc64170),
              inactiveColor: const Color(0xff385f98),
            ),
          ],
        ),
      ),
    );
  }
}
