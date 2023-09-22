// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SimpleUserProfile extends StatelessWidget {
  final String name;
  final String phone;
  SimpleUserProfile({super.key, required this.name, required this.phone});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        backgroundColor: Colors.blue,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ignore: prefer_const_constructors
              CircleAvatar(
                child: ClipOval(
                  child: Icon(
                    Icons.person,
                    size: 110,
                  ),
                ),
                radius: 70,
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Qwitcher Grypen',
                      fontSize: 60,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Text("Software Engineer",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Color.fromARGB(255, 222, 224, 225),
                      )),
                ),
              ),

              Container(
                color: Colors.white,
                margin: EdgeInsets.all(10),
                child: ListTile(
                  leading: Icon(Icons.phone),
                  title: Text(
                    phone,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue[400],
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              Container(
                color: Colors.white,
                margin: EdgeInsets.all(10),
                child: ListTile(
                  leading: Icon(Icons.link),
                  title: Text(
                    "http//:linkedin/$name.com",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue[400],
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              Container(
                color: Colors.white,
                margin: EdgeInsets.all(10),
                child: ListTile(
                  leading: Icon(Icons.map),
                  title: Text(
                    "Atomika",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue[400],
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
