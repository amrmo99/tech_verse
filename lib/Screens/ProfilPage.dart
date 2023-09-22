import 'package:flutter/material.dart';
import 'package:session7test/Screens/LoginScreen.dart';

class ProfilPage extends StatefulWidget {
  final String url;

  ProfilPage({required this.url});

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  int _selectedItemIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),)),
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                margin: EdgeInsets.only(top: 15),
                height: 50,
                width: 40,
                decoration: BoxDecoration(
                    color: Color(0xff385f98),
                    borderRadius: BorderRadius.circular(10)),
                child: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Hero(
            tag: widget.url,
            child: Container(
              margin: EdgeInsets.only(top: 35),
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 20,
                  )
                ],
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.url),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Tom Smith",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "London, England",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[400],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildStatColumn("53", "Photos"),
              buildStatColumn("223k", "Followers"),
              buildStatColumn("117", "Following"),
            ],
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 8, right: 8, top: 8),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.15),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(25))),
              child: GridView.count(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 5 / 6,
              ),
            ),
          )
        ],
      ),
    );
  }

  Card buildPictureCard(String url) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(url),
            )),
      ),
    );
  }

  Column buildStatColumn(String value, String title) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.grey[400],
          ),
        ),
      ],
    );
  }
}
