import 'package:flutter/material.dart';
import 'package:session7test/Screens/ProfilPage.dart';

class SocialMedia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedItemIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 8, bottom: 12),
              height: 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            "https://cdn-icons-png.flaticon.com/128/2922/2922506.png"),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 10,
                          child: Icon(
                            Icons.add,
                            size: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                  buildStoryAvatar(
                      "https://images.pexels.com/photos/2169434/pexels-photo-2169434.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=100&w=640"),
                  buildStoryAvatar(
                      "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=100&w=640"),
                  buildStoryAvatar(
                      "https://images.pexels.com/photos/1222271/pexels-photo-1222271.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=100&w=640"),
                  buildStoryAvatar(
                      "https://images.pexels.com/photos/2092474/pexels-photo-2092474.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=100&w=640"),
                  buildStoryAvatar(
                      "https://images.pexels.com/photos/1239291/pexels-photo-1239291.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=100&w=640"),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(top: 8),
                children: [
                  buildPostSection(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxfstFYHEf9_5wZV4PUq_21zgo6HE61XlRe47WxDmzStN6kJDn",
                      "https://images.pexels.com/photos/2379005/pexels-photo-2379005.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=100&w=940"),
                  buildPostSection(
                      "https://pbs.twimg.com/media/EvencD6XIAEXmZO.jpg",
                      "https://images.pexels.com/photos/1222271/pexels-photo-1222271.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=100&w=640"),
                  buildPostSection(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxfstFYHEf9_5wZV4PUq_21zgo6HE61XlRe47WxDmzStN6kJDn",
                      "https://images.pexels.com/photos/1239291/pexels-photo-1239291.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=100&w=640"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildPostSection(String urlPost, String urlProfilePhoto) {
    return Container(
      margin: EdgeInsets.only(bottom: 1),
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(),
          buildPostFirstRow(urlProfilePhoto),
          SizedBox(
            height: 10,
          ),
          buildPostPicture(urlPost),
          SizedBox(
            height: 5,
          ),
          Column(
            children: [
              Text(
                "i have finished my first course, and i got 200 points!",
                style: TextStyle(fontSize: 15, color: Colors.grey[800]),
              ),
              Row(
                children: [
                  Icon(
                    Icons.alarm,
                    size: 17,
                  ),
                  Text(
                    "2m ago  -  ",
                  ),
                  Icon(
                    Icons.group,
                    size: 17,
                  ),
                  Text("with Avery Davis  -  "),
                  Icon(
                    Icons.map_outlined,
                    size: 17,
                  ),
                  Text("nasr city")
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    Icon(Icons.favorite, size: 28, color: Colors.red),
                    Text(
                      "  you & 11 peoples react it",
                    ),
                    SizedBox(
                      width: 45,
                    ),
                    Text(
                      "10 comments",
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }

  Row buildPostFirstRow(String urlProfilePhoto) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ProfilPage(url: urlProfilePhoto)));
              },
              child: Hero(
                tag: urlProfilePhoto,
                child: CircleAvatar(
                  radius: 12,
                  backgroundImage: NetworkImage(urlProfilePhoto),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tom Smith",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Iceland",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[500]),
                ),
              ],
            )
          ],
        ),
        Icon(Icons.more_vert)
      ],
    );
  }

  Stack buildPostPicture(String urlPost) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.width - 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(urlPost),
              )),
        ),
      ],
    );
  }

  Container buildStoryAvatar(String url) {
    return Container(
      margin: EdgeInsets.only(left: 18),
      height: 60,
      width: 60,
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.red),
      child: CircleAvatar(
        radius: 18,
        backgroundImage: NetworkImage(url),
      ),
    );
  }
}
